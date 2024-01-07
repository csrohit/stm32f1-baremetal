# ADC interfacing of STM32 Blue Pill in Baremetal Embedded C

<!--toc:start-->
- [ADC interfacing of STM32 Blue Pill in Baremetal Embedded C](#adc-interfacing-of-stm32-blue-pill-in-baremetal-embedded-c)
<!--toc:end-->

Read analog value from a sensor connected to pin PA1. This pin is assigned to Channel1 of ADC1.
Transmit the sensor value read to USART1. This project does not require any IDE like CubeIde, any text editor will work including notepad and vim. For better debugging experience, VSCode is preferred.

![Build Passing](https://img.shields.io/badge/build-passing-brightgreen) [![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)

##ADC Modes
ADC in STM32 can be utilized in multiple modes as follows:
1. [Single channel single conversion using polling](polling-single-conversion)
2. [Single channel single conversion using interrupt](polling-continuous-conversion)
3. [Single channel continuous conversion using polling](interrupt-single-conversion)
4. [Single channel continuous conversion using interrupt](interrupt-continuous-conversion)
