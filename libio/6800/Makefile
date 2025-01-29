OBJ = _fputs.o _getchar.o _putchar.o _puts.o

all: libio6800.a


.s.o:
	../../frontend/cc68 -m6800 -c $<

.c.o:
	../../frontend/cc68 -m6800 -O -c $<

libio6800.a: $(OBJ)
	ar qc libio6800.a `lorderz80 $(OBJ) | tsort`

clean:
	rm -f $(OBJ) *~ libio6800.a
