;
;	Stack unwind helpers
;
	.export pop4
	.export tpop4
	.export swap32pop4
	.export pop4flags
	.export true4
	.export false4

	.code

swap32pop4:
	staa @sreg
	stab @sreg+1
tpop4:
	ldaa @tmp
	ldab @tmp+1
pop4:
	tsx		; Fake the missing pulx
	ldx ,x
pop4h:
	ins
	ins
	ins
	ins
	ins
	ins
	jmp ,x
false4:
	clra
	clrb
	bra pop4flags
true4:
	clra
	ldab #1
pop4flags:
	tsx
	ldx ,x
	tstb
	bra pop4h
