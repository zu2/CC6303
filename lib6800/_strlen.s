;
;	size_t strlen(const char *str)
;

	.code
	.export _strlen

	.setcpu 6800

_strlen:
	tsx
	ldx 2,x
	dex
	ldab #$ff
	tba
cl:	addb #1
	adca #0
	inx
	tst ,x
	bne cl
	jmp ret2
