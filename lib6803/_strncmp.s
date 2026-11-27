		.export _strncmp
		.setcpu 6803
		.code
_strncmp:
		tsx
		ldd 2,x
		beq done
		addd 6,x
		std @tmp3	; s1 + n
		ldd 4,x
		ldx 6,x
		std @tmp
loop:
		ldab ,x
		stx @tmp2
		ldx @tmp
		cmpb ,x
		blo retminus1
		bhi ret1
		tstb
		beq ret0
		inx
		stx @tmp
		ldx @tmp2
		inx
		cpx @tmp3
		bne loop
ret0:
		clra
		clrb
done:
		rts
ret1:
		ldd @one
		rts
retminus1:
		ldd #-1
		rts
		
