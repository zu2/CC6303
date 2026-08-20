
all: check cc68 copt frontend libc

.PHONY: check cc68 frontend libc copt

# lorder6800 runs nm6809
FUZIXBIN = as6800 ld6800 nm6809
FUZIXCC  = lorder6800 emu6800

check:
	@fail=; \
	for t in $(FUZIXBIN); do \
	  command -v $$t >/dev/null 2>&1 || { echo "Fuzix-Bintools: $$t not found"; fail=1; }; \
	done; \
	for t in $(FUZIXCC); do \
	  command -v $$t >/dev/null 2>&1 || { echo "Fuzix-Compiler-Kit: $$t not found"; fail=1; }; \
	done; \
	test -z "$$fail"

cc68:
	+(cd common; make)
	+(cd cc68; make)


copt:
	+(cd copt; make)

libc:
	+(cd libc; make)
	+(cd lib6800; make)
	+(cd lib6803; make)
	+(cd lib6303; make)
	+(cd libio; make)
	+(cd target-mc10; make)
	+(cd target-flex; make)
	+(cd target-bm; make)
	mkdir -p tmp
	rm -f tmp/*
	rm -f lib6800.a
	rm -f lib6803.a
	rm -f lib6303.a
	cp lib6800/lib6800.a .
	cp lib6803/lib6803.a .
	cp lib6303/lib6303.a .

frontend:
	+(cd frontend; make)

clean:
	(cd common; make clean)
	(cd cc68; make clean)
	(cd frontend; make clean)
	(cd copt; make clean)
	(cd libc; make clean)
	(cd lib6800; make clean)
	(cd lib6803; make clean)
	(cd lib6303; make clean)
	(cd libio; make clean)
	(cd target-mc10; make clean)
	(cd target-flex; make clean)
	(cd target-bm; make clean)
	rm -f lib6800.a lib6803.a lib6303.a

#
#	This aspect needs work
#
install:
	mkdir -p /opt/cc68/bin
	mkdir -p /opt/cc68/lib
	mkdir -p /opt/cc68/include
	mkdir -p /opt/cc68/include/flex
	mkdir -p /opt/cc68/include/mc10
	mkdir -p /opt/cc68/include/bm
	cp cc68/cc68 /opt/cc68/lib
	cp copt/copt /opt/cc68/lib
	cp copt/killdeadlabel /opt/cc68/lib/killdeadlabel68
	cp frontend/cc68 /opt/cc68/bin/
	cp cc68.rules /opt/cc68/lib
	cp cc68-00.rules /opt/cc68/lib
	cp libc/crt0.o /opt/cc68/lib
	cp libc/libc.a /opt/cc68/lib
	cp lib6800.a /opt/cc68/lib
	cp lib6803.a /opt/cc68/lib
	cp lib6303.a /opt/cc68/lib
	cp libio/6800/libio6800.a /opt/cc68/lib
	cp libio/6803/libio6803.a /opt/cc68/lib
	cp include/*.h /opt/cc68/include/
	cp target-mc10/lib/libmc10.a /opt/cc68/lib
	cp target-mc10/lib/crt0_mc10.o /opt/cc68/lib
	cp target-mc10/tools/tapeify /opt/cc68/lib/mc10-tapeify
	cp target-mc10/include/*.h /opt/cc68/include/mc10/
	cp target-flex/lib/libflex.a /opt/cc68/lib
	cp target-flex/tools/binify /opt/cc68/lib/flex-binify
	cp target-flex/include/*.h /opt/cc68/include/flex/
	cp target-bm/lib/libbm.a /opt/cc68/lib
	cp target-bm/lib/crt0_bm.o /opt/cc68/lib
	cp target-bm/include/*.h /opt/cc68/include/bm/
