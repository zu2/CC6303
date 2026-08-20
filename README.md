# CC6303

A C compiler for the 6800, 6803 and 6303 processors.

This is a fork of [@EtchedPixels CC6303](https://github.com/EtchedPixels/CC6303).
The license is the same as the original.

Issues and pull requests are welcome.

## Installation

Follow the steps below.

### 1. Install Fuzix-Bintools

First, install [Fuzix-Bintools](https://codeberg.org/EtchedPixels/Fuzix-Bintools).

    git clone https://codeberg.org/EtchedPixels/Fuzix-Bintools
    cd Fuzix-Bintools
    make
    sudo make install

`make install` copies the binaries to `/opt/fcc/bin`. Make sure these are on
your `$PATH`:

| Binary | Used by |
|---|---|
| `as6800` | the cc68 driver, to assemble |
| `ld6800` | the cc68 driver, to link |
| `nm6809` | `lorder6800`, while building the libraries |

    export PATH=/opt/fcc/bin:$PATH

### 2. Install Fuzix-Compiler-Kit

Next, install [Fuzix-Compiler-Kit](https://codeberg.org/EtchedPixels/Fuzix-Compiler-Kit).

    git clone https://codeberg.org/EtchedPixels/Fuzix-Compiler-Kit
    cd Fuzix-Compiler-Kit
    make
    sudo make install

Make sure these are on your `$PATH` as well:

| Binary | Used by |
|---|---|
| `lorder6800` | the library Makefiles, to order objects for `ar` |
| `emu6800` | the tests, to run compiled programs |

Fuzix-Compiler-Kit installs under `/opt/fcc` as well, so the `$PATH` above
covers both.

### 3. Install CC6303

    git clone https://github.com/zu2/CC6303
    cd CC6303
    make
    sudo make install

`make install` copies the binaries to `/opt/cc68/bin`. Put the directory on
your `$PATH`:

    export PATH=/opt/cc68/bin:$PATH

`make` checks the tools above first, and it names any tool it cannot find.

## Usage

    cc68 -m6800 -o foo foo.c

| option | meaning |
|---|---|
| `-m{cpu}` | Target cpu: 6800, 6803 or 6303. The default is 6303 |
| `-t sys` | Target system: fuzix, fuzixrel1, fuzixrel2, mc10, flex or bm |
| `-c` `-S` `-E` | Stop after the assemble, compile or preprocess stage |
| `-o name` | Name the output file |
| `-M` | Write a map file |
| `--start-addr addr` | Set the link base address (see #12). This overrides the target default |
| `--zp-addr addr` | Set the zero page base address. This overrides the target default |
| `--bin` | Also write a `.bin` file. See below |

`-t` sets the cpu as well: mc10 selects 6803, flex and bm select 6800.

ld6800 pads its output from address 0 up to the base address. `--bin` writes a
second file without that padding, so the file starts at the base address.

## Targets

| target | base address | zero page base | extra output |
|---|---|---|---|
| fuzix | `0x0100` | `0x00` | |
| fuzixrel1 | `0x0100` | `0x00` | |
| fuzixrel2 | `0x0200` | `0x02` | |
| mc10 | `0x445C` | `0x90` | `.c10` |
| flex | `0x0100` | `0x28` | `.cmd` |
| bm | `0x2100` | `0xE2` | |

Without `-t` the base address is `0x0100` and the zero page base is `0x00`.

### Tandy MC-10

    cc68 -tmc10 foo.c -o foo

This produces a foo.c10 that can be loaded into an emulator or turned into a
wav file. A few minimal C library functions are present including putchar/puts.

### Hitachi Basic Master

    cc68 -tbm --bin foo.c -o foo

This writes `foo` and `foo.bin`. Convert `foo.bin` to the format your tool or
emulator needs. For example:

    objcopy -I binary -O srec --adjust-vma=0x2100 foo.bin foo.mot
    objcopy -I binary -O ihex --adjust-vma=0x2100 foo.bin foo.hex

Give `--adjust-vma` the same address as the base address. See
`target-bm/samples/Makefile` for an example.

## Notes

- 6803 and 6303 fall back to lib6800 for routines they do not have (#15). The
  6800 code does not use the extra 6803 instructions, so it is slower.
- The 6800 target generates slower and larger code, because the 6800 lacks
  16 bit operations and some other important features. 6800 code is about a
  third larger.
- The bundled C library provides native versions of key and time critical
  functions, not a full C library.
- The core compiler support for 32 bit types is there and mostly tested, but
  the library helpers for shifts, multiply and particularly division are not
  yet fully debugged.
- The back end does not support floating point.
- The old bundled assembler (as68) has been removed. See #13.

## Appendix: every option

```
$ cc68 --help
Usage: cc68 [options] file
Short options:
  -Dsym[=defn]			Define a symbol
  -E				Stop after the preprocessing stage
  -I dir			Set an include directory search path
  -L dir			Set an library directory search path
  -M				Map file
  -S				Stop after the compile stage
  -X				Keep temp
  -c				Stop after the assemble stage
  -h				Show this help and exit
  -l				Add library
  -m{cpu}				Target cpu (6800, 6803, 6303)
  -o name			Name the output file
  -s				Standalone
  -t sys			Set the target system (fuzix, fuzixrel1, fuzixrel2, mc10, flex, bm)

Long options:
  --add-source			Include source as comment
  --bin				Write the image without the padding before the base
  --bss-name seg		Set the name of the BSS segment
  --check-stack			Generate stack overflow checks
  --code-name seg		Set the name of the CODE segment
  --data-name seg		Set the name of the DATA segment
  --debug			Debug mode
  --help			Show this help and exit
  --inline-stdfuncs		Inline some standard functions
  --register-space b		Set space available for register variables
  --register-vars		Enable register variables
  --rodata-name seg		Set the name of the RODATA segment
  --signed-chars		Default characters are signed
  --standard std		Language standard (c89, c99, cc65)
  --start-addr addr		Set the link base address (overrides the target default)
  --verbose			Increase verbosity
  --writable-strings		Make string literals writable
  --zp-addr addr		Set the zero page base address (overrides the target default)
```

---
---

Big problems are still open. [README.orig.md](README.orig.md) holds the
original README, which lists them along with the design notes.
