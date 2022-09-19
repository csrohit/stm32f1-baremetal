/**
 ******************************************************************************
 * @file           : main.c
 * @author         : Rohit Nimkar <nehalnimkar@gmail.com> <https://csrohit.github.io>
 * @brief          : Main program body
 ******************************************************************************
 */

#include <stm32f1xx.h>

/**
 * @brief Add blocking delay
 *
 * @param ms number of milliseconds
 */
void ms_delay(int ms)
{
    while (ms-- > 0)
    {
        volatile int x = 500;
        while (x-- > 0)
            __asm("nop");
    }
}

/**
 * @brief Initialise GPIOC pin 13
 * - Enable clock for GPIOC
 * - set pin13 as push pull output
 */
void led_init(){
	RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;
	GPIOC->CRH = 0x02 << ((13 - 8) << 2);
}

/**
 * @brief Set GPIOC pin 13
 * 
 */
void led_on(){
	GPIOC->BSRR = 1 << 13;
}

/**
 * @brief Reset GPIOC pin 13
 * 
 */
void led_off(){
	GPIOC->BRR = 1 << 13;
}


int main(void)
{
	led_init();
	while(1){
		led_on();
		ms_delay(500);
		led_off();
		ms_delay(500);
	}
}
