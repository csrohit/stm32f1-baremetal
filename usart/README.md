# Blue Pill UART communication

![Build Passing](https://img.shields.io/badge/build-passing-brightgreen) [![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)

Programming the UART1 peripheral in STM32F1 controller for bi-directional communication. Echo characters received from UART and transmit time elapsed since boot every 5 seconds.

## Project Variant

STM32F1 Blue pill is a versatile board and can be programmed in various ways. I have created following variations of this project which differs in programming language, use of RTOS and framework. Clone the repository and follow steps mentioned in the respective variations for building and flashing.

1. [Polling](polling)
2. [DMA in Circular Mode](dma-circular)
3. [DMA in 1 Shot Mode](dma-1shot)
4. [DMA in Echo Mode](dma-echo)
5. [C++ project](cpp)

## USART

The controller has 3 USART peropherals with varying functionality. The peripheral registers can be accessed as half word (16 bit) as well as words (32 bit).\
This project uses USART1 with pinc PA9 and PA10 for demonstration.

## Hardware Setup

Connect the board with host through USB to TTL converter (FTDI board in our case). The connections are described as follows.

| Pin on Blue Pill  | Pin on FTDI  |
|------------------ |------------- |
| PA9               | Rx           |
| PA10              | Tx           |
| Gnd               | Gnd          |

![Connection diagram for USART1](https://github.com/csrohit/bluepill-uart/blob/main/docs/label.png "Pin connection diagram for usart1")

## Output

The application prints time elapsed since boot in interval of 5 seconds. Configure serial onitor on host for 9600 baudrate to be able to read and write to blue pill using uart. Following output can be observed on UART.\
![Output on Serial monitor](https://github.com/csrohit/bluepill-uart/blob/main/docs/output.jpg "Serial messages printed on monitor")

## Debug

Click in `Run and Debug` option in VsCode sidebar. Then launch `Cortex Debug` target.

Happy debugging....
