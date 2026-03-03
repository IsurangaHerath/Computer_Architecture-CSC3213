;User input + arithmetic operations

.model small
.stack 100h
.data
    n1 db 0
    n2 db 0

    m1 db "Enter first number: $"
    m2 db "Enter second number: $"

    m3 db "Sum: $"
    m4 db "Difference: $"
    m5 db "Product: $"
    m6 db "Quotient: $"

.code
start:
    mov ax,@data
    mov ds,ax


    ; Input first number
    mov ah,09h
    mov dx,offset m1
    int 21h

    mov ah,01h       ; read character
    int 21h
    sub al,48        ; convert ASCII to number
    mov n1,al        ; store in n1

    ; Newline
    mov dl,13
    mov ah,02h
    int 21h
    mov dl,10
    int 21h

    ; Input second number
    mov ah,09h
    mov dx,offset m2
    int 21h

    mov ah,01h
    int 21h
    sub al,48
    mov n2,al

    ; Newline
    mov dl,13
    mov ah,02h
    int 21h
    mov dl,10
    int 21h

    ; Sum
    mov ah,09h
    mov dx,offset m3
    int 21h

    mov al,n1
    add al,n2
    add al,48       ; convert to ASCII
    mov dl,al
    mov ah,02h
    int 21h

    ; Newline
    mov dl,13
    mov ah,02h
    int 21h
    mov dl,10
    int 21h


    ; Difference (n1 - n2)
    mov ah,09h
    mov dx,offset m4
    int 21h

    mov al,n1
    sub al,n2
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


    ; Product
    mov ah,09h
    mov dx,offset m5
    int 21h

    mov al,n1
    mul n2
    add al,48       ; works only for single-digit result
    mov dl,al
    mov ah,02h
    int 21h

    ; Newline
    mov dl,13
    mov ah,02h
    int 21h
    mov dl,10
    int 21h


    ; Quotient (n1 / n2)
    mov ah,09h
    mov dx,offset m6
    int 21h

    mov al,n1
    mov ah,0
    div n2
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

    ; Exit program
    mov ax,4c00h
    int 21h
end start