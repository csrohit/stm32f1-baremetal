/**
 * @file dma.hpp
 * @author Rohit Nimkar (nehalnimkar@gmail.com)
 * @brief Declaration of functionality related to dma 
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
#pragma once
class DMA
{
public:
    constexpr static uint32_t PeripheralBase = 0x40000000UL;
    constexpr static uint32_t AHBBase = PeripheralBase + 0x00020000UL;
    constexpr static uint32_t DMA1Base = AHBBase + 0x00000000UL;

private:
    volatile uint32_t ISR;
    volatile uint32_t IFCR;

public:
};
