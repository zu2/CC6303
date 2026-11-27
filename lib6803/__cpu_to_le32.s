
	.export __cpu_to_le32
	.export __le32_to_cpu
	.export __be32_to_cpu
	.export __cpu_to_be32

	.setcpu 6803
	.code

__cpu_to_le32:
__le32_to_cpu:
	; Argument at 2-5,x, result in sreg:D
	tsx
	ldaa 5,x
	ldab 4,x
	std @sreg
	ldaa 3,x
	ldab 2,x
	rts

__cpu_to_be32:
__be32_to_cpu:
	tsx
	ldd 2,x
	std @sreg
	ldd 4,x
	rts
