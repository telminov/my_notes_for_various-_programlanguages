DATA SEGMENT PARA PUBLIC 'DATA'
text db 'TEXTTEXTTEXT',0 ; ����� ����� �� ��������
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
; ��������� ����������� 3
mov ah,0 ; ������� 0
mov al,3 ; ����� 3
int 10h
; ������� ������ � ������� �������� �������
mov ah,6 ; ������������� ��� ��������� ���� �����
mov al,0 ; ������� ����� ����
mov bh,87h ; ��������� �������� ��������
mov ch,0 ; Y ���. �������� ����
mov cl,0 ; X ���. �������� ����
mov dh,24 ; Y ����. ������� ����
mov dl,89 ; X ����. ������� ����
int 10h
; ��������� ������� �������
mov ah,2 ; ������� 2
mov bh,0 ; �������� 0
mov dh,12 ; ������ 12
mov dl,38 ; ������� 38
int 10h
; ����� ������
mov ah,0Eh  ; ������� 0Eh
lea si,text ; �������� ������ (DS)
mov bl,7
loop2: cmp byte ptr [si],0 ; �������� �� ����� ������
jz loop1 ; �����
mov al,[si]
int 10h
inc si
jmp short loop2
; �������� ����� ������� �������
loop1: mov ah,0 ; ������� 0
int 16h
cmp al,' ' ; ������ ?
jnz loop1 ; ��� !
; ����� �� ���������
int 20h
    
    MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
            END   MAIN