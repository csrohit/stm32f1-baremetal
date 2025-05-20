/**
 * @file stm32f1.ld
 * @author Rohit Nimkar (nehalnimkar@gmail.com)
 * @brief Linker script for stm32f103c8t6 micro-controller
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

/* Entry Point */
ENTRY(Reset_Handler)

/* Highest address of the user mode stack */
_stack_top = ORIGIN(RAM) + LENGTH(RAM); /* end of "RAM" Ram type memory */

/* Memories definition */
MEMORY
{
  RAM     (xrw)   : ORIGIN = 0x20000000,   LENGTH = 20K
  FLASH   (rx)    : ORIGIN = 0x8000000,   LENGTH = 64K
}


MEMORY
{
    ROM  (rx): ORIGIN = 0x08000000, LENGTH =  32K
    RAM (rwx): ORIGIN = 0x20000000, LENGTH =  10K
}

/* Entry Point */
ENTRY(Reset_Handler)

/* Highest address of the user mode stack */
_estack = ORIGIN(RAM) + LENGTH(RAM); /* end of "RAM" Ram type memory */


SECTIONS
{
    .text :
    {
        KEEP(*(.isr_vector))
        . = ALIGN(4);
        *(.text)               /* Application code */
        *(.text*)              /* All .text* sections */
        *(.rodata)             /* Read-only data */
        *(.rodata*)            /* All .rodata* sections */
        KEEP(*(.init))         /* C/C++ startup */
        KEEP(*(.fini))         /* C/C++ termination */
        . = ALIGN(4);
    } > ROM

    _sidata = .;

    /* Initialized data in RAM, loaded from flash */
    .data : AT (ADDR(.text) + SIZEOF(.text))
    {
        . = ALIGN(4);
        _sdata = .;            /* Start of .data in RAM */
        *(.data)
        *(.data*)
        . = ALIGN(4);
        _edata = .;            /* End of .data in RAM */
    } > RAM


    .bss (NOLOAD) :
    {
        . = ALIGN(4);
        _sbss = .;             /* Start of .bss */
        *(.bss)
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;             /* End of .bss */
    } > RAM
}

