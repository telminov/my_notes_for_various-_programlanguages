model tiny, C ; Этот параметр определяет модель сегментации памяти для программного модуля.
;Код, данные и стек объединены в одну группу с именем DGROUP и размером до 64Кб. СS=DS=SS=DGROUP.
;Второй параметр C указывает, что при вызове ассемблерной процедуры из другой программы будет задействован способ передачи параметров, принятый в языке C.

;Структура для хранения одной вершины
POINT3D struc
	xx dw ?
	yy dw ?
	zz dw ?
POINT3D ends

;структура для хранения координат вершины на плоскости
POINT2D struc
	xx dw ?
	yy dw ?
POINT2D ends

;____________________________________МАКРОC ВЫЗОВА РИСОВАНИЯ ЛИНИИ ПО НОМЕРАМ ВЕРШИН

PRLINE macro num1, num2, colour
	mov bx, num2
	shl bx, 2 ;сдвиг влево
	push colour
	push [POINT2D ptr bx+si].yy
	push [POINT2D ptr bx+si].xx 	;записываем в стек координаты точки
	mov bx, num1
	shl bx, 2
	push [POINT2D ptr bx+si].yy
	push [POINT2D ptr bx+si].xx
	call Line
	add sp, 10
endm
 
.386 								; инициализация сопроцессора (нужно для команды fsincos)
.data

	Rad dd 180. 					;180 градусов - для преобразования в радианы

	include crane.obj
									;временные переменные для вычисления координат при вращении
	X DW ? 
	Y DW ?
	Z DW ?

	firstcadr db ?
									;углы поворота относительно осей
	XAngle DW 0 
	YAngle DW 0
	ZAngle DW 0
  
									; смещение по координатам
	DeltaX DW 0 
	DeltaY DW 0
	DeltaZ DW 0
  
									;переменные, используемые для расчета координат на эране
	Xoff DW 400						;пропорции по X
	Yoff DW 400 					; и Y
	Zoff DW 180						;расстояние от глаз

	Nx DW 160						;середина экрана
	Ny DW 100

	.code							;сегмент кода
	.startup						;точка входа

	mov ax, 0013h					;vga 320x200x256
	int 10h

	mov ax, @DATA					;@data Физический адрес сегмента данных типа near
	mov ds, ax						;инициируем сегмент данных
	mov ax, 0a000h					;настроим дополнительный сегмент ES на участок видео памяти 0A000h
	mov es, ax 						;es - сегмент видео
	mov FirstCadr, 0h
	call MainProgram	
MainLoop:
	
	in al,60h 						;проверка нажатия
	
										;----------------------- СДВИГ ПО ОСИ Z
	push ax
	cmp	al, 10h	 						;Если клавиша "A"
	jne	DONTROTSZ
	mov	ax, 1
	sub	DeltaZ, ax	 					;смещаем на 2 у.е.
	jmp KEYPress
	DONTROTSZ:
	pop ax
										
	push ax
	cmp	al, 12h	 						;Если клавиша "D"
	jne	DONTROTSZ2
	mov	ax, 1
	add	DeltaZ, ax	 					;смещаем на 2 у.е.
	jmp KEYPress
	DONTROTSZ2:
	pop ax	
										;----------------------- СДВИГ ПО ОСИ X
	push ax
	cmp	al, 1Eh	 						;Если клавиша "A"
	jne	DONTROTSX
	mov	ax, 1
	sub	DeltaX, ax	 					;смещаем на 2 у.е.
	jmp KEYPress
	DONTROTSX:
	pop ax
										
	push ax
	cmp	al, 20h	 						;Если клавиша "D"
	jne	DONTROTSX2
	mov	ax, 1
	add	DeltaX, ax	 					;смещаем на 2 у.е.
	jmp KEYPress
	DONTROTSX2:
	pop ax	
										;----------------------- СДВИГ ПО ОСИ Y
	push ax
	cmp	al, 11h	 						;Если клавиша "W"
	jne	DONTROTSY
	mov	ax, 1
	sub	DeltaY, ax	 					;смещаем на 2 у.е.
	jmp KEYPress
	DONTROTSY:
	pop ax
										
	push ax
	cmp	al, 1Fh	 						;Если клавиша "S"
	jne	DONTROTSY2
	mov	ax, 1
	add	DeltaY, ax	 					;смещаем на 2 у.е.
	jmp KEYPress
	DONTROTSY2:
	pop ax

										;----------------------- ПОВОРОТ ПО ОСИ Y
	push ax
	cmp	al, 4bh	 						;Если клавиша "Left"
	jne	DONTROTL
	mov	ax, 2
	sub	YAngle, ax	 					;уменьшаем угол на 2 градуса
	jns	KEYPress
	add	YAngle, 360
	jmp KEYPress
	DONTROTL:
	pop ax										
	push ax
	cmp	al, 4dh	 						;Если клавиша "Right"
	jne	DONTROTR
	mov	ax, 2
	add	YAngle, ax	 					;увеличиваем на 2 градуса
	cmp	YAngle, 360
	jb	KEYPress
	sub	YAngle, 360
	jmp KEYPress
	DONTROTR:
	pop ax	
										;----------------------- ПОВОРОТ ПО ОСИ Z
	push ax
	cmp	al, 0Ch	 						;Если клавиша "-"
	jne	DONTROTMM
	mov	ax, 2 				
	sub	ZAngle, ax	 					; уменьшаем 2 градуса
	jns	KEYPress
	add	ZAngle, 360
	jmp	KEYPress
	DONTROTMM:
	pop ax
	push ax
	cmp	al, 0Dh							;Если клавиша "="
	jne	DONTROTRR
	mov	ax, 2
	add	ZAngle, ax	 					;увеличиваем на 2 градуса
	cmp	ZAngle, 360
	jb	KEYPress
	sub	ZAngle, 360
	jmp KEYPress
	DONTROTRR:
	pop ax
										;----------------------- ПОВОРОТ ПО ОСИ X
	push ax	
	cmp	al, 48h	 						;Если клавиша "Up"
	jne	DONTROTU
	mov	ax, 2	
	sub	XAngle, ax	 					;уменьшаем на 2 градуса
	jns	KEYPress	
	add	XAngle, 360
	jmp KEYPress
	DONTROTU:
	pop ax
	push ax	
	cmp	al, 50h	 						;Если клавиша "Down"
	jne	DONTROTD	
	mov	ax, 2
	add	XAngle, ax						;увеличиваем на 2 градуса
	cmp	XAngle, 360
	jb	KEYPress
	sub	XAngle, 360
	jmp KEYPress
	pop ax
	
KEYPress:	
	call MainProgram				;отрисовка кадра
	
DONTROTD:
	pop ax
    cmp al, 01h 						;ESCAPE
    jne MainLoop						;если нет, повтор
    mov ax,4c00h 					;выход
    int 21h 						;в дос

;___________________________________ПОВОРОТ ТРЕХМЕРНЫХ КООРДИНАТ НА ОСНОВЕ ТЕКУЩИХ ЗНАЧЕНИЙ УГЛОВ ПОВТОРА								
Rotation PROC uses si di, coord1:word, coord2:word, angle:word

									;преобразуем градусы в радианы
	fild angle						;угол записываем в st(0)
	fldpi							;st(0)=пи st(0)->st(1)
	fmulp							;угол*пи st(0)=st(0)*st(1)
	fdiv Rad						;угол*пи/180 st(0)=st(0)/Rad
									;найдем sin и cos
	fsincos 						;st(1)=sin, st(0)=cos

									;адреса координат
	mov di, coord1
	mov si, coord2

	fild word ptr [di]				;первая координата (x) st(0)=x st(1)=cos st(2)=sin st(3)=angel
	fmul st, st(1)					;x * cos(a) st(0)=st(0)*st(1)
	fild word ptr [si]				;вторая координата (y) st(0)=y st(1)=x*cos st(2)=cos st(3)=sin st(4)=angel
	fmul st, st(3) 					;y * sin(a) st(0)=st(0)*st(3)
	fsubp 							;x * cos(a) - y * sin(a) st(0)=st(1)-st(0) st(1)=cos st(2)=sin st(3)=angel

	fild word ptr [di]				;x st(0)=x st(1)=x * cos(a) - y * sin(a) st(2)=cos st(3)=sin st(4)=angel
	fmul st, st(3)					;x * sin(a) st(0)=st(0)*st(3)
	fild word ptr [si] 				;y st(0)=y
	fmul st, st(3)					;y * cos(a) st(0)=st(0)*st(3)
 
	faddp							;x * sin(a) + y * cos(a) st(0)=st(0)+st(1)

	fistp word ptr [si]				;y = x * sin(a) + y * cos(a) word=st(0)
	fstp st(1)						;уберем из стека cos
	fstp st(1)						; и sin
	fistp word ptr [di] 			;x = x * cos(a) - y * sin(a)
	
	ret 							;в итоге получили новые координаты x,y и угол(в стеке)
Rotation endp

;____________________________________ВРАЩАЕМ ТОЧКУ ВОКРУГ ВЫБРАННЫХ ОСЕЙ
									
RotatePoint PROC					;si указывает на структуру POINT3D
									;читаем 3D координаты во временные переменные
	mov ax, [POINT3D ptr si].xx
	add ax, DeltaX
	mov X, ax
	
	mov ax, [POINT3D ptr si].yy
	add ax, DeltaY
	mov Y, ax
	
	mov ax, [POINT3D ptr si].zz
	add ax, DeltaZ
	mov Z, ax

	call Rotation, offset Y, offset Z, XAngle	;вращаем вокруг оси x
	call Rotation, offset X, offset Z, YAngle	;вращаем вокруг оси y
	call Rotation, offset X, offset Y, ZAngle	;вращаем вокруг оси z
	
	ret
RotatePoint endp

;___________________________________ПРЕОБРАЗУЕМ 3D КООРДИНАТЫ ВЕРШИН В 2D КООРДИНАТЫ НА ЭКРАНЕ
									;используем переменные X, Y, Z
									;результат пишем по адресу [di], в элемент POINT2D
Conv3Dto2D PROC
	mov ax, Xoff 					; Xoff*X / Z+Zoff = экранное X
	mov bx, X
	imul bx
	mov bx, Z
	add bx, Zoff 					; расстояние от глаз
	idiv bx
	add ax, Nx 						; центр экрана
	mov [POINT2D ptr di].xx, ax		; сохраним экранное X

	mov ax, Yoff					; Yoff*Y / Z+Zoff = экранное Y
	mov bx, Y
	imul bx
	mov bx, Z
	add bx, Zoff					; расстояние от глаз
	idiv bx
	add ax, Ny						; центр экрана
	mov [POINT2D ptr di].yy, ax		; сохраним экранное Y
	ret
Conv3Dto2D ENDP

;____________________________________ОСНОВНАЯ ПОДПРОГРАММА РАСЧЕТА И РИСОВАНИЯ
MainProgram PROC
									;Заливка экрана
	cmp FirstCadr, 1
	jne draw
	mov cx, CountL
	xor di, di 
FillScr:
	push cx  ;сохраняем значение счетчик
	PRLINE LineMass[di][0], LineMass[di][2], 0
	add di, 6
	pop cx	;восстанавливаем значение счетчика
	loop FillScr
draw:
;----------------------------------- ПЕРЕСЧЕТ фигуры
	lea di, Figure2D 				; адрес 2D координат на экране
	lea si, Figure 					; адрес 3D координат вершин
	mov cx, CountV 					; число вершин
ConvLoop:
	call RotatePoint				; вращаем вершины
	call Conv3Dto2D 				; 3D в 2D
	add si, size POINT3D 			; на следующую 3D вершину
	add di, size POINT2D 			; на следующую 2D вершину
	loop ConvLoop
;-----------------------------------ПРОРИСОВКА РЕБЕР
	mov FirstCadr, 1h
	
	mov cx, CountL
	xor di, di 
DrLine:
	push cx  ;сохраняем значение счетчик
	PRLINE LineMass[di][0], LineMass[di][2], LineMass[di][4]
	add di, 6
	pop cx	;восстанавливаем значение счетчика
	loop DrLine

	ret
MainProgram ENDP

;____________________________________РИСУЕМ ЛИНИЮ (X1,Y1)-(X2,Y2) ЦВЕТОМ COLOR
Line proc uses di bx, x1:word, y1:word, x2:word, y2:word, color:byte

local i:word, \ 					;для работы со сопроцессором
	delta_x:word, \ 				;длина проекции на ось абсцисс
	delta_y:word, \ 				;длина проекции на ось ординат
	incx:word, \ 					;приращение по X
	incy:word 						;приращение по Y

									;определим длину проекции на ось абсцисс и шаг по оси X
	mov ax, x2
	sub ax, x1						;ax=x2-x1;

									;определим шаг по X (+1 если вперед, -1 если назад, 0 если не меняется)
	mov incx, 0						;пусть incx=0
	test ax, ax 					;ax=delta_x
	jz set_delta_x					;не меняется
	jg set_x_1						;jg>0 вперед?
	dec incx						;назад, значит incx=-1
	neg ax 							;найдем ax=abs(delta_x)
	jmp set_delta_x					;на сохранение
set_x_1:
	inc incx						;вперед, значит incx=1;
set_delta_x:
	mov delta_x, ax					;delta_x = abs(x2-x1)

									;определим длину проекции на ось ординат и шаг по оси Y
	mov ax, y2
	sub ax, y1						;ax=y2-y1;

									;определим шаг по Y (+1 если вперед, -1 если назад, 0 если не меняется)
	mov incy, 0 					;пусть incy=0
	test ax, ax 					;ax=delta_y
	jz set_delta_y 					;не меняется
	jg set_y_1 						;вперед?
	dec incy 						;назад, значит incy=-1
	neg ax 							;найдем ax==abs(delta_y)
	jmp set_delta_y 				;на сохранение
set_y_1:
	inc incy 						;вперед, значит incy=1;
set_delta_y:
	mov delta_y, ax 				;delta_y=abs(y2-y1)
 
									;определим большее из проекций как основное направление
	cmp ax, delta_x 				;ax=delta_y
	jge from_y						;если проекция Y(ax)>=X(delta_x) то y будет основным
	cmp delta_x, 0					;проверим, чтобы не было delta_x=0 (для точки),
	jz Line_ret						; иначе будет деление на 0
									;delta_x>delta_y && delta_x!=0
									;основное направление - по оси X
	fild delta_y 					;запись в стек сопроцессора delta_y
	fidiv delta_x 					;st=k=(float)(delta_y/delta_x) делим стек на delta_x k-угол наклона линии

									;for(int i=0;i<delta_x;i++)
	xor cx, cx						;cx=i
	jmp cmp_i_x						;на проверку i<delta_x
x_loop:								;тело цикла
	mov i, cx 						;запишем переменную цикла в память (для сопроцессора)
	fld st							;st(0)=st(1)=k
	fimul i 						;st(0)=k*i
	fimul incy 						;st(0)=incy*k*i
	call floor 						;округлим до целого в большую сторону
	fistp i 						;сохраним в переменной, то есть i=st(0)... st(1)->st(0)
	mov ax, i 						;x относительно первой точки строки на экране
	add ax, y1 						;добавим до ординаты начальной точки
	mov dx, 320 					;получим индекс начала строки экрана в сегменте экрана
	imul dx 						;для этого умножим на длину в байтах одной строки
	mov bx, ax 						;сохраним bx=y=(y1+floor(incy*k*i))*320
									;посчитаем X
	mov ax, incx 					;X меняется ровно на шаг приращения,
	imul cx 						; умноженному на индекс точки
	add ax, x1 						;добавим абциссу начальной точки ax=x=x1+incx*i

	add ax, bx 						;сложим с индексом начала строки
	mov di, ax 						;будем адресовать через di

	mov al, color 					;цвет точки
	mov es:[di], al 				;рисуем

	inc cx 							;на следующую точку
cmp_i_x:
	cmp cx, delta_x 				;дошли до конца?
	jl x_loop 						;если i<delta_x то переходим на x_loop
	jmp Line_ret					;на выход
 

from_y: 							;вдоль оси Y
	fild delta_x
	fidiv delta_y 					;st=k=(float)(delta_x/delta_y)

									;for (int i=0;i<delta_y;i++)
	xor cx, cx 						;cx=i
	jmp cmp_i_y						;на проверку i<delta_y
y_loop: 							;тело цикла
	mov ax, incy 					;Y меняется ровно на шаг приращения,
	imul cx 						; умноженному на индекс точки
	add ax, y1 						;добавим абциссу начальной точки ax=y=y1+incy*i
	mov dx, 320 					;получим индекс начала строки экрана в сегменте экрана
	imul dx 						; для этого умножим на длину в байтах одной стоки
	mov bx, ax 						;сохраним bx=y=(y1+incy*i)*320
									;посчитаем X
	mov i, cx 						;запишем переменную цикла в память (для сопроцессора)
	fld st 							;st=st(1)=k
	fimul i 						;st=k*i
	fimul incx 						;st=incx*k*i
	call floor						;округлим до целого в большую сторону
	fistp i 						;сохраним в переменной
	mov ax,i 						;относительный номер строки на экране
	add ax, x1 						;ax=x=x1+floor(incx*k*i)

	add ax, bx 						;сложим с индексом начала строки
	mov di, ax 						;будем адресовать через di

	mov al, color 					;цвет точки
	mov es:[di], al 				;рисуем!

	inc cx 							;на следующую точку
cmp_i_y:
	cmp cx, delta_y 				;дошли до конца?
	jl y_loop
Line_ret:
	fistp i 						;удалим из сопроцессора k
	ret
Line endp

;____________________________________ОКРУГЛЕНИЕ ДО ЦЕЛОГО В БОЛЬШУЮ СТОРОНУ
floor proc
	local CtrlOld:word, CtrlNew:word
	fstcw CtrlOld 					;сохраним управляющее слово
	fclex 							;сбросим исключения
	mov CtrlNew,0763h 				;установим необходимое значение управляющего слова  (округление в большую сторону)
	fldcw CtrlNew 					;загружаем управляющее слово
	frndint 						;округляем st до целого
	fclex 							;сбросим исключения
	fldcw CtrlOld 					;восстановим старое управляющее слово
	ret
floor endp
END