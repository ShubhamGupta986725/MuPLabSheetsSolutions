.model tiny
.data
    ; Data section contains the messages, the correct username, and password for comparison.

    msg1    db "enter 10 character long User Name: $" 
    ; Message 1: Prompt to enter the username

    usn1    db "anub@g.com$" 
    ; Correct username for comparison

    max1    db 20 
    ; Maximum length for input

    act1    db ?
    ; Placeholder for action

    inp1    db 20 dup ("$") 
    ; Buffer to store user's input for username

    fname1    db "username.txt", 0 
    ; Correct username for comparison

    handle1 dw ?

    fname2    db "password.txt", 0 
    ; Correct username for comparison

    handle2 dw ?

    msg2    db "enter 5 character long password:$" 
    ; Message 2: Prompt to enter the password

    pass1   db "oscar" 
    ; Correct password for comparison

    inp2    db 30 dup ("$") 
    ; Buffer to store user's input for password

    msg3    db "hello $" 
    ; Message 3: Greeting message when both inputs are correct

    msg4    db "wrong username$" 
    ; Message 4: Wrong username input

    msg5    db "wrong password$" 
    ; Message 5: Wrong password input

    nline   db 0ah, 0dh, "$" 
    ; New line characters

.code
.startup
; Take input from the username.txt and store it in inp1.
    mov ah, 3dh
    mov al, 0h
    lea dx, fname1
    int 21h
    mov handle1, ax

    mov ah, 3fh
    mov bx, handle1
    mov cx, 11h
    lea dx, inp1
    int 21h

    mov ah, 3eh
    int 21h
; Compare the username in username.txt with the stored username.
    cld
    lea di, inp1
    lea si, usn1
    mov cx, 10
    repe cmpsb
    jcxz l1
; If the username is incorrect, display the "wrong username" message and exit.
    lea dx, nline
    mov ah, 09h
    int 21h
    lea dx, msg4
    mov ah, 09h
    int 21h
    mov ah, 4ch
    int 21h
; If the username is correct, read password from password.txt and store it in inp2
l1: mov ah, 3dh
    mov al, 0h
    lea dx, fname2
    int 21h
    mov handle2, ax

    mov ah, 3fh
    mov bx, handle2
    mov cx, 11h
    lea dx, inp2
    int 21h

    mov ah, 3eh
    int 21h
; Compare the entered password with the stored password.
    cld
    mov cx, 6
    lea di, inp2
    lea si, pass1
    repe cmpsb
    jcxz l3
; If the password is incorrect, display the "wrong password" message and exit.
    lea dx, nline
    mov ah, 09h
    int 21h
    lea dx, msg5
    mov ah, 09h
    int 21h
    mov ah, 4ch
    int 21h
; If the password is correct, display the greeting message an the username.
    
l3: lea dx, nline
    mov ah, 09h
    int 21h
    lea dx, msg3
    mov ah, 09h
    int 21h
    lea dx, usn1
    mov ah, 09h
    int 21h
    lea dx, nline
    mov ah, 09h
    int 21h
.exit
end
