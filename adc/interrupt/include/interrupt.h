#ifndef __INTERRUPT_H__
#define __INTERRUPT_H__
/**
 * @file     interrupt.h
 * @author   Rohit Nimkar <https://www.linkedin.com/in/rohit-nimkar>
 * @brief    INterrupt routine declarations
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

void Default_Handler(void);

void __attribute__((weak, alias("Default_Handler"))) NMI_Handler(void);
void __attribute__((weak, alias("Default_Handler"))) HardFault_Handler(void);
void __attribute__((weak, alias("Default_Handler"))) MemManage_Handler(void);
void __attribute__((weak, alias("Default_Handler"))) BusFault_Handler(void);
void __attribute__((weak, alias("Default_Handler"))) UsageFault_Handler(void);
void __attribute__((weak, alias("Default_Handler"))) SVC_Handler(void);
void __attribute__((weak, alias("Default_Handler"))) DebugMon_Handler(void);
void __attribute__((weak, alias("Default_Handler"))) PendSV_Handler(void);
void __attribute__((weak, alias("Default_Handler"))) SysTick_Handler(void);
void __attribute__((weak, alias("Default_Handler"))) WWDG_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) PVD_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) TAMP_STAMP_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) RTC_WKUP_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) RCC_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) EXTI0_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) EXTI1_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) EXTI2_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) EXTI3_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) EXTI4_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) DMA1_Channel1_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) DMA1_Channel2_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) DMA1_Channel3_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) DMA1_Channel4_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) DMA1_Channel5_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) DMA1_Channel6_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) DMA1_Channel7_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) ADC_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) USB_HP_CAN_TX_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) USB_LP_CAN_RX0_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) CAN_RX1_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) CAN_SCE_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) EXTI9_5_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) TIM1_BRK_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) TIM1_UP_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) TIM1_TRG_COM_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) TIM1_CC_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) TIM2_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) TIM3_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) TIM4_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) I2C1_EV_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) I2C1_ER_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) I2C2_EV_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) I2C2_ER_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) SPI1_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) SPI2_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) USART1_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) USART2_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) USART3_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) EXTI15_10_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) RTC_Alarm_IRQHandler(void);
void __attribute__((weak, alias("Default_Handler"))) USB_Wakeup_IRQHandler(void);

#endif // !__INTERRUPT_H__
