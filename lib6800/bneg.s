;
;	Boolean negation
;
	.code
	.export bnega
	.export bnegax

bnegax:	; if D==0 then D=1 else D=0
	aba
	adca #0
	beq ret1
ret0:
	clra
	clrb
	rts
bnega:	; if B==0 then D=1 else D=0
	tstb
	bne ret0
ret1:
	clra
	ldab #1
	rts
