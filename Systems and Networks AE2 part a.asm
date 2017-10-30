


	ORG	$c000
loop	INCA
	STAA	lights
	BRA	loop

lights	EQU	$1004