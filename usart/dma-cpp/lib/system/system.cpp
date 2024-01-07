/**
 * @file system.cpp
 * @author Rohit Nimkar (nehalnimkar@gmail.com)
 * @brief Global function definitions
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


#include<system.hpp>


uint32_t Core::clock = 8000000U;
volatile uint32_t Core::ms_ticks = 0;

void SysTick_Handler(void){
    Core::ms_ticks ++;
}
