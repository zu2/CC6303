;
;	isupper(unsigned char c)
;		return (c>='A') && (c<='Z');
;
;
		.export _isupper

		.code

_isupper:
		clra
		tsx
		ldab 3,x
		cmpb #'A'
		bcs fail
		cmpb #'Z'
		bhi fail
		; Any non zero value is valid
		jmp ret2
fail:		clrb
		jmp ret2
