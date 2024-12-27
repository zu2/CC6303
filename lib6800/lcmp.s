	.code
	.export toslcmp

;
;	Compare the 4 bytes stack top with the 32bit accumulator
;	We are always offset because we are called with a jsr from
;	the true helper
;
toslcmp:
	tsx
	staa @tmp	; Save the low 16bits
	stab @tmp+1
	; Compare the high word byte by byte
	ldaa 4,x
	suba @sreg
	beq byte2
	bgt donec
	sec		; force carry if < so that the wrapper is simple
	rts
donec:
	clc
	rts

byte2:
	ldab 5,x
	subb @sreg+1
	bne done
	; The high word matched, so compare the low word the same way
	ldaa 6,x
	suba @tmp
	bne done
	ldab 7,x
	subb @tmp+1
done:
	rts
