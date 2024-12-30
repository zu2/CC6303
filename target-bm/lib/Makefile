OBJ = directpage.o

all: libbm.a crt0_bm.o

install:
	install -c crt0_bm.o /opt/cc68/lib
	install -c libbm.a /opt/cc68/lib

libbm.a: $(OBJ)
	rm -f libbm.a
	ar qc libbm.a `lorderz80 $(OBJ) | tsort`

%.o: %.s
	/opt/fcc/bin/as6800 $^

clean:
	rm -f $(OBJ) *~ libbm.a crt0_bm.o
