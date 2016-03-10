DATA SEGMENT PARA PUBLIC
;----------------------------------------
A	DB	1,5,3,2
N	DB	4
;----------------------------------------
DATA ENDS
STK SEGMENT STACK
         DB     256 DUP(0)
STK ENDS
CODE SEGMENT PARA PUBLIC 'CODE'
MAIN PROC
	ASSUME CS:CODE, DS:DATA, SS:STK
        MOV         AX,DATA
        MOV         DS,AX
;----------------------------------------
	MOV	    CL,N
	DEC	    CL
	INC	    BX		
M1:	XOR     DI,DI;Œ¡Õ”À»Ã ¬Õ”“–. Ã¿——»¬
M2:	MOV	    AL,A[DI]
	CMP	    AL,A[DI+1]		
	JNG	    M3
	XCHG	AL,A[DI+1]
	MOV	    A[DI],AL
M3:	INC	    DI
	CMP	    DI,CX
	JNG	    M2
	DEC	    CL
	CMP	    CL,0
	JG	    M1
;-----------------------------------------
	MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN