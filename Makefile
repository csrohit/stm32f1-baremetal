TARGET := blink
# debug build?Release
BUILD_TYPE = Release

TRIPLE  = 	arm-none-eabi
CC 		=	${TRIPLE}-gcc
LD 		= 	${TRIPLE}-ld
AS 		= 	${TRIPLE}-as
GDB 	= 	${TRIPLE}-gdb
OBJCOPY =  	${TRIPLE}-objcopy

INCFLAGS := -Iinclude -Ilib/include
LDFLAGS := -mcpu=cortex-m3 -mfloat-abi=soft -mthumb -nostdlib $(INCFLAGS)  -Wl,--gc-sections
CFLAGS := -mcpu=cortex-m3 -mfloat-abi=soft -mthumb  -nostdlib $(INCFLAGS) -std=gnu11 -Os -Wall -fno-tree-loop-distribute-patterns -fdata-sections -ffunction-sections

ifeq ($(BUILD_TYPE), Debug)
CFLAGS += -g -gdwarf-2
endif

# Generate dependency information
CFLAGS += -MMD -MP 

SRC_DIRS := src
BUILD_DIR:= build

SRCS := $(shell find $(SRC_DIRS) -name '*.c')
OBJS := $(SRCS:%.c=$(BUILD_DIR)/%.o) 

# binary file to flash on target
all: $(BUILD_DIR)/$(TARGET).bin

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
	$(CC) $(LDFLAGS) -o $@ $(OBJS) -Tstm32f1.ld -Wl,-Map="$(BUILD_DIR)/$(TARGET).map"

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: %.s
	@mkdir -p $(dir $@)
	$(CC) $(ASFLAGS) -c $< -o $@

flash:
	st-flash write $(BUILD_DIR)/$(TARGET).bin 0x8000000

clean:
	rm -rf $(BUILD_DIR)
