	.export asrax15
	.export asrax14
	.export asrax13
	.export asrax12
	.export asrax11
	.export asrax10
	.export asrax9
	.export asrax8

	.code

asrax15:
	asra
asrax14:
	asra
asrax13:
	asra
asrax12:
	asra
asrax11:
	asra
asrax10:
	asra
asrax9:
	asra
asrax8:
	tab
	bpl nonnegative
	deca
nonnegative:
	sba
	rts
