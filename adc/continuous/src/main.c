/**
 **********************************************************************************
 * @file         : main.c
 * @author		: Rohit Nimkar <nehalnimkar@gmail.com> <https://csrohit.github.io>
 * @brief       : Main program body
 **********************************************************************************
 * @attention
 *
 * This software component is licensed by Rohit Nimkar under BSD 3-Clause license,
 * the "License"; You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at:
 *                        opensource.org/licenses/BSD-3-Clause
 *
 **********************************************************************************
 */

#include <stdint.h>

#include "printf.h"
#include "stm32f1xx.h"
#include "timer.h"
#include "uart.h"
#include "main.h"

/**
 * @brief
 * Global indentifier for clock frequency
 */
uint32_t SystemCoreClock = 8000000U;

/**
 * @brief
 * Buffer for message
 */
char msg[28];

/**
 * @brief
 * Configure and initialize clock for SYSCLK = 72MHz
 */
void init_clock(void)
{
    FLASH->ACR |= FLASH_ACR_LATENCY_2;  // Two wait states, per datasheet
    RCC->CFGR |= RCC_CFGR_PPRE1_2;      // prescale AHB1 = HCLK/2
    RCC->CFGR |= RCC_CFGR_PLLXTPRE_HSE; // PREDIV1 = 0
    RCC->CR |= RCC_CR_HSEON;            // enable HSE clock
    while (!(RCC->CR & RCC_CR_HSERDY))
        ; // wait for the HSEREADY flag

    RCC->CFGR |= RCC_CFGR_PLLSRC;   // set PLL source to HSE
    RCC->CFGR |= RCC_CFGR_PLLMULL9; // multiply by 9
    RCC->CR |= RCC_CR_PLLON;        // enable the PLL
    while (!(RCC->CR & RCC_CR_PLLRDY))
        ; // wait for the PLLRDY flag

    RCC->CFGR |= RCC_CFGR_SW_PLL; // set clock source to pll

    while (!(RCC->CFGR & RCC_CFGR_SWS_PLL))
        ; // wait for PLL to be CLK

    SystemCoreClock = 72000000;
}

/**
 * @brief
 * Configure ADC in continuous mode
 */
void init_adc(void)
{
    /* Set ADC prescalar*/
    RCC->CFGR |= RCC_CFGR_ADCPRE_DIV6;

    /* Enable clock for ADC & PortA */
    RCC->APB2ENR |= RCC_APB2ENR_ADC1EN | RCC_APB2ENR_IOPAEN;

    /* COnfigure PA0 in analog input mode */
    GPIOA->CRL &= ~(GPIO_CRL_CNF0 | GPIO_CRL_MODE0);

    /* Set sampling time = 28.5 cycles*/
    ADC1->SMPR2 |= (ADC_SMPR2_SMP0_1 | ADC_SMPR2_SMP0_0);

    /* Put adc in Continuous mode and wake up from power down mode*/
    ADC1->CR2 |= (ADC_CR2_CONT | ADC_CR2_ADON);

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

int main(void)
{
    init_clock();
    init_adc();
    USART1_init(9600U);

    int ret = SysTick_Config(SystemCoreClock / 1000);
    if (ret < 0)
        while (1)
            ;

    while (1)
    {
        uint16_t adc_value = ADC1->DR;
        sprintf_(msg, "Digital value: %hu\r\n", adc_value);
        USART1_puts(msg);
        delay(500U);
    }
}
