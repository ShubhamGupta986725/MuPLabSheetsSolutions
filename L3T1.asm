.model tiny
.data
    array db 91h, 02h, 83h, 75h, 0Ah, 47h, 12h, 76h, 61h
.code
.startup
    lea bx, array
    mov cl, 9h
    mov al, 0Ah
X1: cmp [bx], al
    jnz X2
    mov dl, 55h
    mov [bx], dl
X2: inc bx
    dec cl
    jnz X1
.exit
end
