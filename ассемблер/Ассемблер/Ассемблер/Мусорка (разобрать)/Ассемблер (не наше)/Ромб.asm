;-----------------------------Ромб
DATA SEGMENT PARA PUBLIC 'DATA';сегмент данных
	X	DB	40
	Y	DB	5
	N	DW	1
	color	DB	10100010b
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
	MOV		AH,0
	MOV		AL,3
	INT		10h
M1:	MOV		AH,2
	MOV		BH,0
	MOV		DH,Y
	MOV		DL,X	
	INT		10h
 	MOV		AH,9
	MOV		CX,N
	MOV		AL,'*'
	MOV		BL,color
	INC		color
	INT		10h
	INC		Y
	DEC		X
	ADD		N,2
	CMP		Y,15
	JNE		M1
	SUB		N,2
	DEC		y
	INC		x
M2:	MOV		AH,2
	MOV		BH,0
	MOV		DH,Y
	MOV		DL,X	
	INT		10h
 	MOV		AH,9
	MOV		CX,N
	MOV		AL,'*'
	MOV		BL,color
	INC		color
	INT		10h
	INC		Y
	INC		X
	SUB		N,2
	CMP		X,41
	JNE		M2

M:	JMP		M
			
		


	
	MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN