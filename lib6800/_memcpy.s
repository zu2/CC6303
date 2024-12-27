;
;	void *memcpy(void *dest, const void *src, size_t count)
;
	.export _memcpy

	.setcpu 6800
	.code

_memcpy:
	tsx
	ldx	2,x		; length
	beq	endcopy
	tsx
	ldx	6,x		; destination
	stx	@tmp
	tsx
	ldab	5,x		; src
	ldaa	4,x
	addb	3,x		; +length
	adca	2,x
	stab	@tmp3+1		; src end address
	staa	@tmp3
	ldx	4,x		; src
	stx	@tmp2
memcpy_loop:
	ldab	0,x		; read from src
	inx
	stx	@tmp2
	ldx	@tmp		; store to dest
	stab	0,x
	inx
	stx	@tmp
	ldx	@tmp2
	cpx	@tmp3
	bne	memcpy_loop
endcopy:
	tsx
	ldab	7,x		; return dest
	ldaa	6,x
	jmp	ret6
