;
;	Generate a frame pointer offset into X
;
		.export fixfp
		.export restorefp
		.code

fixfp:
		; On entry B holds the offset and the caller made a hole
		; for fp on the stack
		tsx
		ldx 0,x
		stx @tmp	; return address
		; Old fp into the hole
		tsx
		ldaa @fp	; Reuse the location of the return address for @fp
		staa 0,x
		ldaa @fp+1
		staa 1,x
		stx  @fp
		; No ABX ...
		clra
		addb @fp+1
		adca @fp
		stab @fp+1
		staa @fp
		jmp jmptmp

		; jumped to from the end of 6800 vararg functions
restorefp:
		tsx
		ldx ,x
		ins
		ins
		stx @fp
		rts
