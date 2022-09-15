# Blue Pill Project Template using Makefile

A boilerplate for generating projects for stm32 blue pill board using makefile. The projects does not use any tools provided by ST Microelectronics.
Everything from development, flashing to debugging can be done in Visual Studio Code only.

![Build Passing](https://img.shields.io/badge/build-passing-brightgreen) [![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)

## Project Structure

* `src` directory contains all source files for the project
* `include` directory contains all header files for the project

### Source file description

* `STM32F103C8TX_FLASH.ld`  - linker script
* `src\main.c` - application code
* `src\startup_stm32f103c8tx.s` - assembly startup script for blue pill board
* `system_stm32f1xx.c` - clock configuration and system initialization functions

## Run Locally

Running the project is super easy. Just clone, build, and flash.

### Clone the project

1. Using https

    ```bash
    git clone https://github.com/csrohit/bluepill-template-project.git
    cd bluepill-template-project
    ```

2. Using ssh

    ```bash
    git clone git@github.com:csrohit/bluepill-template-project.git
    cd bluepill-template-project
    ```

#### Build

To compile the project you need to have installed `gcc-arm-none-eabi` toolchain on your system.
On Linux:

```bash
sudo apt install gcc-arm-none-eabi
```

Run following command in terminal to generate flashable binaries for blue pill board.

```bash
make all
```

#### Flash

To flash you need to have

1. Openocd installed on your machine.

   ```bash
   sudo apt install openocd -y
   ```

2. Connect Stlink to PC and blue pill board using swd headers.
3. Put blue pill board in programming mode

    ```bash
    make flash
    ```

* or you can flash the hex file using [STM32 Cube Programmer](https://docs.nanoframework.net/content/stm32/flash-cube-programmer.html)

#### Output

Onboard led connected to Pin C13 can be observed to be blinking after 500ms.
