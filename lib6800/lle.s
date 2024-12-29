
	.code
	.export tosleeax

tosleeax:
	staa @tmp
	stab @tmp+1
	tsx
	ldaa 2,x
	cmpa @sreg
	blt  false
	bgt  true
	ldab 3,x
	cmpb @sreg+1
	bne  found
	ldaa 4,x
	cmpa @tmp
	bne  found
	ldab 4,x
	cmpb @tmp+1
found:	bcc true
false:	jmp false4
true:	jmp true4


