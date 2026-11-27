;
;	isascii(int c)
;		return (c >= 0 && c <= 0x7f);
;
		.export _isascii
		.code

_isascii:
		clra
		clrb
		tsx
		tst 2,x
		bne done
		tst 3,x
		bmi done
		incb
done:		jmp ret2
