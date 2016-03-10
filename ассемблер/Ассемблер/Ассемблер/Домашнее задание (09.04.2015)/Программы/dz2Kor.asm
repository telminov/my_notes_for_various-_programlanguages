
DATA SEGMENT PARA PUBLIC 'DATA'
    space  db    ' '
    N      dw    29
    A      db    14 dup (?)
    B      db    42 dup (?)
    
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
        MOV         BL,space
        
        XOR         DI,DI
        XOR         CX,CX ;schetchk
        XOR         SI,SI 
        INC         DI
        
M1:     CMP         A[DI],47
        JL          M3
        CMP         A[                  DI],58
        JG          M3
        MOV         B[SI],BL
        INC         SI
        MOV         B[SI],BL
        INC         SI
        MOV         BH,A[DI]
        MOV         B[SI],BH
        INC         SI
        JMP         M2
        ADD         CX,6
        
M3:     MOV         BH,A[DI]
        MOV         B[SI],BH
        INC         SI  
        INC         CX
      
        
M2:     INC         DI
        
        CMP         DI,24 
        JL          M1
        
                     
        
;-------OUTPUT-----------------
       
        XOR         DI,DI
        MOV         AH,02h
        MOV         DL,013
        INT         21h
        MOV         DL,010
        INT         21h
M4:     MOV         DL,B[DI]
        INT         21h
        INC         DI
        CMP         DI,96
        JL          M4
;-------END-----------------
        MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN