;
;	void *memchr(const void *s,int c,size_t n)
;
	.export _memchr
	.setcpu 6800
	.code

_memchr:
	tsx
	ldx 2,x
	beq retnull		; n == 0, return NULL
	tsx
	ldab 3,x
	ldaa 2,x
	addb 7,x
	adca 6,x
	stab @tmp+1
	staa @tmp		; stop point
;
	ldab 5,x
	ldx 6,x			; start point
loop:
	cmpb ,x
	beq match
	inx
	cpx @tmp
	bne loop
retnull:
	clra
	clrb
	jmp ret6
match:
	stx @tmp
	ldab @tmp+1
	ldaa @tmp
	jmp ret6
