.model tiny
.data
    ; Data section contains the messages, the correct username, and password for comparison.

    msg1    db "Please enter the Username: $:"

    maxu1    db 20 
    ; Maximum length for input

    actu1    db ?
    ; Placeholder for action

    inpu1    db 20 dup ("$") 
    ; Buffer to store user's input for username


    maxu2    db 20 
    ; Maximum length for input

    actu2    db ?
    ; Placeholder for action

    inpu2    db 20 dup ("$")

    fname1    db "username.txt", 0 
    ; Correct username for comparison

    handle1 dw ?

    fname2    db "password.txt", 0 
    ; Correct username for comparison

    handle2 dw ?

    msg2    db "enter your password: $" 
    ; Message 2: Prompt to enter the password

    maxp1 db 30

    actp1 db ?

    inpp1    db 30 dup ("$") 
    ; Buffer to store user's input for password

    maxp2 db 30

    actp2 db ?

    inpp2    db 30 dup ("$") 
    ; Buffer to store user's input for password

    msg3    db "hello $" 
    ; Message 3: Greeting message when both inputs are correct

    msg4    db "wrong username$" 
    ; Message 4: Wrong username input

    msg5    db "wrong password$" 
    ; Message 5: Wrong password input
    
    msg6    db "How Long is your Username?: $"

    msg7    db "How Long is your Password?: $"

    nline   db 0ah, 0dh, "$" 
    ; New line characters
.code
.startup
; Take input from the username.txt and store it in inpu1.
    mov ah, 3dh
    mov al, 0h
    lea dx, fname1
    int 21h
    mov handle1, ax

    mov ah, 3fh
    mov bx, handle1
    mov cl, maxu1
    mov ch, 0
    lea dx, inpu1
    int 21h

    mov ah, 3eh
    int 21h
; Take input of username from user.
    lea dx, msg1
    mov ah, 09h
    int 21h
    lea dx, maxu2
    mov ah, 0Ah
    int 21h
    lea dx, nline
    mov ah, 09h
    int 21h
; Compare the inpu1 and inpu2.
    cld
    lea di, inpu1
    lea si, inpu2
    mov cx, 11
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
; If username is correct, Prompt the user to input the size of the password
    lea dx, msg2
    mov ah, 09h
    int 21h

; If the username is correct, read password from password.txt and store it in inpp1
l1: mov ah, 3dh
    mov al, 0h
    lea dx, fname2
    int 21h
    mov handle2, ax

    mov ah, 3fh
    mov bx, handle2
    mov cl, maxp1
    mov ch, 0
    lea dx, inpp1
    int 21h

    mov ah, 3eh
    int 21h
; Take user input of what the password is.
    lea dx, msg2
    mov ah, 09h
    int 21h
    mov cx, 30
    lea di, inpp2
l2: mov ah, 08h
    int 21h
    mov [di], al
    mov dl, '*'
    mov ah, 02h
    int 21h
    mov bl, '$'
    cmp [di], bl
    jz endLoop
    inc di
    dec cx
    jnz l2
endLoop:
; Compare value stored in inpp1 and inpp2
    cld
    mov cx, 6
    lea di, inpp2
    lea si, inpp1
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
    lea dx, inpu1
    mov ah, 09h
    int 21h
    lea dx, nline
    mov ah, 09h
    int 21h
l4:
.exit
end
