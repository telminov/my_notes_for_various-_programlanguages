; ����������� ������� ����������, ���������� � �������� ������ (��� DOS),
; ���������� ����������� �������, ����������� ��� ������� ������������,
; � ����� �������� ������ ��� ������� ������ ������ ��������� �����, ����
; ������ ���� "u"

Code segment para public
console proc far
Assume cs:code, ds:code, es:code

; ������p� ��������� ���p���
rh struc 	; ��p����p� ���������
rh_len db ? 	; ����� ������
rh_init db ? 	; ����p ���p������ (��������)
rh_cmd 	db ? 	; ������� �p����p� ���p������
rh_status dw ? 	; ����p������� �p����p��
rh_res1 dd ? 	; ����p�
rh_res2 dd ? 	; ����p�
rh ends

rh0 struc 			; ��������� ���p��� ������� 0
rh0_rh db size rh dup(?) 	; �����p������� �����
rh0_numunit db ? 		; ����� ���p����� � �p����
rh0_brk_ofs dw ? 		; �������� �����
rh0_brk_seg dw ? 		; ������� �����
rh0_bpb_pno dw ? 		; �������� ����. ������� BPB
rh0_bpb_pns dw ? 		; ������� ����. ������� BPB
rh0_drv_itr db ? 		; ��p��� ��������� ����������
rh0 ends

rh4 struc 			; ��������� ���p��� ��� ������� 4
rh4_rh db size rh dup(?) 	; ������������� �����
rh4_media db ? 			; ����p����p �������� �� DPB
rh4_buf_ofs dw ? 		; �������� DTA
rh4_buf_seg dw ? 		; ������� DTA
rh4_count dw ? 			; ������� ��p�����
rh4_start dw ? 			; ���������� �����p (��������)
rh4 ends

rh5 struc 			; ��������� ����p��� ��� ������� 5
rh5_rh db size rh dup(?) 	; �����p������� �����
rh5_return db ? 		; ����p������� ������
rh5 ends

rh7 struc 		; ��������� ���p��� ��� ������� 7
rh7_len db ? 		; ����� ������
rh7_unit db ? 		; ����p ���p������ (��������)
rh7_cmd db ? 		; ������� �p����p� ���p������
rh7_status dw ? 	; ����p������� �p����p��
rh7_res1 dd ? 		; ����p�
rh7_res2 dd ? 		; ����p�
rh7 ends

rh8 struc 			; ��������� ���p��� ��� ������� 8
rh8_rh db size rh dup(?) 	; �����p������� �����
rh8_media db ? 			; ����p����p �������� �� DPB
rh8_buf_ofs dw ? 		; �������� DTA
rh8_buf_seg dw ? 		; ������� DTA
rh8_count dw ? 			; ������� ���. (����. -  ��������, ������ � ����.)
rh8_start dw ? 			; ��������� �����p (��������)
rh8 ends

rh9 struc 			; ��������� ���p��� ��� ������� 9
rh9_rh db size rh dup(?) 	; �����p������� �����
rh9_media db ? 			; ����p����p �������� �� DPB
rh9_buf_ofs dw ? 		; �������� DTA
rh9_buf_seg dw ? 		; ������� DTA
rh9_count dw ? 			; ������� ���. (����. -  ��������, ����� - ����.)
rh9_start dw ? 			; ��������� �����p (��������)
rh9 ends

; �������� �p�����p�
start:
 ; ��������� ���p������ ��� DOS
 next_dev dd -1 		; ���� ���������� ���p������
 attribute dw 8003h 		; ����������, ����/�����
 strategy dw dev_strategy 	; ��p. �p��. ���������
 interrupt dw dev_interrupt 	; ��p. �p��. ����������
 dev_name db 'CON     ' 	; ��� �p����p�

 ; ������� �p���p������ ��� �p����p�
 rh_ofs dw ? 		; �������� ��������� ���p���
 rh_seg dw ? 		; ������� ��������� ���p���
 sav db 0 		; ������, ��������� � ��������p�

; �p�����p� ��������� (��p��� ����� �� DOS).
; ��� ����� ����� ������� ������ ��������. ��� ���������
; ��������� ����� ��������� ������� � ���������� rh_seg � rh_ofs.
; �p�����p� ���������� (���p�� ����� �� DOS)
; ������������ ������� �� ��������� �������, ����� �������
; �������c� � ��������� ������� (�� ��, ��� � ������)
; ��������� �p�����p� (����� ����).

dev_strategy:
 mov cs:rh_seg,es
 mov cs:rh_ofs,bx
ret

; ��������� ����������
dev_interrupt:
 cld 		; DF=0 - ��������� ��������� ��� ���������� ��������. ����. ���������
 push ds
 push es
 push ax
 push bx
 push cx
 push dx
 push di
 push si

 mov ax,cs:rh_seg 	; �������������� ES � BX
 mov es,ax 		; ����������� ��� ������
 mov bx,cs:rh_ofs 	; ��������� C��������

; ������� � ������������ ��������� �����. �������
 mov al,es:[bx].rh_cmd 	; ������� �� ��������� �������
 rol al,1 		; ��������
 lea di,cmdtab 		; ����� ������� ���������
 xor ah,ah
 add di,ax
 jmp word ptr[di]

; ������� ��������� ��� ��������� ������
 cmdtab dw INITIALIZATION 	; �������������
 dw MEDIA_CHECK 		; �������� �������� (������)
 dw GET_BPB 			; ��������� BPB
 dw IOCTL_INPUT 		; IOCTL-����
 dw INPUT 			; ����
 dw ND_INPUT 			; ������������� ����
 dw INPUT_STATUS 		; ��������� �����
 dw INPUT_CLEAR 		; ������� �����
 dw OUTPUT 			; �����
 dw OUTPUT_VERIFY 		; ����� � ���������
 dw OUTPUT_STATUS 		; ��������� ������
 dw OUTPUT_CLEAR 		; ������� ������
 dw IOCTL_OUT 			; IOCTL-�����
 dw OPEN 			; �������� ����������
 dw CLOSE 			; �������� ����������
 dw REMOVABLE 			; ������� ��������
 dw OUTPUT_BUSY 		; ����� �� ���������

tire proc near		; ����� '-' ���� '�':
xor	al,'�'		; ��������� ������ 'M'?
jnz	back1		; H�� - �������
mov	ah,03h		; ����� ������� ��
int	10h		; ������ ����� 'M'
dec	dl		; � ������ ��� � al
dec	dl
mov	ah,02h
int	10h
mov	ah,08h
int	10h
inc	dl
inc	dl
xor	al,'m'		; ������ ����� 'M'-'m'?
jnz	back		; H�� - �������.
mov	al,'-'		
mov	sav,al		; ������ '-' � sav
mov	al,0
mov	ah,02h		; ����������� �������
int	10h
jmp	back1
back:
mov	ah,02h		; ����������� �������
int	10h
mov	al,0 
mov	sav,al
back1:	ret
tire endp


; ��p������ ������ DOS
; ������� 0 �������������
initialization:	call 	initial 	; ����� ���������� ���������
lea 	ax,initial 			; ��������� ��p��� �����
mov 	es:[bx].rh0_brk_ofs,ax 		; ��������
mov 	es:[bx].rh0_brk_seg,cs 		; �������
jmp 	done 				; ���. ��� ������� � �����
; ������� 1 �������� ��������
media_check:
 jmp done 			; ���. ��� ������� � �����

; ������� 2 ��������� ���
get_bpb:
 jmp done 			; ���. ��� ������� � �����

; ������� 3 ���� IOCTL
ioctl_input:
 jmp unkn 			; ���. ��� ������ � �����

; ������� 4 ����
input:
 xor ax,ax
 mov cx,es:[bx].rh4_count 	; ���p. ������� �����
 mov di,es:[bx].rh4_buf_ofs 	; �������� ����p�
 mov ax,es:[bx].rh4_buf_seg 	; ������� ����p�
 mov es,ax 			; ES = ������� ����pa
read1:	
 xor ax,ax
 xchg al,sav 			; ����� ���p������� ������
 or al,al 			; �� p���� 0?
 jnz read3 			; ��� - ��p����� ��� � ����p
read2:	 			; sav=0 - ������� ��������� ������
 xor ah,ah 			; ������� 0 - ����������
 int 16h 			; �p�p������ BIOS ��� ��������p�
 or ax,ax 			; 0? (����p ����)
 jz read2 			; ����� ��������� ������
 or al,al 			; ��� p����p����� �������?
 jnz read3 			; ��� - ��p����� �� ���
 mov sav,ah 			; ���p����� ����-���
read3:	
 mov es:[di],al 		; �������� ��� � ����p
 inc di				; C������� ���������
 loop read1
 mov es,cs:rh_seg 		; ������������ ES
 mov bx,cs:rh_ofs 		; ������������ BX
 jmp done

; ������� 5 ��p��p������� ����
nd_input:
 mov al,sav 			; ����� ���p������� ������
 or al,al 			; = 0?
 jnz nd1 			; ��� - ����p����� ��� � DOS
 mov ah,1 			; ������� BIOS ����p��� ���������
 int 16h
 jz busy			; (Z) - �������� � ����p� ���
nd1:
 mov es:[bx].rh5_return,al 	; �o��p����� ������ DOS
 jmp done 			; ���. ��� ������� � �����

; ������� 6 ��������� �����
input_status:
 jmp done 			; ���������� ��� ������� � �����

; ������� 7 ������� �����
input_clear:
 mov sav,0 			; ��p�� ���p�������� �������

ic1:
 mov ah,1
 int 16h 			; BIOS - ����p��� ����. ��������p�
 jz done 			; (Z) - ����p ����
 xor ah,ah 
 int 16h 			; BIOS ���������� �������
 jmp ic1 			; �����p��� �� ����������� ����p�

; ������� 8 �����
output:
 mov cx,es:[bx].rh8_count 	; ����� ������� ������
 mov di,es:[bx].rh8_buf_ofs 	; �������� ����p�
 mov ax,es:[bx].rh8_buf_seg 	; ������� ����pa
 mov es,ax
 xor bx,bx 			; bl - ���� ��p��. ����� � �p�����

out1:
 mov al,es:[di] 		; ����� ��������� ������
 inc di 			; �������� ���������
 mov ah,0eh 			; ����� � p����� ���������
 int 10h

 push cx			; �-��� BIOS 03h ������ cx
 call simbol
 pop cx

 loop out1 			; �����p��� (count) p��
 mov es,cs:rh_seg 		; �������������� ��p���
 mov bx,cs:rh_ofs 		; ��������� ���p���
 jmp done

; ������� 9 ����� � ����p����
output_verify: jmp output
; ������� 10 ��������� ������
output_status: jmp done
; ������� 11 ������� ������
output_clear: jmp done
; ������� 12 IOCTL-�����
ioctl_out: jmp unkn 		; ���������� ��� ������ � �����
; ������� 13 ���p����
open: jmp done
; ������� 14 ���p����
close: jmp done
; ������� 15 ������� ��������
removable: jmp unkn
; ������� 16 ����� �� ���������
output_busy: jmp unkn
; ����� �� ������
unkn: or es:[bx].rh_status,8003h ; ���������� ���
jmp done 			 ; ������ � �� ���
; ������� �����
busy: or es:[bx].rh_status,200h  ; ���������� ��� �����
done: or es:[bx].rh_status,100h  ; ���������� ��� �������

pop si
pop di
pop dx
pop cx
pop bx
pop ax
pop es
pop ds
ret

; ����� �p��p����
; ��� ��������� ���������� ������ �p� ������������� 
; � ����� ���� ����� ���p��
initial proc near
lea dx,cs:msg1
mov ah,9
int 21h 			; ����� ��������� �� ��p��
ret
initial endp


msg1 db '<<< Console driver [by Korolkov, IT-4 ] >>>',0dh,0ah,'$'
console endp
Code ends
End start