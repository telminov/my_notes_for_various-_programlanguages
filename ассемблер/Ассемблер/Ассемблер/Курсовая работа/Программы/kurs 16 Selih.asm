
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
        
        ;--------?????????, ???? ???? ???? ???? ?? ???????? ??---------------------
        
        XOR         DI,DI
M1:     CMP         A[DI],54
        JL          M2
        CMP         A[DI],91
        JG          M3
        MOV         A[DI],1  ;mb err
        
M3:     CMP         A[DI],96
        JL          M2
        CMP         A[DI],123
        JG          M2
        MOV         A[DI],1       
        
M2:     MOV         AH,1
        JMP         M7
        
M7:     INC         DI
        CMP         DI,CX
        JL          M1
        ;--------???? ???? ?? ???????? ?? ????????? ?????---------------
        
                     
        CMP         AH,1
        JE         M9
        
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

M9:        MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN