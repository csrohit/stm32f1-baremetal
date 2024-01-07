/**
 * @file     main.c
 * @author   Rohit Nimkar <https://www.linkedin.com/in/rohit-nimkar>
 * @brief    Log adc value on USART after conversion is complete
 * @version  1.3
 * @date     2024-01-06
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
#include "stm32f1xx.h"
#include "timer.h"
#include "uart.h"

void ADC_IRQHandler(void);

uint32_t SystemCoreClock     = 8000000U; /**< Global indentifier for clock frequency */
char     msg[28]             = {};       /**< Buffer for message*/
uint16_t adc_value           = 0U;       /**< 12 bit adc value */
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

/**
 * @brief
 *   Configure ADC in continuous mode
 */
void init_adc(void)
{
    /* Set ADC prescalar (ADCCLK = APB2CLK/6) */
    RCC->CFGR |= RCC_CFGR_ADCPRE_DIV6;

    /* Enable clock for ADC & PortA */
    RCC->APB2ENR |= RCC_APB2ENR_ADC1EN | RCC_APB2ENR_IOPAEN;

    /* Configure PA0 in analog input mode */
    GPIOA->CRL &= ~(GPIO_CRL_CNF0 | GPIO_CRL_MODE0);

    /* Set sampling time = 28.5 cycles*/
    ADC1->SMPR2 |= (ADC_SMPR2_SMP0_1 | ADC_SMPR2_SMP0_0);
    ADC1->CR1 |= ADC_CR1_EOCIE;

    /* Wake up from power down mode*/
    ADC1->CR2 |= (ADC_CR2_ADON);
    NVIC_EnableIRQ(ADC1_IRQn);

    /* Set right data alignement */
    ADC1->CR2 &= ~ADC_CR2_ALIGN;

    /* Reset Caliberation registers */
    ADC1->CR2 |= (ADC_CR2_RSTCAL);
    while (ADC1->CR2 & ADC_CR2_RSTCAL)
        ;

    /* Start caliberation */
    ADC1->CR2 |= (ADC_CR2_CAL);
    while (ADC1->CR2 & ADC_CR2_CAL)
        ;

    /* Start conversion */
    ADC1->CR2 |= ADC_CR2_ADON;
}

void ADC_IRQHandler(void)
{
    bConversionComplete = 1;
    adc_value           = ADC1->DR;
}

int main(void)
{
    init_clock();
    USART1_init(9600U);

    int ret = SysTick_Config(SystemCoreClock / 1000);
    if (ret < 0)
        while (1)
            ;

    init_adc();
    USART1_puts("ADC single conversion mode using interrupt \r\n");
    while (1)
    {
        if (1 == bConversionComplete)
        {
            sprintf_(msg, "Digital value: %hu\r\n", adc_value);
            USART1_puts(msg);
            bConversionComplete = 0;
        }
    }
}
