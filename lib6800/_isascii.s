;
;	isascii(unsigned char c)
;		return (c <= 0x7f);
;
		.export _isascii
		.code

_isascii:
		clra
		clrb
		tsx
		tst 3,x
		bmi fail
		incb
fail:		
		jmp ret2
