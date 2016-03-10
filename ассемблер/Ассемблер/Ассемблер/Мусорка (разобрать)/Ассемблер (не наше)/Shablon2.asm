;---Prog.asm---
;
;
;
;-----------------------------
DATA SEGMENT PARA PUBLIC 'DATA';сегмент данных
HI_MCND    DW      ?
LO_MCND    DW      ?
HI_PP1	   DW      ?
LO_PP1	   DW 	   ?
HI_PP2     DW      ?
LO_PP2     DW      ?
HI_PP3     DW	   ?
LO_PP3     DW      ?
HI_PP4     DW      ?
LO_PP4     DW      ? 	
DATA ENDS
;-----------------------------
STK SEGMENT STACK;сегмент стека
         DB     256 DUP(0)
STK ENDS
;-----------------------------
CODE SEGMENT PARA PUBLIC 'CODE'; сегмент кода
MAIN PROC
	ASSUME CS:CODE, DS:DATA, SS:STK
        MOV         AX,DATA
        MOV         DS,AX

	MOV	    AX,38ACh
	MOV	    DX,1h
	MOV	    BX,15Eh
	MOV         CX,0h
	MOV	    HI_MCND,DX
	MOV	    LO_MCND,AX
	
	MUL	    BX
	MOV	    HI_PP1,DX
	MOV	    LO_PP1,AX
	MOV	    AX,HI_MCND
	MUL	    BX
	MOV	    HI_PP2,DX
	MOV	    LO_PP2,AX
	MOV	    AX,LO_MCND
	MUL	    CX
	MOV	    HI_PP3,DX
	MOV	    LO_PP3,AX
	MOV 	    AX,HI_MCND
	MUL	    CX
	MOV	    HI_PP3,DX
	MOV	    LO_PP3,AX
	MOV	    AX,HI_MCND
	MUL	    CX
	MOV	    HI_PP4,DX
	MOV	    LO_PP4,AX
	MOV	    AX,LO_PP1
	MOV	    BX,HI_PP1
	ADD	    BX,LO_PP2
	ADC	    HI_PP2,0
	ADD	    BX,LO_PP3
	MOV	    CX,HI_PP2
	ADC	    CX,HI_PP3
	ADC	    HI_PP4,0
	ADD	    CX,LO_PP4
	MOV	    DX,HI_PP4
	ADC	    DX,0
     
		
	MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN