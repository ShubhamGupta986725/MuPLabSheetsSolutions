-- nPr = n!/(n-r)!

.model tiny
.data
n dw 5h
r dw 2h
.code
.startup
    mov bx, n
    mov dx, r
    call fact
    mov cx, ax
    mov bx, n
    sub bx, dx
    call fact
    mov dx, 00
    mov bx, cx
    mov cx, ax
    mov ax, bx
    div cx
.exit
    fact proc
    push dx
    mov ax, 1
x1:
    mul bx
    dec bx
    jnz x1
    pop dx
    ret
    fact endp
end
