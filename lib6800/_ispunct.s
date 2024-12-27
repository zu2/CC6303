;
;	ispunct(unsigned char c)
;		return	(c >= 0x21 && c <= 0x2f)
;		||	(c >= 0x3a && c <= 0x40)
;		||	(c >= 0x5b && c <= 0x60)
;		||	(c >= 0x7b && c <= 0x7e);
;
		.export _ispunct
		.code

_ispunct:
		clra
		tsx
		ldab 3,x
		cmpb #$21
		bcs fail
		cmpb #$2F
		bls good
		cmpb #$3a
		bcs fail
		cmpb #$40
		bls good
		cmpb #$5b
		bcs fail
		cmpb #$60
		bls good
		cmpb #$7b
		bcs fail
		cmpb #$7e
		bls good
fail:		clrb
		; any non zero is 'good
good:		jmp ret2
