
	.export _memset

	.setcpu 6803
	.code

_memset:
	tsx
	ldd	2,x
	beq	done
	addd	6,x
	std	@tmp		; s + n
	ldab	5,x
	ldx	6,x

loop:
	stab	,x
	inx
	cpx	@tmp
	bne	loop
	tsx
done:
	ldd	6,x
	rts
