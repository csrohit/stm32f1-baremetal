/**
 * @file     uart.c
 * @author   Rohit Nimkar <https://www.linkedin.com/in/rohit-nimkar>
 * @brief    USART api definition
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
#include <uart.h>

void USART1_putc(char c)
{
    // wait for tx data register to be empty
    while (!(USART1->SR & USART_SR_TXE))
        ;
    USART1->DR = 0x000000ff & c;
}

void USART1_puts(const char *ch)
{
    while (*ch)
    {
        USART1_putc(*ch);
        ch++;
    }
}

void USART1_IRQHandler(void)
{
    if (USART1->SR & USART_SR_RXNE)
    {
        // this clears RXNE flag
        USART1_putc(USART1->DR & 0xff);
    }
}
