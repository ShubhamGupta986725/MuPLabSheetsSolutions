.model tiny
.data
dat1 db 'abhabeu'
dat1length db 07h
res dw 00h
.code
.startup
    lea si, dat1
    lea di, dat1
    mov cx, 00h
    mov cl, dat1length
    add di, cx
    dec di
continue:
    mov bl, [di]
    cmp [si], bl
    jnz fin
    mov dx, 01h
    dec di
    inc si
    dec cx
    jnz continue
    inc cx
    dec cx
    jz last
fin: 
    mov dx, 00h
last:
    mov res, dx
.exit
end
