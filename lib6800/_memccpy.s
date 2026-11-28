	.export _memccpy
	.setcpu 6800
	.code

_memccpy:
	tsx
	ldx	2,x
	beq	nomatch
	tsx
	ldab	3,x
	ldaa	2,x
	addb	7,x
	adca	6,x
	stab	@tmp3+1
	staa	@tmp3		; source + n
	ldx	8,x
	stx	@tmp		; destination
	tsx
	ldab	5,x		; match byte
	ldx	6,x
loop:
	ldaa	,x
	inx
	stx	@tmp2
	ldx	@tmp
	staa	,x
	inx
	stx	@tmp
	cba
	beq	match
	ldx	@tmp2
	cpx	@tmp3
	bne	loop
nomatch:
	clra
	clrb
	jmp	ret8
match:
	ldaa	@tmp
	ldab	@tmp+1
	jmp	ret8
