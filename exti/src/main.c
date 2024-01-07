/**
 * @file     main.c
 * @author   Rohit Nimkar <https://www.linkedin.com/in/rohit-nimkar>
 * @brief    Blink LED when switch connected to PA0 is pressed
 * @version  1.2
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

#include <stm32f1xx.h>
volatile int flag = 0;

void ms_delay(int ms)
{
    while (ms-- > 0)
    {
        volatile int x = 1000;
        while (x-- > 0)
            __asm("nop");
    }
}

void EXTI0_IRQHandler()
{
    /* Acknowledge inetrrupt */
    EXTI->PR |= EXTI_PR_PR0;
    flag = 1;
}

int main(void)
{
    /* Enable clock for port C & A */
    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN | RCC_APB2ENR_IOPCEN;

    /* Set PC13 as General Purpose Output @2MHZ */
    GPIOC->CRH &= ~(GPIO_CRH_CNF13 | GPIO_CRH_MODE13);
    GPIOC->CRH |= GPIO_CRH_MODE13_1;

    /* Set PA0 as Pull up Input */
    GPIOC->CRL &= ~(GPIO_CRL_CNF0 | GPIO_CRL_MODE0);

    /* Set PA0 as source of EXTI0 */
    AFIO->EXTICR[0] &= ~(AFIO_EXTICR1_EXTI0_PA);

    /* Unmask interrupt on Line0 */
    EXTI->IMR |= EXTI_IMR_MR0;

    /* Set EXTI0 trigger as falling edge */
    EXTI->FTSR |= EXTI_FTSR_FT0;

    /* Enable EXTI0 interrupt */
    NVIC_EnableIRQ(EXTI0_IRQn);

    /* Set bit corresponding to PC13 */
    GPIOC->BSRR = GPIO_BSRR_BS13;

    while (1)
    {
        if (flag == 1)
        {
            /* Reset bit corresponding to PC13 */
            GPIOC->BRR = GPIO_BRR_BR13;
            ms_delay(1000);

            flag = 0;
            /* Set bit corresponding to PC13 */
            GPIOC->BSRR = GPIO_BSRR_BS13;
        }
    }
}
