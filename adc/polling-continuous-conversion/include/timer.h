#ifndef __TIMER_H__
#define __TIMER_H__
/**
 * @file     timer.h
 * @author   Rohit Nimkar <https://www.linkedin.com/in/rohit-nimkar>
 * @brief    Timer api declaration
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

#include "timer.h"

/**
 * @brief
 * Stores number of systick interrupts
 */
static volatile uint32_t msTicks;

/**
 * @brief Add blocking delay
 * @param ms delay in milliseconds
 */
void delay(uint32_t ms);

/**
 * @brief
 * Interrupt handler function
 */
void SysTick_Handler(void);

#endif /* __TIMER_H__ */
