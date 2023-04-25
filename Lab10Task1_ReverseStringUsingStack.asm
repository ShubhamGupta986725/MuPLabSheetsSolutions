.model tiny
.data
name1 dw 'S', 'h', 'u', 'b', 'h', 'a', 'm'
.code
.startup
    lea si, name1
    lea di, name1
    mov cx, 7
x1: 
    push word ptr [si]
    inc si
    inc si
    dec cx
    jnz x1
    mov cx, 11
x2:
    pop word ptr [di]
    inc di
    inc di
    dec cx
    jnz x2
    lea di, name1
.exit
end
