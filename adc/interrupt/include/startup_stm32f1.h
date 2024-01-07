#ifndef __STARTUP_STM32F1_H__
#define __STARTUP_STM32F1_H__
/**
 * @file     startup_stm32f1.h
 * @author   Rohit Nimkar <https://www.linkedin.com/in/rohit-nimkar>
 * @brief    Startup functions and global variable declarations
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

#include <stdint.h>

/**
 * @brief Ending boundry of .text section in SRAM
 *        This address does not belong to .text section
 */
extern uint32_t _etext;

/**
 * @brief Starting address of .data section in SRAM
 */
extern uint32_t _sdata;

/**
 * @brief Ending boundry of .data section in SRAM
 *        This address does not belong to .data section
 */
extern uint32_t _edata;

/**
 * @brief Starting address of .data section in FLASH
 */
extern uint32_t _la_data;

/**
 * @brief Starting address of .bss section in SRAM
 */
extern uint32_t _sbss;

/**
 * @brief Ending boundry of .bss section in SRAM
 *        This address does not belong to .bss section
 */
extern uint32_t _ebss;

/**
 * @brief Address to be set in the main stack pointer
 */
extern uint32_t _stack_top;

void __attribute__((noreturn)) Reset_Handler(void);
#endif
