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

ENTRY(Reset_Handler)

MEMORY
{
  FLASH(rx):ORIGIN =0x08000000,LENGTH =64K
  SRAM(rwx):ORIGIN =0x20000000,LENGTH =20K
}

SECTIONS
{

.isr_vector :
  {
    KEEP(*(.isr_vector));
    . = ALIGN(4);
  }> FLASH

  .text :
  {
    *(.text)
    *(.text.*)
    *(.init)
    *(.fini)
    *(.rodata)
    *(.rodata.*)
    . = ALIGN(4);
    _etext = .;
  }> FLASH

  _la_data = LOADADDR(.data);

  .data :
  {
    _sdata = .;
    *(.data)
    *(.data.*)
    . = ALIGN(4);
    _edata = .;
  }> SRAM AT> FLASH

  .bss :
  {
    _sbss = .;
    __bss_start__ = _sbss;
    *(.bss)
    *(.bss.*)
    *(COMMON)
    . = ALIGN(4);
    _ebss = .;
    __bss_end__ = _ebss;
     . = ALIGN(4);
    end = .;
    __end__ = .;
  }> SRAM
  PROVIDE(_stack_top = ORIGIN(SRAM) + LENGTH(SRAM));
}
