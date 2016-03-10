STACK	SEGMENT	PARA STACK 'STACK'
	DB 64 DUP('STACK')
STACK	ENDS
DATA	SEGMENT PARA PUBLIC 'DATA'

A	dw	1,-3,2
	dw	-2,5,4
	dw	4,1,-3
N	dw	3
s	dw	?,?,?
	
DATA 	ENDS
CSEG 	SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG,DS:DATA,SS:STACK
PR1	PROC
	MOV	AX,DATA
	MOV	DS,AX
	
	XOR	di,di
	XOR	si,si
	MOV	cx,N
m1:	XOR	ax,ax
	XOR	bx,bx
	PUSH	cx
	MOV	cx,N
m2:	TEST	A[bx][di],0000000000000001b
	JNZ	m3
	ADD	ax,A[bx][di]
m3:	ADD	bx,2
	LOOP	m2
	POP	cx
	MOV	s[si],ax
	ADD	si,2
	ADD	di,N
	ADD	di,N
	LOOP	m1
	XOR	di,di
m4:	MOV	ax,s[di]
	MOV	si,di
	MOV	bx,di
	ADD	bx,2
m5:	CMP	s[bx],ax
	JGE	m6
	MOV	ax,s[bx]
	MOV	si,bx
m6:	ADD	bx,2
	MOV	cx,N
	ADD	cx,cx
	CMP	bx,cx
	JLE	m5
	CMP	di,si
	JE	m8	
	MOV	dx,s[di]
	MOV	s[si],dx
	MOV	s[di],ax
	MOV	cx,N
	XOR	bx,bx
m7:	MOV	ax,A[bx][di]
	MOV	dx,A[bx][si]
	MOV	A[bx][si],ax
	MOV	A[bx][di],dx
	ADD	bx,2
	LOOP	m7
m8:	ADD	di,2
	MOV	cx,N
	ADD	cx,cx
	CMP	di,cx
	JL	m4					

	
	RET
PR1	ENDP

CSEG	ENDS
	END	PR1