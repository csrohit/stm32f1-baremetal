#include <stdint.h>

#include "startup_stm32f1.h"

// Forward declaration of the main function
extern int main(void);

// Vector table
__attribute__((section(".isr_vector")))
const void *g_pfnVectors[] = {
    &_estack,                   // Initial stack pointer
    Reset_Handler,              // Reset handler
    NMI_Handler,                // Non-maskable interrupt handler
    HardFault_Handler,          // Hard fault handler
    MemManage_Handler,          // Memory management fault handler
    BusFault_Handler,           // Bus fault handler
    UsageFault_Handler,         // Usage fault handler
    0,                          // Reserved
    0,                          // Reserved
    0,                          // Reserved
    0,                          // Reserved
    SVC_Handler,                // SVCall handler
    DebugMon_Handler,           // Debug monitor handler
    0,                          // Reserved
    PendSV_Handler,             // PendSV handler
    SysTick_Handler,            // SysTick handler

    // External Interrupts
    WWDG_IRQHandler,            // Window Watchdog interrupt
    PVD_IRQHandler,             // PVD through EXTI Line detection interrupt
    TAMPER_IRQHandler,          // Tamper interrupt
    RTC_IRQHandler,             // RTC global interrupt
    FLASH_IRQHandler,           // Flash global interrupt
    RCC_IRQHandler,             // RCC global interrupt
    EXTI0_IRQHandler,           // EXTI Line0 interrupt
    EXTI1_IRQHandler,           // EXTI Line1 interrupt
    EXTI2_IRQHandler,           // EXTI Line2 interrupt
    EXTI3_IRQHandler,           // EXTI Line3 interrupt
    EXTI4_IRQHandler,           // EXTI Line4 interrupt
    DMA1_Channel1_IRQHandler,   // DMA1 Channel1 interrupt
    DMA1_Channel2_IRQHandler,   // DMA1 Channel2 interrupt
    DMA1_Channel3_IRQHandler,   // DMA1 Channel3 interrupt
    DMA1_Channel4_IRQHandler,   // DMA1 Channel4 interrupt
    DMA1_Channel5_IRQHandler,   // DMA1 Channel5 interrupt
    DMA1_Channel6_IRQHandler,   // DMA1 Channel6 interrupt
    DMA1_Channel7_IRQHandler,   // DMA1 Channel7 interrupt
    ADC1_2_IRQHandler,          // ADC1 and ADC2 global interrupt
    USB_HP_CAN1_TX_IRQHandler,  // USB High Priority or CAN1 TX interrupts
    USB_LP_CAN1_RX0_IRQHandler, // USB Low Priority or CAN1 RX0 interrupts
    CAN1_RX1_IRQHandler,        // CAN1 RX1 interrupt
    CAN1_SCE_IRQHandler,        // CAN1 SCE interrupt
    EXTI9_5_IRQHandler,         // EXTI Line[9:5] interrupts
    TIM1_BRK_IRQHandler,        // TIM1 Break interrupt
    TIM1_UP_IRQHandler,         // TIM1 Update interrupt
    TIM1_TRG_COM_IRQHandler,    // TIM1 Trigger and Commutation interrupts
    TIM1_CC_IRQHandler,         // TIM1 Capture Compare interrupt
    TIM2_IRQHandler,            // TIM2 global interrupt
    TIM3_IRQHandler,            // TIM3 global interrupt
    0,                          // Reserved
    I2C1_EV_IRQHandler,         // I2C1 Event interrupt
    I2C1_ER_IRQHandler,         // I2C1 Error interrupt
    0,                          // Reserved
    0,                          // Reserved
    SPI1_IRQHandler,            // SPI1 global interrupt
    0,                          // Reserved
    USART1_IRQHandler,          // USART1 global interrupt
    USART2_IRQHandler,          // USART2 global interrupt
    0,                          // Reserved
    EXTI15_10_IRQHandler,       // EXTI Line[15:10] interrupts
    RTC_Alarm_IRQHandler,       // RTC Alarm through EXTI Line interrupt
    USBWakeUp_IRQHandler,       // USB Wakeup from suspend through EXTI Line interrupt
    0,                          // Reserved
    0,                          // Reserved
    0,                          // Reserved
    0,                          // Reserved
    0,                          // Reserved
    0,                          // Reserved
    0,                          // Reserved
    (void *)0xF108F85F          // BootRAM for STM32F10x Low Density devices
};


// Reset handler implementation
void Reset_Handler(void)
{
    // Copy .data section from flash to RAM
    uint32_t *src = &_sidata;
    uint32_t *dst = &_sdata;
    while (dst < &_edata)
    {
        *dst++ = *src++;
    }

    // Zero initialize the .bss section
    dst = &_sbss;
    while (dst < &_ebss)
    {
        *dst++ = 0;
    }

    // Optionally call system initialization (uncomment if you have SystemInit)
    // SystemInit();

    // Optionally call C library initialization (uncomment if you use newlib)
    // __libc_init_array();

    // Call the application's entry point
    main();

    // If main returns, loop forever
    while (1)
        ;
}

// Default interrupt handler
void Default_Handler(void)
{
    while (1)
        ;
}
