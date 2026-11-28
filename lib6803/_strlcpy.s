	.export _strlcpy
	.export strlcpyx
	.setcpu 6803
	.code

_strlcpy:
	tsx
	ldd	6,x
	addd	2,x
	std	@tmp3		; dest + size
	ldx	6,x

strlcpyx:			; X = write address, @tmp3 = dest + size
	stx	@tmp
	tsx
	ldd	@tmp
	subd	6,x
	std	@tmp1		; initial destination length
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
	ldd	@tmp2
	subd	4,x
	addd	@tmp1
	rts
