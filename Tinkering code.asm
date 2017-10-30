STACK	EQU	$00FF
PIOC	EQU	$1002	Parallel I/O Control Register
PORTCL	EQU	$1005
lights	EQU	$1004
IRQ	EQU	$FFF2	IRQ vector
RESET	EQU	$FFFE	RESET vector


	ORG	$c000
loop	LDS	#STACK
	LDAB	#%11000000
	STAB	PIOC	enable Strobe A interrupt on rising edge
	CLI
	LDY	count
	BEQ	if
else	INCA
	BRA	delay
if	DECA
delay	INX
	CPX	dlen
	BGT	delay
	LDX	#0
	STAA	lights
	BRA	loop

IRQISR	LDY	count
	INY
	STY	count
	LDD	count
	LDX	#2
	IDIV
	STD	count
	LDAA	PIOC
	LDAA	PORTCL
	RTI

	ORG	RESET
	FDB	$c000	initialise reset vector
	ORG	IRQ
	FDB	IRQISR	initialise IRQ vector
	ORG	$0000
count	RMB	2
dlen	EQU	50000

