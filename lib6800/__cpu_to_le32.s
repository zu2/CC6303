
	.export __cpu_to_le32
	.export __le32_to_cpu
	.export __be32_to_cpu
	.export __cpu_to_be32

	.code

__cpu_to_le32:
__le32_to_cpu:
	; Argument at 2-5,x, result in sreg:D
	tsx
	ldaa 5,x
	ldab 4,x
	staa @sreg
	stab @sreg+1
	ldaa 3,x
	ldab 2,x
	jmp ret4

__cpu_to_be32:
__be32_to_cpu:
	tsx
	ldaa 2,x
	ldab 3,x
	staa @sreg
	stab @sreg+1
	ldaa 4,x
	ldab 5,x
	jmp ret4
