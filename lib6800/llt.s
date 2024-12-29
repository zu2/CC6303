
	.code
	.export toslteax

toslteax:
	staa @tmp
	stab @tmp+1
	tsx
	ldaa 2,x
	cmpa @sreg
	blt  true
	bgt  false
	ldab 3,x
	cmpb @sreg+1
	bne  found
	ldaa 4,x
	cmpa @tmp
	bne  found
	ldab 5,x
	cmpb @tmp+1
found:	bcs true
false:	jmp false4
true:	jmp true4


