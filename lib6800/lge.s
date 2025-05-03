;
;       TOS (2-5,x) >= sreg:D ?
;
	.code
	.export tosgeeax

tosgeeax:
	staa @tmp
	stab @tmp+1
	tsx
	ldaa 2,x
	cmpa @sreg
	bgt  true
	blt  false
	ldab 3,x
	cmpb @sreg+1
	bne  found
	ldaa 4,x
	cmpa @tmp
	bne  found
	ldab 5,x
	cmpb @tmp+1
found:	bcc true
false:	jmp false4
true:	jmp true4
