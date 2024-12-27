;
;	Subtract sreg:d from the top of stack
;

	.export tossubeax

	.code

tossubeax:
	tsx
	stab @tmp+1		; save the low 16bits to subtract
	staa @tmp
	ldab 5,x		; low 16 of TOS
	subb @tmp+1		; subtract the low 16
	ldaa 4,x
	sbca @tmp
	pshb
	ldab 3,x		; top 16 of TOS
	sbcb @sreg+1		; no sbcd so do this in 8bit chunks
	stab @sreg+1
	ldab 2,x
	sbcb @sreg		; D is now sreg - 3,X
	stab @sreg		; save the new top 16bits
	pulb			; recover the value for D
	jmp pop4		; and fix up the stack
