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

#define RX_LEN 10
#define TX_LEN RX_LEN + 2

char msg[TX_LEN];

void DMA1_Channel4_IRQHandler(void)
{
	if (DMA1->ISR & DMA_ISR_TCIF4)
	{
		// clear interrupt flasg
		DMA1->IFCR |= DMA_IFCR_CGIF4;
		dma_usart_tx_disable();
		dma_usart_rx_enable();
	}
}

void DMA1_Channel5_IRQHandler(void)
{
	if (DMA1->ISR & DMA_ISR_TCIF5)
	{
		// clear interrupt flasg
		DMA1->IFCR |= DMA_IFCR_CGIF5;
		dma_usart_rx_disable();
		dma_usart_tx_enable();
	}
}


int main(void)
{
	// add newline and carriage return characters at the end of received data
	msg[RX_LEN] = '\r';
	msg[RX_LEN + 1] = '\n';

	// initialize systick timer
	SysTick_Config(SystemCoreClock / 1000);

	// enable clock for dma
	dma1_clock_enable();

	// initialize usart, dma tx and dma rx
	usart1_init();
	dma_usart_tx_init();
	dma_usart_rx_init();

	// enable interrupt for channel 4 and channel 5
	NVIC_EnableIRQ(DMA1_Channel4_IRQn);
	NVIC_EnableIRQ(DMA1_Channel5_IRQn);

	// enable usart. dma rx
	dma_usart_rx_enable();
	usart1_enable();

	while (1)
	{
		delay(2000);
	}
	
}

void dma1_clock_enable(void)
{
	RCC->AHBENR |= RCC_AHBENR_DMA1EN;
}

/* DMA transmitter */
void dma_usart_tx_init(void)
{
	// USART TX is mapped to DMA1 channel 4
	// set peripheral address to USART data register
	DMA1_Channel4->CPAR = (uint32_t)&USART1->DR;

	// set memory address to address of string
	DMA1_Channel4->CMAR = (uint32_t)msg;

	// set memory address incement by 1byte
	DMA1_Channel4->CCR |= DMA_CCR_MINC;

	// set data transfer direction - memory -> peripheral
	DMA1_Channel4->CCR |= DMA_CCR_DIR;

	// enable transmission complete interrupt
	DMA1_Channel4->CCR |= DMA_CCR_TCIE;
}

void dma_usart_tx_enable(void)
{
	DMA1_Channel4->CNDTR = TX_LEN;
	DMA1_Channel4->CCR |= DMA_CCR_EN;
}

void dma_usart_tx_disable(void)
{
	DMA1_Channel4->CCR &= ~DMA_CCR_EN;
}

/* DMA receiver */
void dma_usart_rx_init(void)
{
	// USART RX is mapped to DMA1 channel 5
	// set peripheral address to USART data register
	DMA1_Channel5->CPAR = (uint32_t)&USART1->DR;

	// set memory address to address of string
	DMA1_Channel5->CMAR = (uint32_t)msg;

	// set memory address incement by 1byte
	DMA1_Channel5->CCR |= DMA_CCR_MINC;

	// set data transfer direction - peripheral -> memory
	DMA1_Channel5->CCR &= ~DMA_CCR_DIR;

	// enable transmission complete interrupt
	DMA1_Channel5->CCR |= DMA_CCR_TCIE;
}

void dma_usart_rx_enable(void)
{
	DMA1_Channel5->CNDTR = RX_LEN;
	DMA1_Channel5->CCR |= DMA_CCR_EN;
}

void dma_usart_rx_disable(void)
{	DMA1_Channel5->CCR &= ~DMA_CCR_EN;
}

/* USART */
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

	// Enable transmitter and receiver
	USART1->CR1 |= USART_CR1_TE | USART_CR1_RE;

	// Enable DMA mode for transmitter and receiver
	USART1->CR3 |= USART_CR3_DMAT | USART_CR3_DMAR;
}

void usart1_enable(void)
{
	USART1->CR1 |= USART_CR1_UE;
}