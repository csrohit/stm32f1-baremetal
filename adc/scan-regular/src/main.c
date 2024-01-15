/**
 * @file     main.c
 * @author   Rohit Nimkar <https://www.linkedin.com/in/rohit-nimkar>
 * @brief    Read analog values from sensors connected to PA1 & PA2 and
 *           log the converted values over USART
 *
 * @version  1.3
 * @date     2024-01-15
 *
 * @copyright Copyright (c) 2024
 *
 * @attention
 * This software component is licensed by Rohit Nimkar under BSD 3-Clause license,
 * the "License"; You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at: opensource.org/licenses/BSD-3-Clause
 *
 */

#include <stdint.h>

#include "main.h"
#include "printf.h"
#include "timer.h"
#include "uart.h"

/**
 * @brief 
 *   Handler for DMA1_Channel1 interrupts
 */
void DMA1_Channel1_IRQHandler(void);

/**
 * @brief 
 *   Initialize DMA Channel 1
 */
static inline void initDMAChannelForADC(void);

/**
 * @brief 
 *   Enable DMA Channel
 */
static inline void disableDMAChannel(void);

/**
 * @brief 
 *   Disable DMA Channel
 */
static inline void enableDMAChannel(void);

/**
 * @brief 
 *   Reload no. of transfers in the counter registers
 */
static inline void reloadDMACounter(void);

/**
 * @brief 
 *   Initialize ADC1 to convert Channel 1 & 2 (PA1 & PA2)
 *   & generate DMA request after each transfer
 */
static inline void initADCWithDMARequest(void);

/**
 * @brief 
 *   Start ADC conversion
 */
static inline void startADCConversion(void);

uint32_t SystemCoreClock     = 8000000U; /**< Global indentifier for clock frequency */
char     msg[28]             = {};       /**< Buffer for message*/
uint16_t adc_value[2]        = {0U};     /**< 12 bit adc value */
int      bConversionComplete = 0;        /**< flag to check if adc conversion is complete */

/**
 * @brief
 *   Configure and initialize clock for SYSCLK = 72MHz
 */
void init_clock(void)
{
    /* Set 2 wait states for clock 48MHZ < SYSCLK < 72MHZ */
    FLASH->ACR |= FLASH_ACR_LATENCY_2;

    /* APB low speed prescalar (APB1 = HCLK/2)*/
    RCC->CFGR |= RCC_CFGR_PPRE1_2;

    /* HSE divider for PLL Entry (HSE/1) */
    RCC->CFGR |= RCC_CFGR_PLLXTPRE_HSE;

    /* Enable HSE clock and wait for it becode stable */
    RCC->CR |= RCC_CR_HSEON;
    while (!(RCC->CR & RCC_CR_HSERDY))
        ; // wait for the HSEREADY flag

    /* PLL Entry clock source (HSE)*/
    RCC->CFGR |= RCC_CFGR_PLLSRC;

    /* PLL Multiplication factor (x9)*/
    RCC->CFGR |= RCC_CFGR_PLLMULL9;

    /* Enable PLL and wait for it to become stable */
    RCC->CR |= RCC_CR_PLLON;
    while (!(RCC->CR & RCC_CR_PLLRDY))
        ; // wait for the PLLRDY flag

    /* Set PLL as system clock source and wait for it to be stable */
    RCC->CFGR |= RCC_CFGR_SW_PLL;
    while (!(RCC->CFGR & RCC_CFGR_SWS_PLL))
        ; // wait for PLL to be CLK

    /* Update global clock variable */
    SystemCoreClock = 72000000U;
}

void DMA1_Channel1_IRQHandler(void)
{
    if (DMA1->ISR & DMA_ISR_TCIF1)
    {
        /* Acknowledge Transfer Complete interrupt */
        DMA1->IFCR |= DMA_IFCR_CTCIF1;
        bConversionComplete = 1;
    }
}

static void initDMAChannelForADC(void)
{
    /* Enable DMA clock */
    RCC->AHBENR |= RCC_AHBENR_DMA1EN;

    /* Set peripheral address as ADC data register */
    DMA1_Channel1->CPAR  = (uint32_t)&ADC1->DR;

    /* Set memory address as adc_value buffer */
    DMA1_Channel1->CMAR  = (uint32_t)adc_value;

    /* Set number of transfers */
    DMA1_Channel1->CNDTR = 2U;

    /* Set lowest priority */
    DMA1_Channel1->CCR &= ~DMA_CCR_PL;

    /* Set memory size = 16 bits */
    DMA1_Channel1->CCR &= ~DMA_CCR_MSIZE;
    DMA1_Channel1->CCR |= DMA_CCR_MSIZE_0;

    /* Set peripheral size=16bits */
    DMA1_Channel1->CCR &= ~DMA_CCR_PSIZE;
    DMA1_Channel1->CCR |= DMA_CCR_PSIZE_0;
    
    /* Enable memory increment */
    DMA1_Channel1->CCR |= DMA_CCR_MINC;

    /* Disable perpheral increment */
    DMA1_Channel1->CCR &= ~DMA_CCR_PINC;

    /* Set transfer direction : Peripheral -> Memory */
    DMA1_Channel1->CCR &= ~DMA_CCR_DIR;

    /* Enable transfer complete interrupt */
    DMA1_Channel1->CCR |= DMA_CCR_TCIE;
    NVIC_EnableIRQ(DMA1_Channel1_IRQn);
}

/**
 * @brief 
 *   Disable DMA Channel
 */
static inline void disableDMAChannel(void)
{
    DMA1_Channel1->CCR &= ~DMA_CCR_EN;
}

/**
 * @brief 
 *   Enable DMA Channel
 */
static inline void enableDMAChannel(void)
{
    DMA1_Channel1->CCR |= DMA_CCR_EN;
}

/**
 * @brief 
 *   Reset the transfer counter register
 */
static inline void reloadDMACounter(void)
{
    disableDMAChannel();
    DMA1_Channel1->CNDTR = 2;
    enableDMAChannel();
}

/**
 * @brief
 *   Configure ADC in continuous mode
 */
static inline void initADCWithDMARequest(void)
{
    /* Set ADC prescalar (ADCCLK = APB2CLK/6) */
    RCC->CFGR |= RCC_CFGR_ADCPRE_DIV6;

    /* Enable clock for ADC & PortA */
    RCC->APB2ENR |= RCC_APB2ENR_ADC1EN | RCC_APB2ENR_IOPAEN;

    /* Configure PA1 & PA2 in analog input mode */
    GPIOA->CRL &= ~(GPIO_CRL_CNF1 | GPIO_CRL_MODE1);
    GPIOA->CRL &= ~(GPIO_CRL_CNF2 | GPIO_CRL_MODE2);

    /* Set total conversions = 2 */
    ADC1->SQR1 &= ~ADC_SQR1_L;
    ADC1->SQR1 |= 1 << ADC_SQR1_L_Pos;

    /* Set Channel1 as first conversion & Channel2 as second */
    ADC1->SQR3 &= ~(ADC_SQR3_SQ1 | ADC_SQR3_SQ2);
    ADC1->SQR3 |= 1 << ADC_SQR3_SQ1_Pos;
    ADC1->SQR3 |= 2 << ADC_SQR3_SQ2_Pos;

    /* Set sampling time = 28.5 cycles*/
    ADC1->SMPR2 |= (ADC_SMPR2_SMP1_1 | ADC_SMPR2_SMP1_0);
    ADC1->SMPR2 |= (ADC_SMPR2_SMP2_1 | ADC_SMPR2_SMP2_0);

    /* Wake up from power down mode*/
    ADC1->CR2 |= (ADC_CR2_ADON);

    /* Enable SCAN mode */
    ADC1->CR1 |= ADC_CR1_SCAN;

    /* Set right data alignment */
    ADC1->CR2 &= ~ADC_CR2_ALIGN;

    /* Enable DMA request generation */
    ADC1->CR2 |= ADC_CR2_DMA;

    /* Reset Caliberation registers */
    ADC1->CR2 |= (ADC_CR2_RSTCAL);
    while (ADC1->CR2 & ADC_CR2_RSTCAL)
        ;

    /* Start caliberation */
    ADC1->CR2 |= (ADC_CR2_CAL);
    while (ADC1->CR2 & ADC_CR2_CAL)
        ;
}

/**
 * @brief 
 *   Start the ADC conversion
 */
static inline void startADCConversion(void)
{
    ADC1->CR2 |= ADC_CR2_ADON;
}

int main(void)
{
    init_clock();

    int ret = SysTick_Config(SystemCoreClock / 1000);
    if (ret < 0)
        while (1)
            ;

    USART1_init(9600U);
    initDMAChannelForADC();
    initADCWithDMARequest();

    /* Start conversion */
    enableDMAChannel();
    startADCConversion();

    USART1_puts("ADC multiple channel conversion using SCAN mode:\r\n");
    while (1)
    {
        if (1 == bConversionComplete)
        {
            sprintf_(msg, "LDR: %04hu, Pot: %04hu\r\n", adc_value[0], adc_value[1]);
            USART1_puts(msg);
            bConversionComplete = 0;
            delay(500);
            reloadDMACounter();
            startADCConversion();
        }
    }
}

