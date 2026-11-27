

	.setcpu 6303
	.code
	.export _strnlen


_strnlen:
	tsx
	ldd 2,x			; n
	beq to_rts
	addd 4,x
	std @tmp		; save it
	ldx 4,x
	clra
	clrb
cl:	tst ,x
	beq to_rts
	inx
	addd @one
	cpx @tmp		; did we hit the stop
	bne cl
to_rts:
	rts
