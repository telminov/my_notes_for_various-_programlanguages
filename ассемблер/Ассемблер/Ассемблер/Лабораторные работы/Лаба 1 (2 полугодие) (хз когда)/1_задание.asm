;����� ��������� ������ ������� � ����
;����� ����� ������ ��������� 
;(��� ����� � �����������)
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
        XOR     AL,AL	;�������� ���������� S
        XOR     BX,BX	;�������� i
        MOV     CX,N 	;�������� � ������� �������� N
M1:     XOR     DI,DI	;�������� j
        MOV     DX,M	;�������� � ������� �������� M
M3:     TEST    A[BX][DI],00000001b ;
        JNZ     M2		;���� ����� - ������� �� �����
        ADD     AL,A[BX][DI]	;���� ������� - ���������� Ai � S
M2:     INC     DI		;����������� j
        CMP     DI,DX	;���������� j � M
        JL      M3		;���� ������ - ������� �� �����
        ADD     BX,DX	;
        CMP     BX,9	;
        JL      M1		;���� ������ ������� �� �����
;------------------------------
MOV	AX, 4C00h
INT	21h
MAIN 	ENDP
CODE 	ENDS
END   	MAIN