.model small
.stack 100h
.data
    star    db '* $'
    space   db ' $'
    newline db 13,10,'$'
    n db 3            
.code
start:
    mov ax, @data
    mov ds, ax

    mov cl, n               
    mov si, 0              

row_loop:
    inc si                  

    ; ----- Print leading spaces -----
    mov bl, si              ; Bl = SI
    dec bl                  ; Bl = SI - 1
    shl bl, 1               ; Bl = 2 × (SI - 1)

print_spaces:
    cmp bl,0
    jz done_spaces

    mov dx, offset space
    mov ah, 09h
    int 21h
    dec bl
    jmp print_spaces

done_spaces:

    mov bl, 4
    sub bl, si              ; BX = 4 - SI

print_stars:
    cmp bl, 0
    jz done_stars

    mov dx, offset star
    mov ah, 09h
    int 21h
    dec bl
    jmp print_stars

done_stars:
    ; Print newline
    mov dx, offset newline
    mov ah, 09h
    int 21h

    loop row_loop

    ; Exit program
    mov ah, 4Ch
    int 21h
end start
