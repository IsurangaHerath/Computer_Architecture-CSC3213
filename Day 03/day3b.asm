;Input two digits and display as number

.model small
.stack 100h
.data
    n1 db 0        
    n2 db 0       
    n3 db 10     
    msg1 db "Enter 2-digit number: $"
    msg2 db "Your number is: $"

.code
start:
    mov ax,@data
    mov ds,ax


    ; Display prompt
    mov ah,09h
    mov dx, offset msg1
    int 21h


    ; Input first digit
    mov ah,01h
    int 21h
    sub al,48        ; convert ASCII to number
    mov n1,al        ; store in n1


    ; Input second digit
    mov ah,01h
    int 21h
    sub al,48
    mov n2,al        ; store in n2


    ; Newline 
    mov dl,13
    mov ah,02h
    int 21h
    mov dl,10
    int 21h


    ; Display message
    mov ah,09h
    mov dx, offset msg2
    int 21h


    ; Combine digits
    mov al,n1
    mov bl,n3       ; multiplier 10
    mul bl          ; AL * 10 → AL, AH unused here (since result < 100)
    add al,n2       ; add second digit


    ; Convert number to ASCII digits 

    mov ah,0        ; clear AH
    mov bl,10
    div bl          ; divide AL by 10 → AL = tens, AH = units

    ; Print tens digit
    add al,48
    mov dl,al
    mov ah,02h
    int 21h

    ; Print units digit
    mov al,ah
    add al,48
    mov dl,al
    mov ah,02h
    int 21h


    ; Newline
    mov dl,13
    mov ah,02h
    int 21h
    mov dl,10
    int 21h

    mov ax,4c00h
    int 21h

end start