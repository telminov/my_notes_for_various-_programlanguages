Поиск маскимального слово
DATA SEGMENT PARA PUBLIC 'DATA'
A	DW	3,2,5,7,3
N	DW	5
M	DW	?
DATA ENDS
;-----------------------------
STK SEGMENT STACK
         DB     256 DUP(0)
STK ENDS
;-----------------------------
CODE SEGMENT PARA PUBLIC 'CODE'
MAIN PROC
	ASSUME CS:CODE, DS:DATA, SS:STK
        MOV         AX,DATA
        MOV         DS,AX

	XOR 	    AX,AX
	XOR	    BX,BX
	MOV	    CX,N
	MOV	    AX,A[0]
	ADD	    BX,2	
M2:	CMP	    A[BX],AX
	JNG	    M1
	MOV	    AX,A[BX]
M1:	ADD         BX,2
	DEC	    CX
	CMP	    CX,1
	JG	    M2
	MOV	    M,AX

	MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN