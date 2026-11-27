	.export _strnlen
	.code

_strnlen:
	tsx
	ldab	3,x		; n
	ldaa	2,x
	addb	5,x		; s + n
	adca	4,x
	stab	@tmp+1
	staa	@tmp
	ldx	4,x		; s
	clra
	clrb
	bra	check
loop:
	tst	,x
	beq	done
	inx
	incb
	bne	check
	inca
check:
	cpx	@tmp
	bne	loop
done:
	jmp	ret4
