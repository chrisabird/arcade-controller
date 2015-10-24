DEVICE=atmega328p
SIMAVRDUDE = avrdude -p $(DEVICE) -c arduino -P /tmp/simavr-uart0
AVRDUDE = avrdude -p $(DEVICE) -c usbtiny -V -F
COMPILE = avr-gcc -Wall -Os -Iusbdrv -I. -mmcu=$(DEVICE) -DF_CPU=16000000 -DDEBUG_LEVEL=0
OBJECTS = usbdrv/usbdrv.o usbdrv/usbdrvasm.o usbdrv/oddebug.o main.o

all:	main.hex

.c.o:
	$(COMPILE) -c $< -o $@

.S.o:
	$(COMPILE) -x assembler-with-cpp -c $< -o $@

.c.s:
	$(COMPILE) -S $< -o $@

flash:	all
	$(AVRDUDE) -U flash:w:main.hex:i

flashuno: all
	 avrdude -F -V -c avrisp -p $(DEVICE) -P /dev/cu.usbmodem1451 -b 19200 -U flash:w:main.hex:i

readfuse:
	avrdude -c avrisp -p $(DEVICE) -P /dev/cu.usbmodem1451 -b 19200 -U lfuse:r:-:i -v

sim: all
	$(SIMAVRDUDE) -U flash:w:main.hex:i

fuse:
	avrdude -c avrisp -p $(DEVICE) -P /dev/cu.usbmodem1451 -b 19200 -U hfuse:w:0xdd:m -U lfuse:w:0xff:m -U efuse:w:0xfe:m

readcal:
	$(AVRDUDE) -U calibration:r:/dev/stdout:i | head -1

clean:
	rm -f main.hex main.lst main.obj main.cof main.list main.map main.eep.hex main.bin *.o usbdrv/*.o main.s usbdrv/oddebug.s usbdrv/usbdrv.s

main.bin:	$(OBJECTS)
	$(COMPILE) -o main.bin $(OBJECTS)

main.hex:	main.bin
	rm -f main.hex main.eep.hex
	avr-objcopy -j .text -j .data -O ihex main.bin main.hex

disasm:	main.bin
	avr-objdump -d main.bin

cpp:
	$(COMPILE) -E main.c
