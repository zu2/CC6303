;
;	isdigit(unsigned char c)
;		return (c>=0x21) && (c<=0x7e);
;
		.export _isgraph

		.code

_isgraph:
		clra
		tsx
		ldab 3,x
		cmpb #' '
		bls fail
		cmpb #127
		bcc fail
		; Any non zero value is valid
		jmp ret2
fail:		clrb
		jmp ret2
