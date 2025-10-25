TARGET      := blink

# debug build?Release
BUILD_TYPE  = Release

TRIPLE      =   arm-none-eabi
CC          =   ${TRIPLE}-gcc
CXX         =   ${TRIPLE}-g++
LD 		    =   ${TRIPLE}-ld
AS 		    =   ${TRIPLE}-as
GDB 	    =   ${TRIPLE}-gdb
OBJCOPY     =   ${TRIPLE}-objcopy



INC_DIRS    := include lib/include
SRC_DIRS    := src
BUILD_DIR   := build

SRCS        := $(shell find $(SRC_DIRS) -name '*.c')
OBJS        := $(SRCS:%.c=$(BUILD_DIR)/%.o) 

CPP_FLAGS 	:= $(addprefix -I,$(INC_DIRS)) $(DEFS)
CPU_FLAGS   := -mcpu=cortex-m3 -mfloat-abi=soft -mthumb
CFLAGS      := -nostdlib -std=gnu11 -Os -Wall -fno-tree-loop-distribute-patterns -fdata-sections -ffunction-sections
LD_FLAGS    := -nostdlib -Wl,--gc-sections

ifeq ($(BUILD_TYPE), Debug)
CFLAGS 		+= -g -gdwarf-2
endif

# Generate dependency information
CFLAGS      += -MMD -MP 

# binary file to flash on target
all : $(BUILD_DIR)/$(TARGET).bin

%.bin: %.elf
	@echo "COPY " $< " => " $@
	@$(OBJCOPY) -Obinary $(*).elf $(*).bin

# executable object files for debugging
%.hex: %.elf
	$(OBJCOPY) -Oihex $(*).elf $(*).hex

%.srec: %.elf
	$(OBJCOPY) -Osrec $(*).elf $(*).srec

%.list: %.elf
	$(OBJDUMP) -S $(*).elf > $(*).list

%.size: %.elf
	@echo "Section wise usage: "
	@$(SIZE) $<

$(BUILD_DIR)/$(TARGET).elf: $(OBJS) 
	$(CC) $(LD_FLAGS) -o $@ $(OBJS) -Tstm32f1.ld -Wl,-Map="$(BUILD_DIR)/$(TARGET).map"

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CPU_FLAGS) $(CPP_FLAGS) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: %.pp
	@mkdir -p $(dir $@)
	$(CXX) $(CPP_FLAGS) $(CPU_FLAGS) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: %.s
	@mkdir -p $(dir $@)
	$(CC) $(ASFLAGS) -c $< -o $@

flash: bin
	STM32_Programmer_CLI -c port=SWD ap=0 -w $(BUILD_DIR)/$(TARGET).elf -rst

erase:
	STM32_Programmer_CLI -c port=SWD ap=0 -e all

reset:
	STM32_Programmer_CLI -c port=SWD ap=0  -rst

flashv2:
	st-flash write $(BUILD_DIR)/$(TARGET).bin 0x8000000

flash-openocd:
	openocd -d2 -f interface/stlink.cfg -c "transport select hla_swd" -f target/stm32f1x.cfg -c "program {$(BUILD_DIR)/$(TARGET).elf}  verify reset; shutdown;"

clean:
	rm -rf $(BUILD_DIR)
