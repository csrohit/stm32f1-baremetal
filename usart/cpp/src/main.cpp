/**
 * @file main.cpp
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
#include <stm32f1xx.h>
#include <system.hpp>
#include <usart.hpp>

const char *msg = "Hello World\r\n\0";

int main(void)
{
	USART &ttl = *new (USART::Usart1) USART;

	ttl.set_baudrate(USART::BR_9600);
	ttl.setTransmitterState(USART::Enabled);
	ttl.setUsartState(USART::Enabled);

	int ret = SysTick_Config(8000);
	if (ret < 0)
		while (1)
			;

	while (1)
	{
		ttl.tx_str(msg);

		delay_ms(2000U);
	}
}
