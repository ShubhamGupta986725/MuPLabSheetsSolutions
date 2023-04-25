.model tiny
.data
	char db ?
	fname db 'Vatsal1.txt',0
	contents db 13 dup(?)
	handle1 dw ?
	rowstr dw 0
	rowend dw 19
	colmstr dw 0
	colmend dw 640
	breadth dw 19
.code
.startup
	mov AH, 01h
	int 21h
	mov char, al
	
	mov ah, 3dh
	mov al, 00h
	lea dx, fname
	int 21h
	mov handle1,ax
	
	mov ah, 3fh
	mov bx, handle1
	mov cx, 0ch
	lea dx,contents
	int 21h
	
	mov ah,3eh
	int 21h
	
	
	mov ah, 00h
	mov al, 12h
	int 10h
	
	mov ah, 02h
	mov dh, 20
	mov dl, 20
	mov bh, 00
	int 10h
	
	lea si, contents
	add si, 11
	mov al, char
	mov cx, 25
	cmp al, [si]
	jz ShowGreen
	jnz ShowPurple
	ShowGreen:
		mov si, rowstr
		push cx
		Colm1:
			mov cx, colmend
			Row1:
				DEC cx
				MOV di, cx
				push cx
				MOV AH, 0ch
				mov al, 1101b
				mov cx, di
				mov dx,si
				int 10h
				pop cx
				cmp cx, colmstr
				JNZ	Row1
			INC SI
			MOV ax, rowend
			cmp si, ax
			jnz Colm1
		mov ax, breadth
		add rowstr, ax
		add rowend, ax
		pop cx
		dec cx
		JZ Endstmt
	ShowPurple:
		mov si, rowstr
		push cx
		Colm2:
			mov cx, colmend
			Row2:
				DEC cx
			mov di, cx
				push cx
				MOV AH, 0ch
				mov al, 1010b
				mov cx, di
				mov dx,si
				int 10h
				pop cx
				cmp cx, colmstr
				JNZ Row2
			INC SI
			MOV ax, rowend
			cmp si, ax
			jnz Colm2
		mov ax, breadth
		add rowstr, ax
		add rowend, ax
		pop cx
		dec cx
		JZ Endstmt
		JNZ ShowGreen
	Endstmt:
	
	
.exit
end
