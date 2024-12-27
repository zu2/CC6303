;
;	Push indirected via X
;
	.export pshindvx
	.export pshindvx1
	.export pshindvx2
	.export pshindvx3
	.export pshindvx4
	.export pshindvx5
	.export pshindvx6
	.export pshindvx7
	.code

pshindvx:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 1,x
	ldaa 0,x
	pshb
	psha
	jmp @jmptmp
pshindvx1:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 2,x
	ldaa 1,x
	pshb
	psha
	jmp @jmptmp
pshindvx2:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 3,x
	ldaa 2,x
	pshb
	psha
	jmp @jmptmp
pshindvx3:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 4,x
	ldaa 3,x
	pshb
	psha
	jmp @jmptmp
pshindvx4:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 5,x
	ldaa 4,x
	pshb
	psha
	jmp @jmptmp
pshindvx5:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 6,x
	ldaa 5,x
	pshb
	psha
	jmp @jmptmp
pshindvx6:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 7,x
	ldaa 6,x
	pshb
	psha
	jmp @jmptmp
pshindvx7:
	pula
	pulb
	staa @tmp
	stab @tmp+1
	ldab 8,x
	ldaa 7,x
	pshb
	psha
	jmp @jmptmp
