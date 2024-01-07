/**
 * @file     timer.c
 * @author   Rohit Nimkar <https://www.linkedin.com/in/rohit-nimkar>
 * @brief    Timer api definition
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

#include <timer.h>

static volatile uint32_t msTicks = 0;

inline void SysTick_Handler(void)
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
