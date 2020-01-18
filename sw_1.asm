main:   lhu x1 0x10010000
	lhu x2 0x10010004
	lhu x3 0x10010008
	add x4, x1, x2
	add x5, x4, x3
	sh x5, 0x10010020, x7
	j main
