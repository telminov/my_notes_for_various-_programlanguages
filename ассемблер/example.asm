Assume CS: Code;, DS: Code
Code SEGMENT
org
100h
Start: mov ax,cs
mov ds,ax
; Установка видеорежима 3
mov ah,0 ; Функция 040
mov al,3 ; Режим 3
int
10h
; Очистка экрана
mov ax,0b800h
mov es,ax ; ES = B800h
xor
si,si ; Обнуление регистра-источника
xor
di,di ; Обнуление регистра назначения
mov cx,2000
; Инициализация счетчика
mov ax,0700h
rep
stosw
; Вывод текста
lea
si,text ; Смещение текста (DS)
mov di,2000
; Начальная ячейка экр. памяти
mov ah,8fh
; Атрибут
loop2: cmp byte ptr [si],0 ; Проверка на конец текста
jz
loop1
; Выход
mov al,[si]
mov es:[di],ax
; На экран
inc
si
inc
di
inc
di
jmp short loop2
; Ожидание ввода клавиши пробела
loop1: mov ah,0
; Функция 0
int
16h
cmp al,' ' ; Пробел ?
jnz
loop1 ; Нет !
; Выход из программы
int
20h
text db
'ТЕКСТ',0 ; Вывод слова на середину
Code ENDS
END Start
