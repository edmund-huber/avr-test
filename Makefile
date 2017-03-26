CC=avr-gcc -mmcu=atxmega256a3bu

.SUFFIXES:

# Always compile with -O, because otherwise util/delay.h will warn that its
# functions won't work correctly unless optimizations are enabled.
%.o: %.c
	$(CC) -O -c -o $@ $^

ihex: elf
	avr-objcopy -j .text -j .data -O ihex elf ihex

elf: test.o
	$(CC) -o $@ $^

.PHONY: flash
flash:
	sudo dfu-programmer atxmega256a3bu erase
	sudo dfu-programmer atxmega256a3bu flash ihex --force
	sudo dfu-programmer atxmega256a3bu launch
