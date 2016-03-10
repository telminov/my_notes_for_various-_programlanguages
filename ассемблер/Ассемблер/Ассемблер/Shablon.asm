;----Õ¿«¬¿Õ»≈--œ–Œ√–¿ÃÃ€-------
DATA SEGMENT PARA PUBLIC 'DATA'
;------------------------------

;------------------------------
DATA ENDS
STK SEGMENT STACK;??????? ?????
    DB     256 DUP(0)
STK ENDS
CODE SEGMENT PARA PUBLIC 'CODE'
MAIN PROC
    ASSUME CS:CODE, DS:DATA, SS:STK
        MOV         AX,DATA
        MOV    DS,AX
;------------------------------	

;------------------------------
		MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
END   MAIN