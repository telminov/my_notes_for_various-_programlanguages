.model small
.stack 100h
.data
buf db 80
lnt db ?
string  db 80 dup(?)
.code
start:
    mov ax,@data
    mov ds,ax
 
    mov ah,0ah
    lea dx,buf
    int 21h
 
    xor cx,cx
@1: mov cl,lnt
    dec cl
    lea si,string
    xor bl,bl
@2: lodsb
    cmp al,byte ptr[si]
    jna @3
    inc bl
    xchg al,byte ptr[si]
    mov byte ptr[si-1],al
@3: loop @2
    or bl,bl
    jnz @1
    mov byte ptr[si+1],'$'
    mov word ptr[buf],0d0ah
    
    mov ah,9
    lea dx,buf
    int 21h 
 
    mov ax,4c00h
    int 21h
end start
