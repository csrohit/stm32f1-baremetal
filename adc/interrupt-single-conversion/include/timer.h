#include <stdint.h>

#ifndef __TIMER_H__
#define __TIMER_H__

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