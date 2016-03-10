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

Start: jmp start1
color db 0 ; Текущий цвет
x1 dw 0 ; Координата Х1
y1 dw 0 ; Координата У1
x2 dw 0 ; Координата Х2
y2 dw 0 ; Координата У2
start1: ; Установка видеорежима
mov ah,0 ; Функция установки видеорежима
mov al,4 ; Граф. реж. CGA 320 * 200 точек
int 10h
; Построение голубой рамки
; Горизонтали
mov al,1 ; Голубой цвет
mov x1,0
mov x2,319
mov y1,0
call lineh ; Верхняя горизонталь
mov x1,0
mov x2,319
mov y1,199
call lineh ; Нижняя горизонталь
; Вертикали
mov x1,0
mov y1,0
mov y2,199
call linev ; Левая вертикаль
mov x1,319
mov y1,0
mov y2,199
call linev ; Правая вертикаль
; Построение прямоугольника
mov al,2 ; Сиреневый цвет
mov x1,140
mov y1,80
mov x2,180
mov y2,120
call bar
call kbin
int 20h
; Ввод с клавиатуры
kbin proc near
mov ah,0 ; Функция 0
int 16h ; клавиатурного прерывания
ret
kbin endp
; Построение закрашенного прямоугольника
; Х1,Y1 - координаты левого верхнего угла
; X2,Y2 - координата првого нижнего угла
bar proc near
mov cx,x1
cmp cx,x2 ; Сравнение начала с концом
jc bar1 ; x1 < x2
ret ; Выход при нулевой ширине прямоуг.
bar1: mov dx,y1 ; Начало линии
cmp dx,y2 ; Сравнение начала с концом
jc bar2 ; y1 < y2
ret ; Выход при нулевой высоте прямоуг.
; Построение CX, DX - левый верхний угол
bar2: mov bp,y2
sub bp,dx
inc bp
bar3: call lineh
inc word ptr y1
dec bp
jnz bar3
ret
bar endp
; Построение вертикальной линии
; Х1 - координата X
; Y1 - координата Y начала линии
; X2 - координата Y конца линии
linev proc near
mov cx,x1
mov dx,y1 ; Начало линии
cmp dx,y2 ; Сравнение начала с концом
jnz lv1 ; Длина не нулевая
ret ; Выход при нулевой длине
lv1: jc lv2 ; Начало меньше конца
; Здесь начало (CX) больше конца (X2)
sub dx,y2
inc dx
mov bx,dx ; Длина линии
mov dx,y2 ; Бывший конец линии
jmp short lv3
lv2: mov bx,y2 ; Конец (CX = начало)
sub bx,y1 ; Минус начало
inc bx ; Длина
lv3: call pixel
inc dx
dec bx
jnz lv3
ret
linev endp
; Построение горизонтальной линии
; Y1 - координата Y
; X1 - координата Х начала линии
; X2 - координата Х конца линии
lineh proc near
mov dx,y1
mov cx,x1 ; Начало линии
cmp cx,x2 ; Сравнение начала с концом
jnz lh1 ; Длина не нулевая
ret ; Выход при нулевой длине
lh1: jc lh2 ; Начало меньше конца
; Здесь начало (CX) больше конца (X2)
sub cx,x2
inc cx
mov bx,cx ; Длина линии
mov cx,x2 ; Бывший конец линии
jmp short lh3
lh2: mov bx,x2 ; Конец (CX = начало)
sub bx,x1 ; Минус начало
inc bx ; Длина
lh3: call pixel
inc cx
dec bx
jnz lh3
ret
lineh endp
; Построение точки текущего цвета
; CX - координата Х
; DX - координата Y
pixel proc near
push bx
mov ah,0ch ; Функция построения графич. точки
mov bh,0 ; Видеостраница
int 10h
pop  bx
ret
pixel endp

    
    MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN