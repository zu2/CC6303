;
;	Right shift unsigned  TOS >> D
;

	.export tosshrax

	.code

tosshrax:
	tstb
	beq retdone
	cmpb #15		; More bits are meaningless
	bgt ret0
	tsx
loop:
	lsr 2,x
	ror 3,x
	decb
	bne loop
retdone:
	jmp pop2get
ret0:
	clra
	clrb
	jmp pop2
