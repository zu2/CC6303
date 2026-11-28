OBJ =  asreax8.o bneg.o compleax.o __cpu_to_le16.o __cpu_to_le32.o
OBJ += divide32x32.o divide.o laddeq.o ladd.o land.o lbneg.o lcmp.o lor.o
OBJ += lsave.o lsubeq.o ltest.o lxor.o lucmp.o makebool.o
OBJ += mulax10.o mulax12.o mulax3.o mulax5.o mulax6.o mulax7.o mulax9.o
OBJ += multiply32x32.o negeax.o pop2.o pop4.o directpage.o
OBJ += shlax.o shleax.o shrax.o shr.o _strcpy.o sub.o swap.o
OBJ += tosasleax.o
OBJ += tosasreax.o tosdivax.o tosshlax.o tossubeax.o tosudivax.o tosumulax.o
OBJ += tosdiveax.o tosmodeax.o tosudiveax.o tosumodeax.o

OBJ += __cpu_to_le16.o __cpu_to_le32.o
OBJ += _isalnum.o _isalpha.o _isascii.o _isblank.o _iscntrl.o _isdigit.o
OBJ += _isgraph.o _islower.o _isprint.o _ispunct.o _isspace.o _isupper.o
OBJ += _isxdigit.o
OBJ += _tolower.o _toupper.o
OBJ += _memccpy.o _memchr.o _memrchr.o _memcpy.o _memset.o
OBJ += _strcat.o _strcpy.o _strlen.o _strnlen.o _strchr.o _strrchr.o
OBJ += _strcmp.o _strncmp.o _strlcpy.o _strlcat.o _strncpy.o
OBJ += _abs.o _labs.o _atoi.o
OBJ += _longjmp.o _setjmp.o

# Compiler helpers shared by the 6800 and 6803.
OBJ += ../lib6800/asr.o ../lib6800/asrax.o ../lib6800/asrax8.o ../lib6800/asreax.o
OBJ += ../lib6800/shreax.o ../lib6800/shreax8.o ../lib6800/tosshreax.o
OBJ += ../lib6800/dtox.o ../lib6800/jumpx.o ../lib6800/laddeqstatic16.o ../lib6800/tosumodax.o
OBJ += ../lib6800/leq.o ../lib6800/lne.o ../lib6800/lge.o ../lib6800/lgt.o ../lib6800/lle.o ../lib6800/llt.o
OBJ += ../lib6800/luge.o ../lib6800/lugt.o ../lib6800/lule.o ../lib6800/lult.o
OBJ += ../lib6800/toseqax.o ../lib6800/tosneax.o ../lib6800/tosgeax.o
OBJ += ../lib6800/tosgtax.o ../lib6800/tosleax.o ../lib6800/tosltax.o
OBJ += ../lib6800/tosugeax.o ../lib6800/tosugtax.o ../lib6800/tosuleax.o ../lib6800/tosultax.o

all: lib6803.a

.s.o:
	../frontend/cc68 -m6803 -c $<

.c.o:
	../frontend/cc68 -m6803 -O -c $<

lib6803.a: $(OBJ)
	rm -f lib6803.a
	ar qc lib6803.a `lorder6800 $(OBJ) | tsort`

clean:
	rm -f *.o *.a *~
