;
;	void *memrchr(const void *s, int c, size_t n)
;
	.export _memrchr
	.setcpu 6800
	.code

_memrchr:
	tsx
	ldab	3,x
	ldaa	2,x
	addb	7,x
	adca	6,x
	stab	@tmp+1
	staa	@tmp		; s + n
	ldab	5,x
	ldx	6,x
	stx	@tmp2		; s
	ldx	@tmp
	bra	check
loop:
	dex
	cmpb	,x
	beq	match
check:
	cpx	@tmp2
	bne	loop
	clra
	clrb
	jmp	ret6
match:
	stx	@tmp
	ldab	@tmp+1
	ldaa	@tmp
	jmp	ret6
