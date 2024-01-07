/**
 ******************************************************************************
 * @file           : main.c
 * @author         : Rohit Nimkar <nehalnimkar@gmail.com> <https://csrohit.github.io>
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * This software component is licensed by Rohit Nimkar under BSD 3-Clause license,
 * the "License"; You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at:
 *                        opensource.org/licenses/BSD-3-Clause
 *
 ******************************************************************************
 */

#include <stdint.h>
#include <stdio.h>
#include <stm32f1xx.h>

#include <timer.h>
#include <uart.h>

char msg[28];

int main(void)
{
	USART1_init(9600U);
	
	int ret = SysTick_Config(SystemCoreClock/1000);
	if (ret < 0)
		while (1)
			;

	while (1)
	{	
		sprintf(msg, "Time elapsed: %lu ms\r\n", msTicks);
		USART1_puts(msg);
		delay(5000U);
	}
	
	
}
