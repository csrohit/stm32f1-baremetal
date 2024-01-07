/**
 ******************************************************************************
 * @file           : main.c
 * @author         : Rohit Nimkar <nehalnimkar@gmail.com> <https://csrohit.github.io>
 * @brief          : Main program body
 ******************************************************************************
 */

#include <stm32f1xx.h>
#include <delay.h>



int main(void)
{
	RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;
	GPIOC->CRH = 0x02 << ((13 - 8) << 2);
	while(1){
		GPIOC->ODR ^= 1 << 13;
		ms_delay(1000);
	}
}
