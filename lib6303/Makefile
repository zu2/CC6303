OBJ = divide.o laddeq.o lsubeq.o tosudivax.o

all: lib6303.a

.s.o:
	../frontend/cc68 -m6303 -c $<

.c.o:
	../frontend/cc68 -m6303 -O -c $<

lib6303.a: $(OBJ)
	rm -f lib6303.a
	ar qc lib6303.a `lorderz80 $(OBJ) | tsort`

clean:
	rm -f *.o *.a *~
