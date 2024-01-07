/**
 * @file rcc.hpp
 * @author Rohit Nimkar (nehalnimkar@gmail.com)
 * @brief Declaration of functionality related to Reset and clock configuration
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

#include<stdint.h>
#pragma once

class RCC
{
private:
    volatile uint32_t CR;
    volatile uint32_t CFGR;
    volatile uint32_t CIR;
    volatile uint32_t APB2RSTR;
    volatile uint32_t APB1RSTR;
    volatile uint32_t AHBENR;
    volatile uint32_t APB2ENR;
    volatile uint32_t APB1ENR;
    volatile uint32_t BDCR;
    volatile uint32_t CSR;
public:
    RCC(/* args */);
    ~RCC();
};

RCC::RCC(/* args */)
{
}

RCC::~RCC()
{
}
