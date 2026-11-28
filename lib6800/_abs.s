	.export _abs
	.setcpu 6800
	.code

_abs:
	tsx
	ldaa	2,x
	ldab	3,x
	tsta
	bpl	done
	nega
	negb
	sbca	#0
done:
	jmp	ret2
