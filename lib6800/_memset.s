;
;	void *memset(void *det, int c, size_t count)
;
	.export _memset

	.code

_memset:
	tsx
	ldx	2,x
	beq	endset
	tsx
	ldab	7,x		; dest + count
	ldaa	6,x
	addb	3,x
	adca	2,x
	stab	@tmp+1		; dest end address
	staa	@tmp
	ldab	5,x		; char to set
	ldx	6,x		; destination
memset_loop:
	stab	0,x
	inx
	cpx	@tmp
	bne	memset_loop
endset:
	tsx
	ldab	7,x		; return dest
	ldaa	6,x
	jmp	ret6
