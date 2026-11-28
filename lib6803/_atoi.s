	.export _atoi
	.setcpu 6803
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
	clra
	clrb
	std	@tmp1
	staa	@tmp3
digits:
	ldab	,x
	subb	#'0'
	cmpb	#9
	bhi	done
	stab	@tmp3+1
	ldd	@tmp1
	jsr	mulax10
	addd	@tmp3
	std	@tmp1
	inx
	bra	digits
done:
	ldd	@tmp1
	tst	@tmp2
	beq	result
	coma
	comb
	addd	@one
result:
	rts
