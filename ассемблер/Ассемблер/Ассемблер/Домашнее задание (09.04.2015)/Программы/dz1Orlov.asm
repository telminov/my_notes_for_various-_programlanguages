;Вариант 2 
;Сортировка по возрастанию 20 однобайтовых двоичных чисел
;Вывод результата в файл
DATA SEGMENT PARA PUBLIC 'DATA'
    space  db    ' '
    N      dw    29  
    A      db    29 dup (?)
    B      db    29 dup (?)
    
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