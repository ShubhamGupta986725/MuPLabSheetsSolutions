.model tiny
.386

.data

cnt db 08h

.code
.startup

    ; SET DISPLAY MODE
    ; Set video mode to 80x25 text, 16 colors
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    ; INITIALIZING
    ; Load the addresses of the input string, length counter, and column position into registers
    MOV CH, 00h
    MOV CL, cnt
    MOV SI, 01h
    MOV DI, 01h
    MOV DH, 00h

    WRITE1:
    PUSH CX

    ; SETTING CURSOR POSITION
    MOV AH, 02H
    MOV DL, 00h
    MOV BH, 00h
    INT 10H

    ; Write a single character with custom vertical spacing
    MOV AX, SI
    ADD AL, 64
    MOV AH, 09h
    MOV BH, 00
    MOV BL, 00001111b
    MOV CX, SI
    INT 10H
    POP CX
    ; CHANGING VERTICES
    ; Increment the input string pointer, column position,
    ; and decrement the length counter
    MOV BP, DI
    ADD DI, SI
    MOV SI, BP
    INC DH
    DEC CL
    JNZ WRITE1

    ; BLOCKING FUNCTION
    ; Wait for the user to press the '%' key to exit
    END1:
    MOV AH, 07H
    INT 21h
    CMP AL, "%"
    JNZ END1
.exit
end
