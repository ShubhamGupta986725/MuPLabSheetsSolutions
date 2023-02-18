.model tiny
.data
.code
.startup

    mov AX, 1133h
    mov BH, AL
    mov BL, AH
    mov 20h[BX], BX

.exit
end
