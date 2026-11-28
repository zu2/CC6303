;
;	These are based ont the CC65 runtime. 6803 is much the same
;	as 6502 here except we've got ldd to load two bytes (and the
;	optimizer will turn it into a 2 byte load of 'one' in the direct page)
;

	.setcpu 6803
	.code

	.export booleq
	.export booleqc
	.export boolne
	.export boolnec
	.export boolle
	.export boollec
	.export boollt
	.export boolltc
	.export boolge
	.export boolgec
	.export boolgt
	.export boolgtc
	.export boolule
	.export boolulec
	.export boolult
	.export boolultc
	.export booluge
	.export boolugec
	.export boolugt
	.export boolugtc

;
;	Turn  val op test into 1 for true 0 for false. Ensure the Z flag
;	is appropriately set
;

booleqc:
booleq:
	bne	ret0
ret1:
	ldd	@one
	rts

boolnec:
boolne:
	bne	ret1
ret0:
	clra
	clrb
	rts

boollec:
boolle:
	beq	ret1
boolltc:
boollt:
	blt	ret1
	clra
	clrb
	rts

boolgec:
boolge:
	beq	ret1
boolgtc:
boolgt:	bgt	ret1
	clra
	clrb
	rts

boolugtc:
boolugt:
	beq	ret0
boolugec:
booluge:
	bcc	ret1
	clra
	clrb
	rts

boolulec:
boolule:
	beq	ret1
boolultc:
boolult:			; use C flag
	ldd	@zero
	rolb
	rts
