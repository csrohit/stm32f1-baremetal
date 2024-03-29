TARGET := uart
# debug build?Release
BUILD_TYPE = Debug
BUILD_DIR:= build

TRIPLE  = 	arm-none-eabi
CC 		=	${TRIPLE}-gcc
LD 		= 	${TRIPLE}-ld
AS 		= 	${TRIPLE}-as
GDB 	= 	${TRIPLE}-gdb
OBJCOPY =  	${TRIPLE}-objcopy

INCFLAGS 	:= -Iinclude
CFLAGS 		:= -mcpu=cortex-m3 -mfloat-abi=soft -mthumb  --specs=nano.specs $(INCFLAGS) -std=gnu11 -Os -Wall -fstack-usage  -fdata-sections -ffunction-sections -DSTM32F103xB
LDFLAGS 	:= -mcpu=cortex-m3 -mfloat-abi=soft -mthumb --specs=nano.specs $(INCFLAGS) -lc_nano

# add debug flags if build type is debug
ifeq ($(BUILD_TYPE), Debug)
CFLAGS += -g -gdwarf-2
endif

# Generate dependency information
CFLAGS += -MMD -MP 
ASLAGS += -MMD -MP 

SRC_DIR := src
SRCS := $(shell find $(SRC_DIR) -name '*.c')
OBJS := $(SRCS:%.c=$(BUILD_DIR)/%.o) 

$(BUILD_DIR)/$(TARGET).elf: $(OBJS) stm32f1.ld
	$(CC) $(LDFLAGS) -o $@ $(OBJS) -T"stm32f1.ld" -Wl,-Map="$(BUILD_DIR)/$(TARGET).map" -Wl,--gc-sections -static -Wl,--start-group -lc -lm -Wl,--end-group

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "CC " $< " ==> " $@

$(BUILD_DIR)/%.o: %.s
	@mkdir -p $(dir $@)
	@$(CC) $(ASFLAGS) -c $< -o $@
	@echo "AS " $< " ==> " $@

flash:
	openocd -d2 -f interface/stlink.cfg -c "transport select hla_swd" -f target/stm32f1x.cfg -c "program {$(BUILD_DIR)/$(TARGET).elf}  verify reset; shutdown;"

all: $(BUILD_DIR)/$(TARGET).elf

clean:
	rm -rf $(BUILD_DIR)
