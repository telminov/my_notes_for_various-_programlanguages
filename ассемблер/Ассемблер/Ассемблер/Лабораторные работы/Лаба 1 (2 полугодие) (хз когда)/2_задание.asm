;Найти максимальный элемент в двумерном массиве длинною в слово
DATA SEGMENT PARA PUBLIC 'DATA'
;-----------------------------
		DW		7,5,9
		DW		2,6,8
N		DW		3
M		DW		3
MAX		DB		?
;-----------------------------
DATA ENDS
STK SEGMENT STACK
DB     256 DUP(0)
STK ENDS
CODE SEGMENT PARA PUBLIC 'CODE'
MAIN PROC
ASSUME CS:CODE, DS:DATA, SS:STK
MOV	AX,DATA
MOV	DS,AX
;-----------------------------
		MOV		AX,A
		XOR		BX,BX
		MOV		CX,N
M1:		XOR		DI,DI
		MOV		DX,M
		SHL		DX,1
M3:		CMP		A[BX][DI],AX
		JLE		M2
		MOV		AX,A[BX][DI]
M2:		INC		DI
		CMP		DI,DX
		JL		M3
		ADD     BX,DX
		CMP     BX,18
		JL     	M1
;-------------------------------
MOV 	AX,4C00h
INT    	21h
MAIN ENDP
CODE ENDS
END   MAIN