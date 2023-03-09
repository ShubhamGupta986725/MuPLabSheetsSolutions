.model tiny
.data
fname1	db	'ID.TXT',0
handle1	dw ?
fname2	db 'name.txt',0
handle2	dw ?
fname3	db	'splice.txt',0
handle3	dw	?

part1		db 0Dh dup('$')
len1        db 0Dh
part2		db 7h dup('$')
len2        db 7h

.code
.startup

    ; Open file ID.txt

    MOV AH, 3Dh
    MOV AL, 00h
    LEA DX, fname1
    INT 21h
    MOV handle1, AX

    ; Read contents of ID.txt into part1

    MOV AH, 3Fh
    MOV BX, handle1
    MOV CH, 00h
    MOV CL, len1
    LEA DX, part1
    INT 21h

    ; Close ID.txt

    MOV AH, 3Eh
    INT 21h



    ; Open file name.txt

    MOV AH, 3Dh
    MOV AL, 00h
    LEA DX, fname2
    INT 21h
    MOV handle2, AX

    ; Read contents of name.txt into part1

    MOV AH, 3Fh
    MOV BX, handle2
    MOV CH, 00h
    MOV CL, len2
    LEA DX, part2
    INT 21h

    ; Close name.txt

    MOV AH, 3Eh
    INT 21h


    ; Make splice.txt if it doesn't exist

    MOV AH, 3Ch
    LEA DX, fname3
    MOV CL, 1h
    INT 21h
    MOV handle3, AX

    ; Open splice.txt

    MOV AH, 3Dh
    MOV AL, 1h
    LEA DX, fname3
    INT 21h
    MOV handle3, AX

    ; Write Part1 to File

    MOV AH, 40h
    MOV BX, handle3
    MOV CL, len1
    MOV CH, 00h 
    LEA DX, part1
    INT 21h

    ; Write Part2 to File

    MOV AH, 40h
    MOV BX, handle3
    MOV CL, len2
    MOV CH, 00h 
    LEA DX, part2
    INT 21h

    ; Close splice.txt

    MOV AH, 3Eh
    INT 21h

.exit
end
