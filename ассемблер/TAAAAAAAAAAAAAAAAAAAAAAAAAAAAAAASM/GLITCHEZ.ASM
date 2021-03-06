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
color db 0 ; ������� ����
x1 dw 0 ; ���������� �1
y1 dw 0 ; ���������� �1
x2 dw 0 ; ���������� �2
y2 dw 0 ; ���������� �2
start1: ; ��������� �����������
mov ah,0 ; ������� ��������� �����������
mov al,4 ; ����. ���. CGA 320 * 200 �����
int 10h
; ���������� ������� �����
; �����������
mov al,1 ; ������� ����
mov x1,0
mov x2,319
mov y1,0
call lineh ; ������� �����������
mov x1,0
mov x2,319
mov y1,199
call lineh ; ������ �����������
; ���������
mov x1,0
mov y1,0
mov y2,199
call linev ; ����� ���������
mov x1,319
mov y1,0
mov y2,199
call linev ; ������ ���������
; ���������� ��������������
mov al,2 ; ��������� ����
mov x1,140
mov y1,80
mov x2,180
mov y2,120
call bar
call kbin
int 20h
; ���� � ����������
kbin proc near
mov ah,0 ; ������� 0
int 16h ; ������������� ����������
ret
kbin endp
; ���������� ������������ ��������������
; �1,Y1 - ���������� ������ �������� ����
; X2,Y2 - ���������� ������ ������� ����
bar proc near
mov cx,x1
cmp cx,x2 ; ��������� ������ � ������
jc bar1 ; x1 < x2
ret ; ����� ��� ������� ������ �������.
bar1: mov dx,y1 ; ������ �����
cmp dx,y2 ; ��������� ������ � ������
jc bar2 ; y1 < y2
ret ; ����� ��� ������� ������ �������.
; ���������� CX, DX - ����� ������� ����
bar2: mov bp,y2
sub bp,dx
inc bp
bar3: call lineh
inc word ptr y1
dec bp
jnz bar3
ret
bar endp
; ���������� ������������ �����
; �1 - ���������� X
; Y1 - ���������� Y ������ �����
; X2 - ���������� Y ����� �����
linev proc near
mov cx,x1
mov dx,y1 ; ������ �����
cmp dx,y2 ; ��������� ������ � ������
jnz lv1 ; ����� �� �������
ret ; ����� ��� ������� �����
lv1: jc lv2 ; ������ ������ �����
; ����� ������ (CX) ������ ����� (X2)
sub dx,y2
inc dx
mov bx,dx ; ����� �����
mov dx,y2 ; ������ ����� �����
jmp short lv3
lv2: mov bx,y2 ; ����� (CX = ������)
sub bx,y1 ; ����� ������
inc bx ; �����
lv3: call pixel
inc dx
dec bx
jnz lv3
ret
linev endp
; ���������� �������������� �����
; Y1 - ���������� Y
; X1 - ���������� � ������ �����
; X2 - ���������� � ����� �����
lineh proc near
mov dx,y1
mov cx,x1 ; ������ �����
cmp cx,x2 ; ��������� ������ � ������
jnz lh1 ; ����� �� �������
ret ; ����� ��� ������� �����
lh1: jc lh2 ; ������ ������ �����
; ����� ������ (CX) ������ ����� (X2)
sub cx,x2
inc cx
mov bx,cx ; ����� �����
mov cx,x2 ; ������ ����� �����
jmp short lh3
lh2: mov bx,x2 ; ����� (CX = ������)
sub bx,x1 ; ����� ������
inc bx ; �����
lh3: call pixel
inc cx
dec bx
jnz lh3
ret
lineh endp
; ���������� ����� �������� �����
; CX - ���������� �
; DX - ���������� Y
pixel proc near
push bx
mov ah,0ch ; ������� ���������� ������. �����
mov bh,0 ; �������������
int 10h
pop  bx
ret
pixel endp

    
    MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN