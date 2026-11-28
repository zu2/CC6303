	.export _strlcpy
	.export strlcpyx
	.setcpu 6800
	.code

_strlcpy:
	tsx
	ldab	7,x
	ldaa	6,x
	addb	3,x
	adca	2,x
	stab	@tmp3+1
	staa	@tmp3		; dest + size
	ldx	6,x

strlcpyx:			; X = write address, @tmp3 = dest + size
	stx	@tmp
	tsx
	ldab	@tmp+1
	ldaa	@tmp
	subb	7,x
	sbca	6,x
	stab	@tmp1+1
	staa	@tmp1		; initial destination length
	ldx	4,x
	stx	@tmp2		; source cursor
	ldx	@tmp
	cpx	@tmp3
	beq	scan
	ldx	@tmp3
	dex
	stx	@tmp3		; reserve a byte for NUL
	ldx	@tmp
copy:
	cpx	@tmp3
	beq	terminate
	ldx	@tmp2
	ldab	,x
	beq	terminate
	inx
	stx	@tmp2
	ldx	@tmp
	stab	,x
	inx
	stx	@tmp
	bra	copy
terminate:
	ldx	@tmp
	clr	,x
scan:
	ldx	@tmp2
scanloop:
	tst	,x
	beq	done
	inx
	bra	scanloop
done:
	stx	@tmp2
	tsx
	ldab	@tmp2+1
	ldaa	@tmp2
	subb	5,x
	sbca	4,x
	addb	@tmp1+1
	adca	@tmp1
	jmp	ret6
