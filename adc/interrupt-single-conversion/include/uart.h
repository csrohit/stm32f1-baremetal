#ifndef __UART_H__
#define __UART_H__
/**
 * @file     uart.h
 * @author   Rohit Nimkar <https://www.linkedin.com/in/rohit-nimkar>
 * @brief    USART apis
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

#include <stm32f1xx.h>

extern uint32_t SystemCoreClock;

/**
 * @brief
 *   Initialize USART1 peripheral
 *
 * @param [in] 
 *   baudrate baudrate to be configurate
 */
static inline void USART1_init(uint32_t baudrate)
{
    // enable clock for GPIOA and USART1
    RCC->APB2ENR |= RCC_APB2ENR_USART1EN | RCC_APB2ENR_IOPAEN;

    // reset pin configurations for PA9 and PA10
    GPIOA->CRH &= ~(GPIO_CRH_MODE10 | GPIO_CRH_MODE9 | GPIO_CRH_CNF10 | GPIO_CRH_CNF9);

    // PA9 as Output@50Hz Alternate function
    GPIOA->CRH |= GPIO_CRH_MODE9_0 | GPIO_CRH_MODE9_1 | GPIO_CRH_CNF9_1;

    // PA10 as floating input
    GPIOA->CRH |= GPIO_CRH_CNF10_0;

    uint32_t baud = (uint32_t)(SystemCoreClock / baudrate);

    USART1->BRR = baud;

    // transmitter enable, receiver enable, receiver interrupt enable and USART enable
    USART1->CR1 = USART_CR1_TE | USART_CR1_RE | USART_CR1_RXNEIE | USART_CR1_UE;

    // enable USART1 interrupt
    NVIC_EnableIRQ(USART1_IRQn);
}

/**
 * @brief Transmit 1 character
 *
 * @param c character to be transmitted
 */
void USART1_putc(char c);

/**
 * @brief Transmit string
 *
 * @param str pointer to the string
 */
void USART1_puts(const char *str);

/**
 * @brief Interrupt service routine for USART1 related interrupts
 *
 */
void USART1_IRQHandler(void);

#endif
