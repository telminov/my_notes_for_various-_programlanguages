Пузырек байт
DATA SEGMENT PARA PUBLIC 'DATA'
;-----------------------------
A   DB  1,2,3,4,5
N   DW  5
;-----------------------------
DATA ENDS
STK SEGMENT STACK
         DB     256 DUP(0)
STK ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
MAIN PROC
    ASSUME CS:CODE, DS:DATA, SS:STK
        MOV         AX,DATA
        MOV         DS,AX
;-----------------------------        
        MOV     DX,N
        DEC     DX
        MOV     CX,N
        DEC     CX
        XOR     DI,DI   
M3:     XOR     BX,BX
        XOR     AH,AH        
M2:     MOV     AL,A[BX]
        CMP     AL,A[BX+1]
        JLE     M1
        INC     AH
        XCHG    AL,A[BX+1]
        MOV     A[BX],AL
M1:     INC     BX
        CMP     BX,CX
        JLE     M2
        CMP     AH,0
        JE      M4
        INC     DI 
        DEC     CX 
        CMP     DI,DX
        JL      M3 
M4:
;-----------------------------      
        MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
    END MAIN