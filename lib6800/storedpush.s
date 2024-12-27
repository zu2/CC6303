
	.export storedpush
	.export pshtop
	.code
;
;	Store D and push it
;
storedpush:
	tsx
	ldx 0,x			; get return address
	stx @tmp		; patch it in
	tsx
	stab 3,x		; save D at top of stack (as seen by caller)
	staa 2,x
	stab 1,x		; overwrite return address
	staa 0,x
	jmp jmptmp
pshtop:
	tsx
	ldx 0,x			; get return address
	stx @tmp		; patch it in
	tsx
	ldab 3,x		; overwrite return address
	stab 1,x
	ldaa 2,x
	staa 0,x
	jmp jmptmp		; to caller without adjusting stack
