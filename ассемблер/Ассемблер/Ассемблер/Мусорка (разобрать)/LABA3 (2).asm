Сумма четных байт
DATA SEGMENT PARA PUBLIC 'DATA'
A   DB  3,2,5,4
N   DB  4
S   DB  ?
DATA ENDS
;-----------------------------
STK SEGMENT STACK
         DB     256 DUP(0)
STK ENDS
;-----------------------------
CODE SEGMENT PARA PUBLIC 'CODE'
MAIN PROC
    ASSUME CS:CODE, DS:DATA, SS:STK
    MOV     AX,DATA
    MOV     DS,AX
    
    XOR     AL,AL
    XOR     BX,BX
    MOV     CL,N
M2: TEST        A[BX],0000000000000001b
    JNZ     M1
    ADD     AL,A[BX]
M1: INC     BX
    DEC     CL
    CMP     CL,0
    JG      M2
    MOV     S,AL
    MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN