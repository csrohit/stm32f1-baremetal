TARGET := blink


TRIPLE  = 	arm-none-eabi
CC 		=	${TRIPLE}-gcc
LD 		= 	${TRIPLE}-ld
AS 		= 	${TRIPLE}-as
GDB 	= 	${TRIPLE}-gdb
OBJCOPY =  	${TRIPLE}-objcopy

OPENOCD_BASE = /opt/openocd
INCFLAGS := -Iinclude -Ilib/include
ASFLAGS := -mcpu=cortex-m3 -mfloat-abi=soft -mthumb --specs=nano.specs $(INCFLAGS) -MMD -MP  -x assembler-with-cpp
LDFLAGS := -mcpu=cortex-m3 -mfloat-abi=soft -mthumb --specs=nosys.specs $(INCFLAGS)
CFLAGS := -mcpu=cortex-m3 -mfloat-abi=soft -mthumb  --specs=nano.specs $(INCFLAGS) -std=gnu11 -Os -MMD -MP -Wall -fstack-usage  -fdata-sections -ffunction-sections -DSTM32 -DSTM32F1 -DSTM32F103C8Tx

SRC_DIRS := src
BUILD_DIR:= build

SRCS := $(shell find $(SRC_DIRS) -name '*.c')
OBJS := build/src/startup_stm32f103c8tx.o $(SRCS:%.c=$(BUILD_DIR)/%.o) 

$(BUILD_DIR)/$(TARGET).elf: $(OBJS) src/STM32F103C8TX_FLASH.ld
	$(CC) $(LDFLAGS) -o $@ $(OBJS) -T"src/STM32F103C8TX_FLASH.ld" -Wl,-Map="$(BUILD_DIR)/$(TARGET).map" -Wl,--gc-sections -static -Wl,--start-group -lc -lm -Wl,--end-group



$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -MT"$@" -o $@

$(BUILD_DIR)/%.o: %.s
	@mkdir -p $(dir $@)
	arm-none-eabi-gcc $(ASFLAGS) -c src/startup_stm32f103c8tx.s -o build/src/startup_stm32f103c8tx.o


all: 
	mkdir build
	arm-none-eabi-gcc $(ASFLAGS) -c src/startup_stm32f103c8tx.s -o build/src/startup_stm32f103c8tx.o 
	arm-none-eabi-gcc $(CFLAGS) -c src/main.c -MF"build/src/main.d" -MT"build/src/main.o" -o build/src/main.o
	arm-none-eabi-gcc $(CFLAGS) -c src/syscalls.c -MF"build/src/syscalls.d" -MT"build/src/syscalls.o" -o build/src/syscalls.o
	arm-none-eabi-gcc $(CFLAGS) -c src/sysmem.c -MF"build/src/sysmem.d" -MT"build/src/sysmem.o" -o build/src/sysmem.o
	arm-none-eabi-gcc $(CFLAGS) -c src/system_stm32f1xx.c -MF"build/src/system_stm32f1xx.d" -MT"build/src/system_stm32f1xx.o" -o "build/src/system_stm32f1xx.o"
	arm-none-eabi-gcc $(LDFLAGS) -o "build/blink.elf" build/src/*.o  -T"src/STM32F103C8TX_FLASH.ld" -Wl,-Map="build/blink.map" -Wl,--gc-sections -static -Wl,--start-group -lc -lm -Wl,--end-group

flash:
	openocd -d2 -s /opt/openocd/scripts -f interface/stlink.cfg -c "transport select hla_swd" -f target/stm32f1x.cfg -c "program {build/blink.elf}  verify reset; shutdown;"

clean:
	rm -rf $(BUILD_DIR)

# BUILD_DIR := build
# SRC_DIRS := src lib/src
# INC_DIRS := include lib/include
# LD_SCRIPT := STM32F103C8TX_FLASH.ld
# STARTUP_SCRIPT := startup_stm32f103c8tx

# INC_FLAGS := $(addprefix -I,$(INC_DIRS))
# CPU_ARCH = cortex-m3

# DEFINES := STM32F103xB STM32 STM32F1
# DFLAGS := $(addprefix -D,$(DEFINES))
# ASFLAGS := -mcpu=$(CPU_ARCH) -mfloat-abi=soft -mlittle-endian
# LDFLAGS := -T$(LD_SCRIPT) -lc
# CFLAGS :=  $(ASFLAGS) $(DFLAGS)  

# CFLAGS +=   $(INC_FLAGS) -O0 -mthumb --specs=nosys.specs

# DBGFLAGS :=  -MF"Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.d" -MT"Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.o" --specs=nano.specs 




# SRCS := $(shell find $(SRC_DIRS) -name '*.cpp' -or -name '*.c' -or -name '*.s')
# OBJS := $(SRCS:%.c=$(BUILD_DIR)/%.o)

# all: $(BUILD_DIR)/$(TARGET).elf

# $(BUILD_DIR)/$(TARGET).bin: $(BUILD_DIR)/$(TARGET).elf
# 	@echo "CP" $< "=>" $@
# 	@$(OBJCOPY) -O binary $^ $@


# $(BUILD_DIR)/$(TARGET).elf: $(OBJS) $(BUILD_DIR)/lib/$(STARTUP_SCRIPT).o 
# 	@echo "LD" $< "=>" $@
# 	$(CC) $(LDFLAGS) $^ -o $@

# $(BUILD_DIR)/%.o: %.c
# 	@echo "CC" $< "=>" $@
# 	@mkdir -p $(dir $@)
# 	@$(CC) $(CFLAGS)   -c $< -o $@

# $(BUILD_DIR)/lib/$(STARTUP_SCRIPT).o: lib/$(STARTUP_SCRIPT).s
# 	@echo "AS" $< "=>" $@
# 	@$(AS) $(ASFLAGS) -c $< -o $@

# flash: $(BUILD_DIR)/$(TARGET).elf
# 	openocd -d2 -s $(OPENOCD_BASE)/scripts -f interface/stlink.cfg -c "transport select hla_swd" -f target/stm32f1x.cfg -c "program {build/$(TARGET).elf}  verify reset; shutdown;"



# clean:
# 	rm -rf $(BUILD_DIR)