;---Prog.asm---Сортировка по возрастанию
;
;
;
;-----------------------------
DATA SEGMENT PARA PUBLIC 'DATA';сегмент данных
;здесь все входные данные
A	db	1,-3,2
N	dw	3
s	db	?,?,?
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

	mov 	CX,N
	SUB	CX,1
M3:	push	CX
	mov	CX,N
	XOR 	DI,DI
M2:	MOV	SI,DI
	INC	SI
	MOV	AH,A[DI]
	CMP	AH,A[SI]
	JLE	M1
	;MOV	AH,A[DI]
	;XONG	AH,A[SI]
	MOV	AL,AH
	MOV	AH,A[SI]
	MOV	A[SI],AL
M1:	SUB	CX,DI
	INC	DI
	LOOP	M2
	POP	CX
	LOOP	M3
M:	JMP	M
	MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN


