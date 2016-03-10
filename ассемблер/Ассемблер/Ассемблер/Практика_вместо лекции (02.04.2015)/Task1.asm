;----��������--���������-------
DATA SEGMENT PARA PUBLIC 'DATA'
;------------------------------
frequency1 		equ 	300 	; �������� ������������ 1
frequency2 		equ 	500 	; �������� ������������ 2
number_cycles1 	equ 	1000 	; ���������� ������ (����.)
number_cycles2 	equ 	600 	; ���������� ������ (����.)
port_b 		equ 	61h 	; ����� ���������� ����� �
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
beg1: 	call kbin ; ����� ����������
	cmp al,'1' ; = '1' ?
	jnz beg2 ; ���
	call ton1 ; ���� ������ 1
	jmp beg1 ; ������� �� ������ �����
beg2: cmp al,'2' ; = '2' ?
	jnz beg3 ; ���
	call ton2 ; ���� ������ 2
	jmp beg1 ; ������� �� ������ �����
beg3: cmp al,'q' ; = '' ?
	jnz beg1 ; ���
	int 20h ; ����� �� ���������
start 	endp
ton2 	proc near ; ��������� ��������� ����� 2
	mov dx,number_cycles2 ; ������������ 2
	mov di,frequency2 ; �������� 2
	jmp ton0 ; ������� �� ������������� ��������� ��������� �����
ton1 	proc near ; ��������� ��������� ����� 1
	mov dx,number_cycles1 	; ������������ 1
	mov di,frequency1 	; �������� 1
; ������������� ��������� ��������� �����
; DX - ���������� ������, DI - ��������
ton0 	proc 	near
	cli ; ���������� ����������
	in 	al,port_b ; ������ ����. �������. ����� �
	and 	al,11111110b ; ���. �������� �� �������
ton01: or 	al,00000010b ; ��������� ��������
	out 	port_b,al ; ������ � ��������� ���� �
	mov 	cx,di ; ������� ����� ��������
	loop 	$; ��������
;// ���������� �����
	and 	al,11111101b ; ���������� ��������
	out 	port_b,al ; ������ � ��������� ���� �
	mov 	cx,di ; ������� ����� ��������
	loop 	$ ; ��������
	dec 	dx ; ��������� �������� �����. ������
	jnz 	ton01 ; ������� �� ������ ������ �������
	sti ; ���������� ����������
	ret ; ����� �� ���������
ton0 	endp ; ����� ������������� ���������
ton1 	endp ; ����� ��������� ��������� ����� 1
ton2 	endp ; ����� ��������� ��������� ����� 2
kbin 	proc near ; ���� � ���������� � ���������
	mov 	ah,0 ; ������� 0
	int 	16h ; ������������� ����������
	ret ; ����� �� ���������
kbin 	endp ; ����� ��������� ����� � ����������
code 	ends ; ����� �������� (��������)

;------------------------------
		MOV AX,4C00h
        INT    21h
MAIN ENDP
CODE ENDS
END   MAIN