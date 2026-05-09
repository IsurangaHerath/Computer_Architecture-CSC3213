;Write a program that prints the multiplication table of 5, up to 5 × 10.
.model small
.stack 100h
.data
msg db "table $"
newline db 13,10,'$'
msg1 db " * $"
msg2 db " = $"
ans db 0
r db 0
r1 db 0

.code
main:
    mov ax, @data
    mov ds, ax

    ; Print "table"
    mov dx, offset msg
    mov ah, 09h
    int 21h
	
    ; Print newline
    mov dx, offset newline
    mov ah, 09h
    int 21h
	
    mov cl, 10     ; Loop counter (10 iterations)
    mov bl, 1      ; Multiplier (1 to 10)

sum_loop:
    ; Multiply 5 * bl
    mov al, bl
    mov dl, 5
    mul dl          ; AL = AL * DL
    mov ans, al     ; Store result in 'ans'

    ; Print "5"
    mov dl, 5
    add dl, 48
    mov ah, 02h
    int 21h 

    ; Print " * "
    mov dx, offset msg1
    mov ah, 09h
    int 21h

    ; Print multiplier (BL) - handling 2 digits for 10
    mov al, bl
    cmp al, 10
    jne print_multiplier

    ; If 10, print '1' and '0'
    mov dl,1
	add dl,48
    mov ah, 02h
    int 21h

    mov dl, '0'
    mov ah, 02h
    int 21h

    jmp after_multiplier

print_multiplier:
    mov dl, al
	add dl, 48
    mov ah, 02h
    int 21h

after_multiplier:
    ; Print " = "
    mov dx, offset msg2
    mov ah, 09h
    int 21h

    ; Print result (in ans)
    mov al, ans
    cmp al, 10
    jl one_digit

    ; Two-digit number
    mov ah, 00
    mov dl, 10
    div dl 
    mov r,ah	; AL = quotient, AH = remainder

    mov dl, al
	add dl, 48
    mov ah, 02h
    int 21h

    mov dl, r
    add dl, 48
    mov ah, 02h
    int 21h

    jmp after_result

one_digit:
    mov dl, ans
    add dl, 48
    mov ah, 02h
    int 21h

after_result:
    ; Print newline
    mov dx, offset newline
    mov ah, 09h
    int 21h

    inc bl
    loop sum_loop

    ; Exit program
    mov ah, 4ch
    int 21h

end main
