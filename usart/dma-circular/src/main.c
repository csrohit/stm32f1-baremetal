/**
 * @file main.c
 * @author Rohit Nimkar (nehalnimkar@gmail.com)
 * @brief Main program body
 * @version 1.2
 * @date 2022-12-07
 * 
 * @copyright Copyright (c) 2022
 * @attention
 * 
 * This software component is licensed by Rohit Nimkar under BSD 3-Clause license,
 * the "License"; You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at: opensource.org/licenses/BSD-3-Clause
 *
 */

#include <stdint.h>

#include "stm32f1xx.h"
#include "timer.h"
#include "main.h"

const char * msg = "Hello world\r\n\0";

void dma1_clock_enable(void)
{
	RCC->AHBENR |= RCC_AHBENR_DMA1EN;
}

void dma_usart_tx_init(void)
{
	// USART TX is mapped to DMA1 channel 4
	// set peripheral address to USART data register
	DMA1_Channel4->CPAR = (uint32_t)&USART1->DR;

	// set memory address to address of string
	DMA1_Channel4->CMAR = (uint32_t)msg;

	// set number od dma transactions
	DMA1_Channel4->CNDTR = 13;

	// set priprity to lowest value
	DMA1_Channel4->CCR &= ~(DMA_CCR_PL_0 | DMA_CCR_PL_1);

	// set data transfer direction - memory -> peripheral
	DMA1_Channel4->CCR |= DMA_CCR_DIR;

	// set memory address size to 8 bits (Address is incremented by this much)
	DMA1_Channel4->CCR &= ~(DMA_CCR_MSIZE_0 | DMA_CCR_MSIZE_0);

	// set peripheral size to 8 bits (Has no effect as this is not incremented)
	DMA1_Channel4->CCR &= ~(DMA_CCR_PSIZE_0 | DMA_CCR_PSIZE_0);

	// set memory address incement by 1byte
	DMA1_Channel4->CCR |= DMA_CCR_MINC;

	// disable increment mode on peripheral address
	DMA1_Channel4->CCR &= ~DMA_CCR_PINC;

	// enable circular mode
	DMA1_Channel4->CCR |= DMA_CCR_CIRC;

	// enable interrpt after full transfer
	DMA1_Channel4->CCR |= DMA_CCR_TCIE;
}

void dma_usart_tx_enable(void)
{
	DMA1_Channel4->CCR |= DMA_CCR_EN;
}

void usart1_init(void)
{
	// enable clock for GPIOA and USART1
	RCC->APB2ENR |= RCC_APB2ENR_USART1EN | RCC_APB2ENR_IOPAEN;

	// reset pin configurations for PA9 and PA10
	GPIOA->CRH &= ~(GPIO_CRH_MODE10 | GPIO_CRH_MODE9 | GPIO_CRH_CNF10 | GPIO_CRH_CNF9);

	// PA9 as Output@50Hz Alternate function
	GPIOA->CRH |= GPIO_CRH_MODE9_0 | GPIO_CRH_MODE9_1 | GPIO_CRH_CNF9_1;

	// PA10 as floating input
	GPIOA->CRH |= GPIO_CRH_CNF10_0;

	// set baud rate as 9600
	uint32_t baud = (uint32_t)(SystemCoreClock / 115200);
	USART1->BRR = baud;

	// Enable transmitter
	USART1->CR1 |= USART_CR1_TE;

	// Enable DMA mode for transmitter
	USART1->CR3 |= USART_CR3_DMAT;
}

void usart1_enable(void)
{
	USART1->CR1 |= USART_CR1_UE;
}

int main(void)
{
	dma1_clock_enable();
	usart1_init();
	dma_usart_tx_init();
	dma_usart_tx_enable();
	usart1_enable();
	while (1);
}
