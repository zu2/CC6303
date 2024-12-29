
	.code
	.export tosulteax

tosulteax:
	jsr toslucmp
	jsr boolultc
	jmp pop4flags
