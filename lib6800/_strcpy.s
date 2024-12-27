;
;	char *strcpy(char *dest, const char *src)
;

	.export _strcpy
	.code

_strcpy:
	tsx
	ldx	4,x		; dest
	stx	@tmp
	tsx
	ldx	2,x		; src
copyloop:
	ldab	,x
	inx
	stx	@tmp2
	ldx	@tmp
	stab	,x
	inx
	stx	@tmp
	ldx	@tmp2
	tstb
	bne copyloop
	tsx
	ldab	5,x		; return dest
	ldaa	4,x
	jmp	ret4
