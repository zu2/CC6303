;
;	char *strchr(const char *str, int c)
;

	.code
	.export _strchr

	.setcpu 6800

_strchr:
	tsx
	ldab 3,x
	ldx 4,x
loop:	cmpb ,x
	beq found
	inx
	ldaa ,x
	bne loop
	clra
	clrb
	jmp ret4
found:
	stx @tmp
	ldab @tmp+1
	ldaa @tmp
	jmp ret4
