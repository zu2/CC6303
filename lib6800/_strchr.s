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
	dex
;
loop:
	inx
	cmpb 0,x
	beq found
	ldaa 0,x
	bne loop
;
	clra
	clrb
	jmp ret4
;
found:
	stx @tmp
	ldab @tmp+1
	ldaa @tmp
	jmp ret4
