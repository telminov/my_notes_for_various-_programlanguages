;-----------------------------
DATA SEGMENT PARA PUBLIC 'DATA';??????? ??????
A   DB  1,5,3,2,4
N   DW  5
DATA ENDS
;-----------------------------
STK SEGMENT STACK;??????? ?????
         DB     256 DUP(0)
STK ENDS
;-----------------------------
CODE SEGMENT PARA PUBLIC 'CODE'; ??????? ????
MAIN PROC
    ASSUME CS:CODE, DS:DATA, SS:STK
        MOV         AX,DATA
        MOV         DS,AX
    ;MOV     CH,N
    ;DEC     CH
    MOV     DI,1
    XOR     BX,BX   

M3: MOV     AL,A[DI]
    MOV     BX,DI
    DEC     BX
M1: CMP     BX,0
    JL      M2
    CMP     AL,A[BX]
    JGE     M2 
    MOV     AH,A[BX]        ;MOV    A[BX+1],A[BX] 
    MOV     A[BX+1],AH
    DEC     BX
    JMP     M1
M2: MOV     A[BX+1],AL
    INC     DI
    CMP     DI,N-1
    JL      M3
        

    
    MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN