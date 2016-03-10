;----НАЗВАНИЕ--ПРОГРАММЫ-------
DATA SEGMENT PARA PUBLIC 'DATA'
;------------------------------
frequency1 		equ 	300 	; Задержка переключения 1
frequency2 		equ 	500 	; Задержка переключения 2
number_cycles1 	equ 	1000 	; Количество циклов (длит.)
number_cycles2 	equ 	600 	; Количество циклов (длит.)
port_b 		equ 	61h 	; Адрес системного порта В
;------------------------------
DATA ENDS
STK SEGMENT STACK;??????? ?????
    DB     256 DUP(0)
STK ENDS
CODE SEGMENT PARA PUBLIC 'CODE'
MAIN PROC
    ASSUME CS:CODE, DS:DATA, SS:STK
        MOV         AX,DATA
        MOV    DS,AX
;------------------------------	
beg1: 	call kbin ; Опрос клавиатуры
	cmp al,'1' ; = '1' ?
	jnz beg2 ; Нет
	call ton1 ; Звук высоты 1
	jmp beg1 ; Переход на начало цикла
beg2: cmp al,'2' ; = '2' ?
	jnz beg3 ; Нет
	call ton2 ; Звук высоты 2
	jmp beg1 ; Переход на начало цикла
beg3: cmp al,'q' ; = '' ?
	jnz beg1 ; Нет
	int 20h ; Выход из программы
start 	endp
ton2 	proc near ; Процедура генерации звука 2
	mov dx,number_cycles2 ; Длительность 2
	mov di,frequency2 ; Задержка 2
	jmp ton0 ; Переход на универсальную процедуру генерации звука
ton1 	proc near ; Процедура генерации звука 1
	mov dx,number_cycles1 	; Длительность 1
	mov di,frequency1 	; Задержка 1
; Универсальная процедура генерации звука
; DX - количество циклов, DI - задержка
ton0 	proc 	near
	cli ; Запрещение прерываний
	in 	al,port_b ; Чтение сост. системн. порта В
	and 	al,11111110b ; Отк. динамика от таймера
ton01: or 	al,00000010b ; Включение динамика
	out 	port_b,al ; Запись в системный порт В
	mov 	cx,di ; Счетчик цикла задержки
	loop 	$; Задержка
;// Выключение звука
	and 	al,11111101b ; Выключение динамика
	out 	port_b,al ; Запись в системный порт В
	mov 	cx,di ; Счетчик цикла задержки
	loop 	$ ; Задержка
	dec 	dx ; Декремент счетчика колич. циклов
	jnz 	ton01 ; Переход на начало нового периода
	sti ; Разрешение прерываний
	ret ; Выход из процедуры
ton0 	endp ; Конец универсальной процедуры
ton1 	endp ; Конец процедуры генерации звука 1
ton2 	endp ; Конец процедуры генерации звука 2
kbin 	proc near ; Ввод с клавиатуры с ожиданием
	mov 	ah,0 ; Функция 0
	int 	16h ; клавиатурного прерывания
	ret ; Выход из процедуры
kbin 	endp ; Конец процедуры ввода с клавиатуры
code 	ends ; Конец сегмента (кодового)

;------------------------------
		MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
END   MAIN