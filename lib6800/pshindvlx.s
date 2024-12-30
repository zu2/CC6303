;
;	Push indirected long via X
;
	.export pshindvlx
	.export pshindvlx1
	.export pshindvlx2
	.export pshindvlx3
	.export pshindvlx4
	.export pshindvlx5
	.export pshindvlx6
	.export pshindvlx7
	.code

pshindvlx:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 3,x
	ldaa 2,x
	pshb
	psha
	ldab 1,x
	ldaa 0,x
	pshb
	psha
	jmp @jmptmp
pshindvlx1:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 4,x
	ldaa 3,x
	pshb
	psha
	ldab 2,x
	ldaa 1,x
	pshb
	psha
	jmp @jmptmp
pshindvlx2:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 5,x
	ldaa 4,x
	pshb
	psha
	ldab 3,x
	ldaa 2,x
	pshb
	psha
	jmp @jmptmp
pshindvlx3:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 6,x
	ldaa 5,x
	pshb
	psha
	ldab 4,x
	ldaa 3,x
	pshb
	psha
	jmp @jmptmp
pshindvlx4:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 7,x
	ldaa 6,x
	pshb
	psha
	ldab 5,x
	ldaa 4,x
	pshb
	psha
	jmp @jmptmp
pshindvlx5:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 8,x
	ldaa 7,x
	pshb
	psha
	ldab 6,x
	ldaa 5,x
	pshb
	psha
	jmp @jmptmp
pshindvlx6:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 9,x
	ldaa 8,x
	pshb
	psha
	ldab 7,x
	ldaa 6,x
	pshb
	psha
	jmp @jmptmp
pshindvlx7:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 10,x
	ldaa 9,x
	pshb
	psha
	ldab 8,x
	ldaa 7,x
	pshb
	psha
	jmp @jmptmp
