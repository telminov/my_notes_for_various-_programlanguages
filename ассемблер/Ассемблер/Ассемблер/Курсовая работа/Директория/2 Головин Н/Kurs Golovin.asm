
DATA SEGMENT PARA PUBLIC 'DATA'
    
    N      dw    12
    A      db    12 dup (?)
    B      db    24 dup (?)
    
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
        MOV         BL,201
        MOV         BH,200
        XOR         DI,DI
        XOR         CX,CX 
        XOR         SI,SI 
        
M2:     CMP         A[DI],65
        JNE         M3
        MOV         B[SI],Bl
        INC         SI
        MOV         B[SI],BH
        INC         SI
        JMP         M1
        ADD         CX,4
        
        
M3:     MOV         Al,A[DI]
        MOV         B[SI],AL
        INC         SI
        INC         CX
        
        
M1:     INC         DI
        
        CMP         DI,24 
        JL          M2
        
                     
        
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
        CMP         DI,CX
        JL          M4
;-------END-----------------
        MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN