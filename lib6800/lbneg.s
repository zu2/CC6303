;
;	Boolean negation for a long
;
	.export bnegeax

	.code

bnegeax:
	tsta
	bne nonz	; non zero
	tstb
	bne nonz2	; non zero
	; A and B are thus both zero from here on
	cmpa @sreg
	bne nonz3
	cmpa @sreg+1
	bne nonz4
	incb		; to 1
	rts
nonz:	clra
nonz2:	clrb
nonz3:	staa @sreg
nonz4:  stab @sreg+1
	rts
