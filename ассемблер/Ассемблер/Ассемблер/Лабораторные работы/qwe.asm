
DATA SEGMENT PARA PUBLIC 'DATA'
   
    
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
        
        MOV         CX,6
        MOV         DH,1
        MOV         DL,4
        ;-------OUTPUT1 -----------------
        
        XOR         DI,DI
        MOV         AH,02h
        MOV         DH,DH
        MOV         DL,DL
        INT         21h
        MOV         DL,010
        INT         21h
M4:     MOV         DL,48
        INT         21h
        
        
        INC         DH
        DEC         DL
        INC         DI
        CMP         DI,CX
        JL          M4
        
         ;-------OUTPUT1 -----------------

                        
;-------END-----------------
        MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN