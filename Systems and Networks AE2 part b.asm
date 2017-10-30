
	ORG	$c000
loop	INCA
delay	INX
	CPX	dlen
	BGT	delay
	LDX	#0
	STAA	lights
	BRA	loop

lights	EQU	$1004
	ORG	$0000
dlen	RMB	2
dlen	EQU	5000