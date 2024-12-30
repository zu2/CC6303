#
#
#
PATH:=/opt/cc68/bin:/opt/fcc/bin:$(PATH)
ORG=4000
ORGB=$(shell printf '%d' 0x$(ORG))

.SUFFIXES:
.SUFFIXES: .mot .hex .bin .o .c .s
.SECONDARY:

.PHONY: asciiart hello knight-tour

all: asciiart hello knight-tour

asciiart: asciiart.mot asciiart.hex
hello: hello.mot hello.hex
knight-tour: knight-tour.mot knight-tour.hex

%.mot: %.bin
	objcopy -I binary -O srec --adjust-vma=0x$(ORG) $*.bin $*.mot

%.hex: %.bin
	objcopy -I binary -O ihex --adjust-vma=0x$(ORG) $*.bin $*.hex

%.bin: %.o
	ld6800 -v -b -C 0x$(ORG) -Z0 -m a.map -o a.out /opt/cc68/lib/crt0_bm.o $^ /opt/cc68/lib/libbm.a /opt/cc68/lib/libio6800.a /opt/cc68/lib/lib6800.a 
	dd if=a.out of=$@ bs=1 skip=$(ORGB)
	@rm -f a.out

%.o: %.c
	cc68 -m6800 -I../include/ -c $<

clean:
	rm -f a.{bin,out,map}
	rm -f *.o *.bin *.mot *.hex
