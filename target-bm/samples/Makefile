#
#
#
PATH:=/opt/cc68/bin:/opt/fcc/bin:$(PATH)
ORG=2100
PROGS=asciiart hello knight-tour

.SUFFIXES:
.SUFFIXES: .mot .hex .bin .c
.SECONDARY:

.PHONY: all clean

all: $(PROGS:=.mot) $(PROGS:=.hex)

%.mot: %.bin
	objcopy -I binary -O srec --adjust-vma=0x$(ORG) $*.bin $*.mot

%.hex: %.bin
	objcopy -I binary -O ihex --adjust-vma=0x$(ORG) $*.bin $*.hex

%.bin: %.c
	cc68 -tbm --bin -M -o $* $<

clean:
	rm -f $(PROGS)
	rm -f *.o *.map *.bin *.mot *.hex
