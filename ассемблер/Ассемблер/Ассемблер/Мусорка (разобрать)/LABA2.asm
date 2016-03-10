;---Prog.asm---
;
;
;
;-----------------------------
DATA SEGMENT PARA PUBLIC 'DATA';??????? ??????
A   DW  3,-4,5,-1,2
N   DW  5
S   DW  ?
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

    XOR     AX,AX
    XOR     BX,BX
    MOV     CX,N
M2: CMP     A[BX],0
    JLE     M1
    ADD     AX,A[BX]
M1: ADD     BX,2 
    DEC     CX
    CMP     CX,0
    JG      M2
    MOV     S,AX
    MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN