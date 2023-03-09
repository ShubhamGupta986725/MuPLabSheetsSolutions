.model tiny
.data
str1	db	'Enter your name: $'
max1	db	32
act1	db	?
inp1 	db	32 dup('$')

fname	db	'testing.txt',0
handle	dw	?

.code
.startup
    
    ; Print str1 to console

    MOV AX, 00h
    LEA DX, str1
    MOV AH, 09h
    INT 21h

    ; Read String from console

    MOV AH, 0Ah
    LEA DX, max1
    INT 21h

    ; Make the File if it doesn't exist

    MOV AH, 3Ch
    LEA DX, fname
    MOV CL, 1h
    INT 21h
    MOV handle, AX

    ; Open the File

    MOV AH, 3Dh
    MOV AL, 1h
    LEA DX, fname
    INT 21h
    MOV handle, AX

    ; Write the message to File
    MOV AH, 40h
    MOV BX, handle
    MOV CL, act1
    LEA DX, inp1
    INT 21h
    
    ; Close the File
    MOV AH, 3Eh
    INT 21h
    

.exit
end
