#pragma once
#include<stdint.h>

/**
 * @brief Stores number of systick interrupts
 * 
 */
extern volatile uint32_t msTicks;


/**
 * @brief Add blocking delay
 *
 * @param ms delay in milliseconds
 */
void delay(uint32_t ms);


/**
 * @brief Interrupt handler function
 * 
 */
void SysTick_Handler(void);