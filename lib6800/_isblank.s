;
;	isblank(unsigned char c)
;		return (c == 0x20) || (c == 0x09);
;
		.export _isblank

		.code

_isblank:
		clra
		tsx
		ldab 3,x
		cmpb #' '
		beq good
		cmpb #9		; tab
		beq good
		; Any non zero value is valid
		clrb
good:
		jmp ret2
