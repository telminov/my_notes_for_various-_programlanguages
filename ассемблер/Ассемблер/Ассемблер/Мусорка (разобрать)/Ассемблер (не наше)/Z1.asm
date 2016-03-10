STACK	SEGMENT	PARA STACK 'STACK'
	DB 64 DUP('STACK')
STACK	ENDS
DATA	SEGMENT PARA PUBLIC 'DATA'

A	db	1,-3,2
	db	-2,5,4
	db	4,1,-3
N	dw	3
s	db	?,?,?
	
DATA 	ENDS
CSEG 	SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG,DS:DATA,SS:STACK
PR1	PROC
	MOV	AX,DATA
	MOV	DS,AX
	
	XOR	bx,bx
	XOR	bp,bp
	MOV	cx,N
m1:	XOR	al,al
	XOR	di,di
	PUSH	cx
	MOV	cx,n
m2:	CMP	A[bx][di],0
	JLE	m3
	ADD	al,A[bx][di]
m3:	INC	di
	LOOP	m2
	POP	cx
	MOV	s[bp],al
	INC	bp
	ADD	bx,N
	LOOP	m1
	XOR	bp,bp
m4:	MOV	ah,s[bp]
	MOV	bx,bp
	MOV	di,bp
	INC	di
m5:	CMP	s[di],ah
	JGE	m6
	MOV	ah,s[di]
	MOV	bx,di
m6:	INC	di
	CMP	di,N
	JLE	m5
	CMP	bp,bx
	JE	m8	
	MOV	al,s[bp]
	MOV	s[bp],ah
	MOV	s[bx],al
	MOV	cx,N
	XOR	di,di
m7:	MOV	ah,A[bp][di]
	MOV	al,A[bx][di]
	MOV	A[bp][di],al
	MOV	A[bx][di],ah
	INC	di
	LOOP	m7
m8:	INC	bp
	CMP	bp,N
	JL	m4					

	
	RET
PR1	ENDP

CSEG	ENDS
	END	PR1