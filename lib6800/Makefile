OBJ =  asr.o asrax.o asreax.o asreax8.o
OBJ += bneg.o compleax.o directpage.o jumpx.o pop2.o pop4.o
OBJ += ladd.o laddeq.o land.o lbneg.o lcmp.o lucmp.o
OBJ += leq.o lge.o lgt.o lle.o llt.o lne.o lor.o lsave.o ltest.o
OBJ += lsubeq.o luge.o lugt.o lule.o lult.o lxor.o 
OBJ += makebool.o mulax3.o mulax5.o mulax6.o mulax7.o mulax9.o mulax10.o mulax12.o
OBJ += negeax.o sub.o
OBJ += shlax.o shleax.o shr.o shrax.o shreax.o shreax8.o swap.o
OBJ += tosasreax.o tosdivax.o tosshlax.o tossubeax.o tosudivax.o tosumodax.o
OBJ += tosshreax.o tosasleax.o
OBJ += tosudiveax.o tosmodeax.o tosdiveax.o
OBJ += divide.o divide32x32.o
OBJ += fixfp.o dtox.o lateadjustsp.o dopulx.o addeqstatic.o des.o
OBJ += laddeqstatic8.o laddeqstatic16.o baddeqstatic.o
OBJ += storedpush.o dopulxstb.o dopulxstd.o storetos.o
OBJ += loadtos.o pshindvx.o pshindvlx.o ret.o leasp.o
OBJ += toseqax.o tosneax.o tosltax.o tosgtax.o tosleax.o tosgeax.o
OBJ += tosultax.o tosugtax.o tosuleax.o tosugeax.o
OBJ += tosumulax.o tosumodeax.o multiply32x32.o

OBJ += __cpu_to_le16.o __cpu_to_le32.o
OBJ += _memcpy.o _memset.o _memchr.o
OBJ += _strlen.o _strcpy.o _strcmp.o _strchr.o
OBJ += _isalnum.o _isalpha.o _isascii.o _isblank.o _iscntrl.o
OBJ += _isdigit.o _isgraph.o _islower.o _isprint.o _ispunct.o
OBJ += _isspace.o _isupper.o _isxdigit.o
OBJ += _tolower.o _toupper.o
OBJ += _longjmp.o _setjmp.o

all: lib6800.a

.s.o:
	../frontend/cc68 -m6800 -c $<

.o:
	../frontend/cc68 -m6800 -O -c $<

lib6800.a: $(OBJ)
	rm -f lib6800.a
	ar qc lib6800.a `/opt/fcc/bin/lorderz80 $(OBJ) | tsort`

clean:
	rm -f *.o *.a *~

	
