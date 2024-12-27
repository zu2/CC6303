;
;	char *strcmp(const char *s1, const char *s2)
;

	.export _strcmp
	.code

_strcmp:
	tsx
	ldx	4,x		; dest
	stx	@tmp
	tsx
	ldx	2,x		; src
	bra	cmpbegin
cmploop:
	inx
	stx	@tmp
	ldx	@tmp2
cmpbegin:
	ldab	,x
	inx
	stx	@tmp2
	ldx	@tmp
	cmpb	,x
	bne	cmpend
	tstb
	bne	cmploop
cmpzero:
	clrb
	clra
	jmp	ret4
cmpend:
	bcs	cmplt
	clra
	ldab	#1
	jmp	ret4
cmplt:
	ldab	#$FF
	tba
	jmp	ret4
