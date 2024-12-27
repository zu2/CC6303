;
;	isdigit(unsigned char c)
;		return (c>='0') && (c<='9');
;

		.export _isdigit

		.code

_isdigit:
		clra
		tsx
		ldab 3,x
		cmpb #'0'
		bcs fail
		cmpb #'9'
		bhi fail
		; Any non zero value is valid
		jmp ret2
fail:		clrb
		jmp ret2
