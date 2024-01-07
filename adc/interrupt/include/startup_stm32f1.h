#include <stdint.h>
#ifndef __STARTUP_STM32F1_H__
#define __STARTUP_STM32F1_H__

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
#endif