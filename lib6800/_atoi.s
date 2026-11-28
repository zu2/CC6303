	.export _atoi
	.setcpu 6800
	.code

_atoi:
	tsx
	ldx	2,x
	clr	@tmp2		; negative sign
	bra	skipspace
space:
	inx
skipspace:
	ldab	,x
	cmpb	#' '
	beq	space
	cmpb	#9
	blo	sign
	cmpb	#13
	bls	space
sign:
	cmpb	#'-'
	bne	plus
	inc	@tmp2
	bra	skip_sign
plus:
	cmpb	#'+'
	bne	start
skip_sign:
	inx
start:
	clr	@tmp1
	clr	@tmp1+1
digits:
	ldab	,x
	subb	#'0'
	cmpb	#9
	bhi	done
	stab	@tmp2+1
	ldaa	@tmp1
	ldab	@tmp1+1
	jsr	mulax10
	addb	@tmp2+1
	adca	#0
	staa	@tmp1
	stab	@tmp1+1
	inx
	bra	digits
done:
	ldaa	@tmp1
	ldab	@tmp1+1
	tst	@tmp2
	beq	result
	nega
	negb
	sbca	#0
result:
	jmp	ret2
