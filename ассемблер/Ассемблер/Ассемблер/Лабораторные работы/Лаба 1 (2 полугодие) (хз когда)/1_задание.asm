;Задан двумерный массив длинной в байт
;Ќайти сумму четных элементов 
;(два цикла с постуловием)
DATA SEGMENT PARA PUBLIC 'DATA'
;-----------------------------
A		DB  	1,3,5
		DB  	2,4,6
		DB  	7,8,9
N   	DW  	3
M  		DW  	3
S   	DB  	?
;----------------------------
DATA ENDS
STK SEGMENT STACK
DB	256 DUP(0)
STK ENDS
CODE SEGMENT PARA PUBLIC 'CODE'
MAIN PROC
ASSUME CS:CODE, DS: DATA, SS:STK
MOV	AX, DATA
MOV	DS, AX
;-----------------------------
        XOR     AL,AL	;ќбнул€ем переменную S
        XOR     BX,BX	;обнул€ем i
        MOV     CX,N 	;помещаем в регистр значение N
M1:     XOR     DI,DI	;ќбнул€ем j
        MOV     DX,M	;помещаем в регистр значение M
M3:     TEST    A[BX][DI],00000001b ;
        JNZ     M2		;если ложно - переход на метку
        ADD     AL,A[BX][DI]	;если истинно - прибавл€ем Ai к S
M2:     INC     DI		;увеличиваем j
        CMP     DI,DX	;сравниваем j с M
        JL      M3		;≈сли меньше - переход на метку
        ADD     BX,DX	;
        CMP     BX,9	;
        JL      M1		;≈сли меньше переход на метку
;------------------------------
MOV	AX, 4C00h
INT	21h
MAIN 	ENDP
CODE 	ENDS
END   	MAIN