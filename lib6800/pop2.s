

	.export pop2
	.export pop2flags
	.export false2
	.export true2

	.code

pop2:
	tsx				; no pulx on original 6800
	ldx ,x				; so do it by hand
pop2h:
	ins
	ins
	ins
	ins
	jmp ,x
false2:
	clra
	clrb
	bra pop2flags
true2:
	clra
	ldab #1
pop2flags:
	tsx
	ldx ,x
	; B is 0 or 1 and we just need to set Z
	tstb
	bra pop2h

	

