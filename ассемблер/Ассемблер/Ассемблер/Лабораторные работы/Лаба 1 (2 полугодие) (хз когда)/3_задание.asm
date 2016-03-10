;Найти строку, содержащую максимальную 
;сумму элементов, длина - байт
DATA SEGMENT PARA PUBLIC 'DATA'
;-----------------------------
A   DB      1,3,5
    DB      2,4,6
    DB      7,8,9
N   DW      3
M   DW      3
O   DB      3 DUP(?)
MAX DB      ?
;-----------------------------
DATA ENDS
STK SEGMENT STACK
    DB     256 DUP(0)
STK ENDS
CODE SEGMENT PARA PUBLIC 'CODE'
MAIN PROC
    ASSUME CS:CODE, DS: DATA, SS:STK
        MOV         AX, DATA
        MOV         DS, AX
;------------------------------
        MOV         CX,N
        XOR         BX,BX
M1:     MOV         O[BX],0
        INC         BX
        CMP         BX,CX
        JL          M1
        XOR         BX,BX
M3:     XOR         DI,DI
        MOV         DX,M
M2:     ADD         AL,A[BX][DI]
        ADD         O[BX],AL
        XOR         AL,AL
        INC         DI
        CMP         DI,DX
        JL          M2
        ADD         BX,DX         
        CMP         BX,9
        JL          M3
        XOR         BX,BX
        MOV         AL,O[BX]
M5:     INC         BX
        CMP         O[BX],AL
        JLE         M4
        MOV         AL,O[BX]
M4:     CMP         BX,CX
        JL          M5
        MOV         MAX,AL
 ;------------------------------
MOV AX, 4C00h
INT 21h
MAIN    ENDP
CODE    ENDS
END     MAIN