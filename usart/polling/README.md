# Blue Pill UART communication - Bare metal project in Embedded C

![Build Passing](https://img.shields.io/badge/build-passing-brightgreen) [![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)

Programming the UART1 peripheral in STM32F1 controller for bi-directional communication. Echo characters received from UART and transmit time elapsed since boot every 5 seconds.

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


## Project Structure

* `src` directory contains all source files for the project
* `include` directory contains all header files for the project

### Source file description

* `STM32F103C8TX_FLASH.ld`  - linker script for generating elf file.
* `src/main.c` - entry point of application and main code body.
* `src/uart.c` - Contains definition of non-inline functions for uart.
* `src/timer.c` - Contains definition of non-inline functions for SysTick timer.
* `src/startup_stm32f103c8tx.s` - assembly startup script for blue pill board.
* `include/uart.h` - Contains definitions of inline functions and declaration of all functions for uart.
* `include/uart.h` - Contains definitions of inline functions and declarations of all functions for SysTick timer.
* `system_stm32f1xx.c` - clock configuration and system initialization functions.
* `STM32F103.svd` - contains the description of the system contained in Arm Cortex-M processor-based microcontrollers, in particular, the memory mapped registers of peripherals.


## Control flow

The initialisation function accomplishes following tasks

1. Enables clock signal for USART1 peripheral as well as GPIO Port A, both are connected with APB2 bus.

```C
RCC->APB2ENR |= RCC_APB2ENR_USART1EN | RCC_APB2ENR_IOPAEN;
```

2. Reset mode and configuration for PA9 and PA10.

```C
GPIOA->CRH &= ~(GPIO_CRH_MODE10 | GPIO_CRH_MODE9 | GPIO_CRH_CNF10 | GPIO_CRH_CNF9);
```

3. Set appropriate mode and configuration for PA9 and PA10.
    * PA9 as push-pull output at 50MHz speed.
    * PA10 as floating input.

```C
GPIOA->CRH |= GPIO_CRH_MODE9_0 | GPIO_CRH_MODE9_1 | GPIO_CRH_CNF9_1;
GPIOA->CRH |= GPIO_CRH_CNF10_0;
```

4. Calculate and set baud rate values in register.

```C
uint32_t baud = (uint32_t)(SystemCoreClock / baudrate);
USART1->BRR = baud;
```

5. Enable transmitter, receiver, receiver interrupt and USART1 clock.

```C
USART1->CR1 = USART_CR1_TE | USART_CR1_RE | USART_CR1_RXNEIE | USART_CR1_UE;
```

6. Enable interrupt for USART1

```C
NVIC_EnableIRQ(USART1_IRQn);
```

![Control Flow Diagram](https://github.com/csrohit/bluepill-uart/blob/main/docs/github-cover.png "Control flow diagram for usart")

### Function description

1. `USART1_puts()` - prints a string to USART1.
2. `USART1_putc()` - waits for the transmit data register (`TDR`) to be empty and loads new character in it.
3. `USART1_IRQHandler()` - Interrupt service routine for USART1 related interrupts. If `RXNE` is set i.e. receiver not empty interrupt then it echoes the character back to usart.

## Project Working

The application prints time elapsed since boot in interval of 5 seconds. Configure serial onitor on host for 9600 baudrate to be able to read and write to blue pill using uart. The expected output is displayed in the *Output* section.

## Dependencies

* **make**\
    Make utility is required for configuring and building this project. You can install make on linux by running command:

    ```bash
    # for debian/ubuntu
    sudo apt install build-essential

    # for macos
    brew install make 
    ```

* **gcc-arm-none-eabi toolchain**\
    ARM cross-platform toolchain is required to build applications for arm mcus. Toolchain can be installed by running following command:

    ```bash
    sudo apt install gcc-arm-none-eabi
    ```
  * For mac, visit [ARM Downloads](https://developer.arm.com/downloads/-/gnu-rm) page to install arm embedded toolchain.

* **openocd**\
    It is an Open On Circuit Debugging tool used to flash and debug arm micro controllers. You can install openocd on linux by running command:

   ```bash
   # for debian/ubuntu
   sudo apt install openocd -y

   # for macos
   brew install openocd
   ```

* **Cortex Debug extension**\
    This extension for VSCode is helpful for debugging the application on Blue Pill. The contents of registers as well as memory are visible in the context menu.
    Launch VS Code Quick Open (Ctrl+P), paste the following command, and press enter.

     ```bash
    ext install marus25.cortex-debug
    ```

## Run Locally

Running the project is super easy. Just clone, build, and flash.

### Clone the project

1. Using https

    ```bash
    git clone git@github.com:csrohit/bluepill-uart.git
    cd bluepill-uart/baremetal
    ```

2. Using ssh

    ```bash
    git clone git@github.com:csrohit/bluepill-uart.git
    cd bluepill-uart/baremetal
    ```

### Configuration

All the configuration required for building this project is given below.

1. Build output directory
    In `Makefile`, output directory can be configured using variable `BUILD_DIR`.

2. Build type
    In `Makefile`, build type can be configured using variable`DEBUG`. Possible values are `Debug` and `Release`.


### Build

Run following command in terminal to generate flashable binaries for blue pill board. Build files will be written to **Build Output Directory** as configured.

```bash
make all
```

### Flash

1. Connect STlink to PC and blue pill board using swd headers.
2. Put blue pill board in programming mode.
3. Run following to flash board with binary.

```bash
make flash
```

## Output

The following output should be available on serial monitor.

![Output on Serial monitor](https://github.com/csrohit/bluepill-uart/blob/main/docs/output.jpg "Serial messages printed on monitor")


## Debug

Click in `Run and Debug` option in VsCode sidebar. Then launch `Cortex Debug` target.

Happy debugging....
