.model tiny
.data
fname1	db	'name.txt',0
fname2 	db	'id.txt',0
handle1	dw	?
handle2	dw ?
str1	db	'Enter your name: $'
max1	db	32
act1	db	?
inp1 	db	32 dup('$')

str2	db	'Enter your ID: $'
max2	db	32
act2	db	?
inp2 	db	32 dup('$')

.code
.startup

    ; Make file name.txt if it doesn't exist
    
    MOV AH, 3Ch
    LEA DX, fname1
    MOV CL, 1h
    INT 21h
    MOV handle1, AX

    ; Open file name.txt

    MOV AH, 3Dh
    MOV AL, 1h
    LEA DX, fname1
    INT 21h
    MOV handle1, AX

    ; Get Input of the name from terminal 

    MOV AH, 09h
    LEA DX, str1
    MOV CX, 17
    INT 21h

    MOV AH, 0Ah
    LEA DX, max1
    INT 21h

    ; Print the string into the file name.txt

    MOV AH, 40h
    MOV BX, handle1
    MOV CL, act1
    MOV CH, 00h
    LEA DX, inp1
    INT 21h

    ; Close file name.txt
    MOV AH, 3Eh
    INT 21h


    ; Flush the input buffer

    MOV AH, 0Ch
    INT 21h

    ; Print New Line character

    MOV DX, 13
    MOV AH,2
    INT 21h  
    MOV DX,10
    MOV AH,2
    INT 21h

    ; Make file ID.txt if it doesn't exist
    
    MOV AH, 3Ch
    LEA DX, fname2
    MOV CL, 1h
    INT 21h
    MOV handle2, AX

    ; Open file ID.txt

    MOV AH, 3Dh
    MOV AL, 1h
    LEA DX, fname2
    INT 21h
    MOV handle2, AX

    ; Get Input of the ID from terminal 

    MOV AH, 09h
    LEA DX, str2
    MOV CX, 15
    INT 21h

    MOV AH, 0Ah
    LEA DX, max2
    INT 21h

    ; Print the string into the file ID.txt

    MOV AH, 40h
    MOV BX, handle2
    MOV CL, act2
    MOV CH, 00h
    LEA DX, inp2
    INT 21h

    ; Close file ID.txt
    MOV AH, 3Eh
    INT 21h
.exit
end
