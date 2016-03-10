;---Prog.asm---
;имя разр дата и тд
;
;
;-----------------------------
DATA SEGMENT PARA PUBLIC 'DATA';сегмент данных - заголовок сегента данных

DATA ENDS
;-----------------------------
STK SEGMENT STACK;сегмент стека - не трогать
         DB     256 DUP(0)
STK ENDS
;-----------------------------
CODE SEGMENT PARA PUBLIC 'CODE'; сегмент кода
MAIN PROC
	ASSUME CS:CODE, DS:DATA, SS:STK
        MOV         AX,DATA
        MOV         DS,AX

			
	MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN