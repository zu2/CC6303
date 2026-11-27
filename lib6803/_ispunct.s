
		.export _ispunct

		.code

_ispunct:
		clra
		tsx
		ldab 3,x
		cmpb #$21
		blo fail
		cmpb #$2F
		bls good
		cmpb #$3a
		blo fail
		cmpb #$40
		bls good
		cmpb #$5b
		blo fail
		cmpb #$60
		bls good
		cmpb #$7b
		blo fail
		cmpb #$7e
		bls good
fail:		clrb
		; any non zero is 'good
good:		rts
