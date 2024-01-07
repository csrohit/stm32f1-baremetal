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
#include <stdio.h>
#include <stm32f1xx.h>
#include <timer.h>
#include <main.h>

const char *msg = "Hello world\r\n\0";

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

	// set memory address incement by 1byte
	DMA1_Channel4->CCR |= DMA_CCR_MINC;

	// enable circular mode
	// DMA1_Channel4->CCR |= DMA_CCR_CIRC;

	// set data transfer direction - memory -> peripheral
	DMA1_Channel4->CCR |= DMA_CCR_DIR;

	// enable transmission complete interrupt
	DMA1_Channel4->CCR |= DMA_CCR_TCIE;
}

void dma_usart_tx_enable(void)
{
	DMA1_Channel4->CCR |= DMA_CCR_EN;
}

void dma_usart_tx_disable(void)
{
	DMA1_Channel4->CCR &= ~DMA_CCR_EN;
}

void DMA1_Channel4_IRQHandler(void)
{
	if (DMA1->ISR & DMA_ISR_TCIF4)
	{
		// clear interrupt flasg
		DMA1->IFCR |= DMA_IFCR_CGIF4;
		dma_usart_tx_disable();
	}
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
	SysTick_Config(SystemCoreClock/1000);

	dma1_clock_enable();
	usart1_init();
	dma_usart_tx_init();
	dma_usart_tx_enable();
	usart1_enable();

	// enable interrupt for channel 4
	NVIC_EnableIRQ(DMA1_Channel4_IRQn);
	
	dma_usart_tx_enable();

	usart1_enable();

	while (1)
	{
		delay(2000);

		// reload no. of transactions
		DMA1_Channel4->CNDTR = 13;
		dma_usart_tx_enable();
	}
}