;
;	islower(unsigned char c)
;		return (c >= 'a') && (c <= 'z');
;
		.export _islower

		.code

_islower:
		clra
		tsx
		ldab 3,x
		cmpb #'a'
		bcs fail
		cmpb #'z'
		bhi fail
		; Any non zero value is valid
		jmp ret2
fail:		clrb
		jmp ret2
