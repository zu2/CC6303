	.export _labs
	.code

_labs:
	tsx
	ldx 2,x
	stx @sreg
	tsx
	ldaa 4,x
	ldab 5,x
	tst 2,x
	bpl labsdone
	jsr negeax
labsdone:
	jmp ret4
