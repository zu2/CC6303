OBJ = 
CRT = crt0.o

all: libc.a $(CRT)

%.o: %.s
	as6800 $^

.s.o:
	cc68 -m6803 -c $<

.c.o:
	cc68 -m6803 -O -c $<

libc.a: $(OBJ)
	rm -f libc.a
	ar qc libc.a `../lorderz80 $(OBJ) | tsort`

clean:
	rm -f $(OBJ) $(CRT) libc.a *~

	
