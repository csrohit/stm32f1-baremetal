/**
 * @file dma.h
 * @author Rohit Nimkar (nehalnimkar@gmail.com)
 * @brief Function declarations and inline function definitions for timing related functions
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

#include<stdint.h>

#ifndef __TIMER_H__
#define __TIMER_H__

/**
 * @brief Stores number of systick interrupts
 * 
 */
extern volatile uint32_t msTicks;

/**
 * @brief Generate delay in milloseconds
 * 
 * @param ms number of milliseconds
 */
void delay(uint32_t ms);

/**
 * @brief Interrupt handler for systick timer
 * should not be made inline as address of this handler is to be placed in the vector table
 */
void SysTick_Handler(void);

#endif