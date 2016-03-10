;---Prog.asm---Поиск максимума
;
;
;
;-----------------------------
DATA SEGMENT PARA PUBLIC 'DATA';сегмент данных
;здесь все входные данные
A	db	1,-3,2
	db	-2,5,4
	db	4,1,-3
N	dw	3
M	dw	3
max	db	?
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

	MOV	AL,A 	
	XOR	BX,BX
	MOV	CX,N
M3:	PUSH	CX
	MOV	CX,M
	XOR 	DI,DI
M2:	CMP	AL,A[BX][DI]
	JGE	M1
	MOV	AL,A[BX][DI]
M1:	INC	DI
	LOOP	M2
	ADD	BX,N
	POP	CX
	LOOP	M3
	MOV	max,AL
	MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN


