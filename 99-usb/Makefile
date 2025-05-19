TARGET      := cdc_loop

# Toolchain
PREFIX      := arm-none-eabi
CC          := $(PREFIX)-gcc
LD          := $(PREFIX)-ld
AS          := $(PREFIX)-as
GDB         := $(PREFIX)-gdb
OBJCOPY     := $(PREFIX)-objcopy
SIZE        := $(PREFIX)-size

# Flashing tools
FLASH       ?= st-flash
DFU_UTIL    ?= dfu-util
STPROG_CLI  ?= ~/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32_Programmer_CLI

# Directories
SRC_DIRS    := src
INC_DIRS    := inc
BUILD_DIR   := build

# Source and object files
SRCS        := $(foreach dir,$(SRC_DIRS), \
                  $(wildcard $(dir)/*.c)   \
                  $(wildcard $(dir)/*.cpp) \
                  $(wildcard $(dir)/*.s))
OBJS        := $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(basename $(SRCS))))

# Preprocessor flags
DEFS        := STM32F1 STM32F103x6 CDC_USE_IRQ
CPPFLAGS    := $(addprefix -I,$(INC_DIRS)) $(addprefix -D,$(DEFS))

# MCU-specific flags
MCUFLAGS    := -mcpu=cortex-m3 -mfloat-abi=soft -mthumb

# Compiler flags
CFLAGS      := -std=c11 -Wall -g -gdwarf-2 --specs=nano.specs

# Linker flags
LDSCRIPT    := stm32f103x6.ld
LDFLAGS     := -T$(LDSCRIPT) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map -Wl,--gc-sections

# Default targets
all: elf bin hex size

elf: $(BUILD_DIR)/$(TARGET).elf
bin: $(BUILD_DIR)/$(TARGET).bin
hex: $(BUILD_DIR)/$(TARGET).hex
size: $(BUILD_DIR)/$(TARGET).size

# Build rules
$(BUILD_DIR)/$(TARGET).elf: $(OBJS)
	@echo Linking $@
	$(CC) $(MCUFLAGS) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(OBJS) -o $@

$(BUILD_DIR)/%.o: %.c
	@echo Compiling $<
	@mkdir -p $(dir $@)
	$(CC) $(MCUFLAGS) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: %.cpp
	@echo Compiling $<
	@mkdir -p $(dir $@)
	$(CC) $(MCUFLAGS) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: %.s
	@echo Assembling $<
	@mkdir -p $(dir $@)
	$(CC) $(MCUFLAGS) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: %.S
	@echo Assembling $<
	@mkdir -p $(dir $@)
	$(CC) $(MCUFLAGS) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

%.bin: %.elf
	@echo Creating $@
	$(OBJCOPY) -O binary $< $@

%.hex: %.elf
	@echo Creating $@
	$(OBJCOPY) -O ihex $< $@

%.size: %.elf
	$(SIZE) $<

# Flashing targets
program: $(BUILD_DIR)/$(TARGET).hex
	$(FLASH) --reset --format ihex --connect-under-reset write $<

program_dfu: $(BUILD_DIR)/$(TARGET).bin
	$(DFU_UTIL) -d 0483:DF11 -a 0 -D $< -s 0x08000000

program_stcube: $(BUILD_DIR)/$(TARGET).hex
	$(STPROG_CLI) -c port=SWD reset=HWrst -d $< -hardRst

# Utility targets
clean:
	rm -rf $(BUILD_DIR)

help:
	@echo 'Usage: make [all|elf|bin|hex|size|program|program_dfu|program_stcube|clean]'
	@echo 'Environmental variables:'
	@echo '  FLASH         st-link flash utility ($(FLASH))'
	@echo '  DFU_UTIL      DFU utility ($(DFU_UTIL))'
	@echo '  STPROG_CLI    STCubeProgrammer CLI ($(STPROG_CLI))'

.PHONY: all elf bin hex size program program_dfu program_stcube clean help
