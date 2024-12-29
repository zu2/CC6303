;
;	These are based ont the CC65 runtime. 6803 is much the same
;	as 6502 here except we've got ldd to load two bytes (and the
;	optimizer will turn it into a 2 byte load of 'one' in the direct page)
;

	.code

	.export booleq
	.export boolne
	.export boolle
	.export boollt
	.export boolge
	.export boolgt
	.export boolule
	.export boolult
	.export booluge
	.export boolugt
	.export booleqc
	.export boolnec
	.export boollec
	.export boolltc
	.export boolgec
	.export boolgtc
	.export boolulec
	.export boolultc
	.export boolugec
	.export boolugtc

;
;	Turn  val op test into 1 for true 0 for false. Ensure the Z flag
;	is appropriately set
;

booleq:
	bne	ret0
	tstb
	bne	ret0
ret1:
	clrb
	ldab #1
	rts

boolne:
	bne	ret1
	tstb
	bne	ret1
	rts		; AccA,B = 0

boolle:
	blt	ret1
	bgt	ret0
	tstb
booleqc:
	beq	ret1
ret0:
	clra
	clrb
	rts

boollt:
boolltc:
	blt	ret1
	clrb
	clra
	rts

boolge:
boolgec:
	bge	ret1
	clrb
	clra
	rts

boolgt:
	bgt	ret1
	tstb
	bne	ret1
	clra		; AccB = 0
	rts

boolugt:
	bhi	ret1
	tstb
	bne	ret1
	clra		; AccB = 0
	rts

booluge:
boolugec:
	bcc	ret1
	clra
	clrb
	rts

boolule:
	bcs	ret1
	bhi	ret0
	tstb
	bne	ret0
	clra		; AccB = 0
	incb
	rts

boolult:
boolultc:
	bcs	ret1
	clra
	clrb
	rts

;
;	char
;

boolnec:
	bne	ret1
	clra
	clrb
	rts

boollec:
	ble	ret1
	clra
	clrb
	rts

boolgtc:
	bgt	ret1
	clra
	clrb
	rts

boolugtc:
	bhi	ret1
	clra
	clrb
	rts

boolulec:
	bls	ret1
	clra
	clrb
	rts
