/**
 * @file dma.h
 * @author Rohit Nimkar (nehalnimkar@gmail.com)
 * @brief Function declarations and inline function definitions for DMA peripheral
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

#include <stm32f1xx.h>

#ifndef __DMA_H__
#define __DMA_H__
typedef enum
{
    DISABLE,
    ENABLE
} dma_channel_cmd_t;

inline void dma_channel_cmd(DMA_Channel_TypeDef *ch, dma_channel_cmd_t cmd)
{
    if(cmd == ENABLE){
        ch->CCR |= DMA_CCR_EN;
    }else{
        ch->CCR &= ~DMA_CCR_EN;
    }
}

inline void dma_channel_reload(DMA_Channel_TypeDef *ch, uint32_t new_count){
    ch->CNDTR = new_count;
}

#endif