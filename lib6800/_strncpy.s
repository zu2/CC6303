	.export _strncpy
	.code

_strncpy:
	tsx
	ldx	2,x		; n
	beq	done
	tsx
	ldab	7,x		; dest
	ldaa	6,x
	stab	@tmp+1
	staa	@tmp
	addb	3,x		; dest + n
	adca	2,x
	stab	@tmp3+1
	staa	@tmp3
	ldx	4,x		; src
	bra	copy
next:
	stx	@tmp
	ldx	@tmp2
copy:
	ldab	,x
	inx
	stx	@tmp2
	ldx	@tmp
	stab	,x
	inx
	cpx	@tmp3
	beq	done
	tstb
	bne	next
pad:
	clr	,x
	inx
	cpx	@tmp3
	bne	pad
done:
	tsx
	ldaa	6,x		; return dest
	ldab	7,x
	jmp	ret6
