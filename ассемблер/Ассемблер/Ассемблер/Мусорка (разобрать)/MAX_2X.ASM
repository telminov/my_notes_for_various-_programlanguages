;---Prog.asm---
;
;
;
;-----------------------------
DATA SEGMENT PARA PUBLIC 'DATA';������� ������
A	DB	1,3,4
	DB	7,5,9
	DB	2,6,8
N	DW	3
M	DW	3
MAX	DB	?
DATA ENDS
;-----------------------------
STK SEGMENT STACK;������� �����
         DB     256 DUP(0)
STK ENDS
;-----------------------------
CODE SEGMENT PARA PUBLIC 'CODE'; ������� ����
MAIN PROC
	ASSUME CS:CODE, DS:DATA, SS:STK
        MOV         AX,DATA
        MOV         DS,AX

	MOV	    AL,A
	XOR 	    BX,BX
	MOV         CX,N
M1:	XOR	    DI,DI
	MOV	    DX,M
M3:	CMP	    AL,A[BX][DI]
	JL	    M2
	MOV	    AL,A[DI]
	INC	    DI
M2:	CMP	    DI,DX
	JL	    M3
	ADD	    BX,2
	CMP	    BX,DX
	JL	    M1

	
	

	MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
             END   MAIN