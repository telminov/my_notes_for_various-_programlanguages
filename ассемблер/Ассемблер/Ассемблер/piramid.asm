
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
        

;----------------------------
    MOV AH,0
    MOV AL,3
    INT 10h

    MOV AH,2  ;UI ZNAET ^^
    MOV DL,5  ;STROKA
    MOV DH,1  ;STOLBEC
    MOV BH,0  
    INT 10h
    
    MOV AH,9
    MOV BH,0
    MOV BL,10011111b
    MOV CX,1
    MOV AL,42 ; HZ KAKOI ZVEZDA
    INT 10h


    XOR DI,DI   
    
M1: MOV AH,0
    MOV AL,3
    INT 10h

    MOV AH,2  ;PEREMESCHENIE KURSORA
    MOV BH,0
    INT 10h
    
    MOV AH,9
    MOV BH,0
    MOV BL,10011111b
    ADD CX,2   ;OR 4, HOTIA DOLZCHNO BIT' 2
    MOV AL,42 ; HZ KAKOI KOD U ZVEZDA
    INT 10h
    
    DEC DL
    INC DH
    MOV DL,DL
    MOV DH,DH
    INC DI
    CMP DI,8 ;OR 4
    JL M1    ;OR JL,   ESLI SOVSEM PLOHO
            ;JGE,  JG
    
;----DEC----
    
    XOR DI,DI   
    
M2: MOV AH,0
    MOV AL,3
    INT 10h

    MOV AH,2  ;PEREMESCHENIE KURSORA
    MOV BH,0
    INT 10h
    
    MOV AH,9
    MOV BH,0
    MOV BL,10011111b
    SUB CX,2   ;OR 4, HOTIA DOLZCHNO BIT' 2   PS POSMOTRET ;VICHITANIE
    MOV AL,42 ; HZ KAKOI KOD U ZVEZDA
    INT 10h
    
    INC DL
    INC DH
    MOV DL,DL
    MOV DH,DH
    INC DI
    CMP DI,10 ;OR 5
    JL M2    ;OR JL,   ESLI SOVSEM PLOHO
            ;JGE,  JG

;CHET TUT ESHE  CHTOB DOLSHE OTOBRAGALOS

;-------END-----------------
        MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN