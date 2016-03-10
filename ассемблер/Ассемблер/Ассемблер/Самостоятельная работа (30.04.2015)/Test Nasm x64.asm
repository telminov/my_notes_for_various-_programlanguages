%include "io64.inc"
section .data
;---------------------------------------------
    msg db 'Все числа меньше К',0
;---------------------------------------------
section .text
    global CMAIN
CMAIN:
;---------------------------------------------
    mov rbp, rsp
    mov al,2
    mov bl,3
    add al,bl
    PRINT_UDEC 1,al
    NEWLINE;--Первеод-печати-на-новую-строку--
М4: PRINT_STRING msg
;---------------------------------------------
    xor rax, rax
    ret