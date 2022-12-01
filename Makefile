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

$(BUILD_DIR)/$(TARGET).elf: $(OBJS) 
	$(CC) $(LDFLAGS) -o $@ $(OBJS) -Tstm32f1.ld -Wl,-Map="$(BUILD_DIR)/$(TARGET).map"

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: %.s
	@mkdir -p $(dir $@)
	$(CC) $(ASFLAGS) -c $< -o $@

flash:
	@# openocd -d2 -s /opt/openocd/scripts -f interface/stlink-v2.cfg -c "transport select hla_swd" -f target/stm32f1x.cfg -c "program {build/$(TARGET).elf}  verify reset; shutdown;"
	openocd -d2 -f interface/stlink.cfg -c "transport select hla_swd" -f target/stm32f1x.cfg -c "program {build/$(TARGET).elf}  verify reset; shutdown;"

all: $(BUILD_DIR)/$(TARGET).elf

clean:
	rm -rf $(BUILD_DIR)
