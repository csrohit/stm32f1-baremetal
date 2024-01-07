/**
 * @file main.h
 * @author Rohit Nimkar (nehalnimkar@gmail.com)
 * @brief Header file for the functions used in the main.c source file
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

#ifndef __MAIN_H__

#define __MAIN_H__
int main(void);

/**
 * @brief enable clock for dma1 peripheral registers
 */
void dma1_clock_enable(void);
/**
 * @brief Configure DMA1 channel 4 to work with USART1 transmitter
 * It reads from memory and writes to USART data register
 */
void dma_usart_tx_init(void);

/**
 * @brief Configure DMA1 channel 5 to work with USART1 receiver
 * It reads from USART data register and writes to memory
 */
void dma_usart_rx_init(void);

/**
 * @brief Enable DMA to accept request for channel 4
 */
void dma_usart_tx_enable(void);

/**
 * @brief Disable DMA to accept request for Channel 4
 * 
 */
void dma_usart_tx_disable(void);

/**
 * @brief Enable DMA to accept request for channel 5
 */
void dma_usart_rx_enable(void);

/**
 * @brief Disable DMA to accept request for Channel 5
 * 
 */
void dma_usart_rx_disable(void);

/**
 * @brief Configure USART1 on PA9 and PA10
 * Enable Transmitter with DMA
 */
void usart1_init(void);

/**
 * @brief Enable USART1 prescalers and output
 */
void usart1_enable(void);

/**
 * @brief Interrupt handler for DMA channel 4
 * 
 */
void DMA1_Channel4_IRQHandler(void);

/**
 * @brief Interrupt handler for DMA channel 4
 * 
 */
void DMA1_Channel5_IRQHandler(void);

#endif