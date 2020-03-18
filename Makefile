
MCU   := atmega328p
GCC   := avr-gcc
FLAGS := -g -Os -mmcu=$(MCU)

AVR_LIB_PATH     := /usr/lib
AVR_INCLUDE_PATH := $(AVR_LIB_PATH)/avr/include

SRC     := src
OUT_DIR := target
OBJ_DIR := obj

_OBJS := BlinkLed.o
OBJS  := $(patsubst %,$(OUT_DIR)/$(OBJ_DIR)/%,$(_OBJS))

HEADERS      := avr/io.h util/delay.h 
INCLUDE_PATH := $(patsubst %,$(AVR_INCLUDE_PATH)/%,$(HEADERS))

blink_led: $(OBJS)
	$(GCC) $(FLAGS) -o $(OUT_DIR)/$(OBJ_DIR)/$@.elf $(OBJS)
	avr-objcopy -j .text -j .data -O ihex $(OUT_DIR)/$(OBJ_DIR)/$@.elf $(OUT_DIR)/$@.hex


$(OBJS): $(SRC)/BlinkLed.c
	mkdir -p $(OUT_DIR)/$(OBJ_DIR)
	$(GCC) $(FLAGS) -c $(SRC)/BlinkLed.c
	mv *.o $(OUT_DIR)/$(OBJ_DIR)/

.PHONY : clean
clean : 
	rm -rf $(OUT_DIR)
