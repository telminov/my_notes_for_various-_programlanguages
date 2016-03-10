
DATA SEGMENT PARA PUBLIC 'DATA'
    space  db    ' '
    N      dw    15
    A      db    32 dup (?)
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
;-------INPUT-----------------
        MOV         CX,N
        XOR         DI,DI
        MOV         AH,01h
M5:     INT         21h
        MOV         A[DI],AL
        INC         DI
        CMP         DI,CX
        JL          M5
        
;-----------------------------     
        XOR         SI,SI
        MOV         BL,space
M3:     MOV         DI,SI
        MOV         AL,A[DI+1]
        CMP         AL,64
        JBE         M1
        MOV         A[DI+1],BL
M2:     INC         DI
        XCHG        AL,A[DI+1]
        CMP         DI,CX
        JL          M2
        INC         CX
        INC         SI
M1:     INC         SI
        CMP         SI,CX
        JLE         M3
;-------OUTPUT-----------------
        XOR         DI,DI
        MOV         AH,02h
        MOV         DL,013
        INT         21h
        MOV         DL,010
        INT         21h
M4:     MOV         DL,A[DI]
        INT         21h
        INC         DI
        CMP         DI,CX
        JL          M4
;-------END-----------------
        MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN