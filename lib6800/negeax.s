;
;	Negate the working register
;
	.export negeax

	.code

negeax:
	com @sreg
	com @sreg+1
	nega
	negb
	sbca #0
	bne ret
	inc @sreg+1
	bne ret
	inc @sreg
ret:	rts
