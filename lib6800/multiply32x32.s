;
;	32bit multiply by addition
;
;	Multiply 3,x by sreg:d
;
		.export tosumuleax
		.export tosmuleax
		.setcpu 6800

		.code
tosmuleax:
tosumuleax:
		staa @tmp	; D into tmp to free registers sreg:tmp is now the value
		stab @tmp+1
		clra
		psha		; Work space to zero
		psha		; We will iteratively add to this for each 1 bit
		psha
		psha		; workspace is ,x argument is now 6,x
		tsx
		;
		;	Now work bitwise through it
		;
		ldaa @tmp+1
		bsr bits8
		ldaa @tmp
		bsr bits8
		ldaa @sreg+1
		bsr bits8
		ldaa @sreg
		bsr bits8
		;	Now copy out the data
		pula
		staa @sreg
		pula
		staa @sreg+1
		pula
		pulb
		jmp pop4		

;
;	Process an 8x32 slice of the multiply. We could optimize this if we un-inlined it as we can do 32bit, 24bit, 16bit, 8bit
;	because we know there are zeros at the end.
;
bits8:
		beq shift8
		ldab #8
		stab @tmp2
next8:
		lsra
		bcc noadd
		; 32bit add
		ldab 3,x
		addb 9,x
		stab 3,x
		ldab 2,x
		adcb 8,x
		stab 2,x
		ldab 1,x
		adcb 7,x
		stab 1,x
		ldab 0,x
		adcb 6,x
		stab 0,x
noadd:
		lsl 9,x		; left shift each time we move up a bit
		rol 8,x		; through the number
		rol 7,x
		rol 6,x
		dec @tmp2
		bne next8
		rts
shift8:
		ldab 7,x
		stab 6,x
		ldab 8,x
		stab 7,x
		ldab 9,x
		stab 8,x
		clr  9,x
		rts
