;
;	Function returns. To deal with the cost of popping arguments on
;	the 6800 in particular we want to do stack cleanup here. However
;	the return address is on the stack 8(
;
		.export ret1
		.export ret2
		.export ret3
		.export ret4
		.export ret5
		.export ret6
		.export ret7
		.export ret8
		.export ret9
		.export ret10
		.export ret11
		.export ret12
		.export retnX

ret1:
		tsx
		ldx ,x
		bra ins3
ret2:
		tsx
		ldx ,x
		bra ins4
ret3:
		tsx
		ldx ,x
		bra ins5
ret4:
		tsx
		ldx ,x
		bra ins6
ret5:
		tsx
		ldx ,x
		bra ins7
ret6:
		tsx
		ldx ,x
		bra ins8
ret7:
		tsx
		ldx ,x
		bra ins9
ret8:
		tsx
		ldx ,x
		bra ins10
ret9:
		tsx
		ldx ,x
		bra ins11
ret10:
		tsx
		ldx ,x
		bra ins12
ret11:
		tsx
		ldx ,x
		bra ins13
ret12:
		tsx
		ldx ,x
		ins
ins13:
		ins
ins12:
		ins
ins11:
		ins
ins10:
		ins
ins9:
		ins
ins8:
		ins
ins7:
		ins
ins6:
		ins
ins5:
		ins
ins4:
		ins
ins3:
		ins
		ins
		ins
		jmp ,x

;
;	SP += IX and return
;		66cycle + caller ldx 3cycla
;
retnX:
		stx @tmp
		tsx
		ldx 0,x
		sts @tmp3
		pshb
		ldab @tmp+1
		addb @tmp3+1
		stab @tmp3+1
		ldab @tmp
		adcb @tmp3
		stab @tmp3
		pulb
		lds @tmp3
		jmp ,x
