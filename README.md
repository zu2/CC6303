# about this fork.

This is a fork of @EtchedPixels CC6303 compiler. The license is the same as the original CC6303.

In this fork, the output for the 6800 CPU has been significantly improved.

The 6800 version is maintained here. Issues and pull requests are always welcome.

If you have any requests or suggestions for other CPUs (6303,6803), please let me know by opening an issue or pull request. 

----
----
Below is the original README.

The original project is no longer active, but this repository will continue to maintain it.

----
----
# THIS IS NO LONGER AN ACTIVE PROJECT

For the current compiler and tools work please see
- https://github.com/EtchedPixels/Fuzix-Bintools
- https://github.com/EtchedPixels/Fuzix-Compiler-Kit

For a 6800 specific fork of this code under development by Zu2 please see
- https://github.com/zu2/CC6303

# CC6303
A C compiler for the 6800/6803/6303 processors

This is based upon cc65 [https://github.com/cc65/cc65] but involves doing
some fairly brutal things to the original compiler. As such I currently have
no plans to merge it back the other way.

In particular cc65 has a model where the code is generated into a big array
which is parsed as it goes into all sorts of asm level info which drives
optimizer logic. It also uses it to allow the compiler to re-order blocks
and generate code then change its mind.

## Status

The basic structure is now reasonably functional. You can "make" and "make
install" to get a complete compiler/assembler/linker/tools that appear
to generate actual binaries.

The assembler and linker should be reasonably reliable and complete. The
compiler at this point should be reasonably solid on 6803 and 6303 except for
32bit types. The core compiler support for 32bit types is there and mostly
tested but the library helpers for shifts, multiply and particularly division
are not yet fully debugged.

On the 6800 processor the library routines are far from complete. Note that
the 6800 target will generate much slower and larger code because the 6800
lacks 16bit operations and some other important features. 6800 code is about
a third larger.

The bundled C library routines are initial code and not fully tested or reviewed.
They are intended to provide native versions of key and time critical functions
not a full C library.

## How to use

For a simple test environment the easiest approach at this point is to
compile the code with cc68 and then link with a suitable crt.o (entry code)

````
cc68 -m6803 -c foo.c
ld68 -b -C startaddress crt.o mycode.o /opt/cc68/lib/lib6803.a
````

## Tandy MC-10 target

````
cc68 -tmc10 foo.c -o foo
````

This will produce a foo.c10 that can be loaded into an emulator or turned
into a wav file. A few minimal C library functions are present including
putchar/puts.

## TODO

- Strip out lots more unused cc65 code. There is a lot of unused code,
  and a load of dangling header references and so on left to resolve.

- Remove remaining '6502' references.

- Make embedding C source into asm as comments work for debugging

- Maybe float: cc65 lacks float beyond the basic parsing support, so this
  means extending the back end to handle all the fp cases (probably via
  stack) and using the long handling paths for the non maths ops.

- A proper optimizer

## BIG ISSUES

- We can make much better use of X in some situations than the cc65 code
  based generator really understands. In particular we want to be able to
  tell the expression evaluation "try and evaluate this into X without using
  D". In practice that means simple constants and stack offsets. That will
  improve some handling of helpers. We can't do that much with it because
  we need to be in D for maths. Right now the worst of this is peepholed.

- Fetch pointers via X when we can, especially on 6803. In particular also
  deal with pre/post-inc of statics (but not alas pre/post inc locals) with

````
	ldx $foo
	inx
	stx $foo
	dex
````
- Make sure we can tell if the result of a function is being evaluated or if
  the function returns void. In those cases we can use D (mostly importantly
  B) to use abx to fix the stack offsets.

- copt has no idea about register usage analysis, dead code elimination etc.
  We could do far better with a proper processor that understood 680x not
  just a pattern handler. We fudge it a bit with hints but it's not ideal.

- Floating point
  The cc65 front end has some float support although it is not supported by
  the back end, and I don't know how tested the frontend code is therefore.
  Adding float should not be hard, it's basically a long with no inlineable
  operators as far as the compiler code generator is concerned. It would
  however need someone to volunteer to write the basic IEEE floating point
  operations (add, negate, multiply, divide, maybe compare, plus conversion
  to and from float) for a 680x processor.
