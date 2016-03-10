Поиск максимального байт
DATA SEGMENT PARA PUBLIC 'DATA'
A	DB	3,2,5,4,3
N	DB	5
M	DB	?
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

	;XOR 	    AX,AX
	XOR	    BX,BX
	MOV	    CL,N
	MOV	    AL,A[0]
	INC	    BX		
M2:	CMP	    A[BX],AL
	JNG	    M1
	MOV	    AL,A[BX]
M1:	INC         BX
	DEC	    CL
	CMP	    CL,1
	JG	    M2
	MOV	    M,AL

	MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN