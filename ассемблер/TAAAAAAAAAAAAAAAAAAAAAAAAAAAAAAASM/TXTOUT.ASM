DATA SEGMENT PARA PUBLIC 'DATA'
text db 'TEXTTEXTTEXT',0 ; Вывод слова на середину
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

Start: mov ax,cs
mov ds,ax
; Установка видеорежима 3
mov ah,0 ; Функция 0
mov al,3 ; Режим 3
int 10h
; Очистка экрана и задание атрибута мигания
mov ah,6 ; Инициализация или прокрутка окна вверх
mov al,0 ; Очистка всего окна
mov bh,87h ; Установка атрибута мерцания
mov ch,0 ; Y лев. верхнего угла
mov cl,0 ; X лев. верхнего угла
mov dh,24 ; Y прав. нижнего угла
mov dl,89 ; X прав. нижнего угла
int 10h
; Установка позиции курсора
mov ah,2 ; Функция 2
mov bh,0 ; Страница 0
mov dh,12 ; Строка 12
mov dl,38 ; Колонка 38
int 10h
; Вывод текста
mov ah,0Eh  ; Функция 0Eh
lea si,text ; Смещение текста (DS)
mov bl,7
loop2: cmp byte ptr [si],0 ; Проверка на конец текста
jz loop1 ; Выход
mov al,[si]
int 10h
inc si
jmp short loop2
; Ожидание ввода клавиши пробела
loop1: mov ah,0 ; Функция 0
int 16h
cmp al,' ' ; Пробел ?
jnz loop1 ; Нет !
; Выход из программы
int 20h
    
    MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN