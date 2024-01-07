/**
 * @file timer.c
 * @author Rohit Nimkar (nehalnimkar@gmail.com)
 * @brief Function definitions related to delay and SysTick timer
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
#include<timer.h>

volatile uint32_t msTicks = 0;

void SysTick_Handler(void)
{
	msTicks++;
}

void delay(uint32_t ms)
{
	uint32_t expected_ticks = msTicks + ms;
	while (msTicks < expected_ticks)
	{
		__asm("nop");
	}
}