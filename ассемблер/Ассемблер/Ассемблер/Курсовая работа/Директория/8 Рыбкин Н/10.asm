Assume CS: Code, DS: Code
Code SEGMENT
org 100h
.286
Start proc
        mov         ax,cs
        mov         ds,ax
;-----------------------------
M1:     CALL        kbin
cmp al,'1' ; = '1' ?
jnz M2 ; ???
call tochka ; ????? ?????
jmp M1 ; ??????? ?? ?????? ?????
M2: cmp al,'2' ; = '2' ?
jnz M3 ; ???
call tochka ; ????? ?????
jmp M1 ; ??????? ?? ?????? ?????
M3: cmp al,'3' ; = '3' ?
jnz M4 ; ???
call tochka ; ????? ?????
jmp M1 ; ??????? ?? ?????? ?????
M4: cmp al,'4' ; = '4' ?
jnz M5 ; ???
call tochka ; ????? ?????
jmp M1 ; ??????? ?? ?????? ?????
M5: cmp al,'5' ; = '5' ?
jnz M6 ; ???
call tochka ; ????? ?????
jmp M1 ; ??????? ?? ?????? ?????
M6: cmp al,'6' ; = '6' ?
jnz M7 ; ???
call tochka ; ????? ?????
jmp M1 ; ??????? ?? ?????? ?????
M7: cmp al,'7' ; = '7' ?
jnz M8 ; ???
call tochka ; ????? ?????
jmp M1 ; ??????? ?? ?????? ?????
M8: cmp al,'8' ; = '8' ?
jnz M9 ; ???
call tochka ; ????? ?????
jmp M1 ; ??????? ?? ?????? ?????
M9: cmp al,'9' ; = '9' ?
jnz M10 ; ???
call tochka ; ????? ?????
jmp M1 ; ??????? ?? ?????? ?????
M10: cmp al,'0' ; = '0' ?
jnz M11 ; ???
call tochka ; ????? ?????
jmp M1 ; ??????? ?? ?????? ?????
M11: cmp al,'q' ; = 'q' ?
jnz M1 ; ???
int 20h 
start endp
tochka  proc
mov         ah,02h
mov         dl,046
int         21h
ret
tochka  endp
;-----------------------------
kbin proc  ; ???? ? ?????????? ? ?????????
mov ah,0 
int 16h 
ret 
kbin endp 
;-------END------------------- 
code ends 
    END Start 