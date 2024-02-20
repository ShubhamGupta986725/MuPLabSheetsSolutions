.model tiny
.data
array1 db 23, -8, 16, -5, 33, -7, -19
count db 7
neg1 db ?

.code
.startup

mov cx,7
mov dl,0
lea si, array1
x2: mov al,[si]    
    cmp al,0
    jge x1
    inc dl
   
x1: inc si
    loop x2

lea di,neg1
mov [di],dl

.exit
end