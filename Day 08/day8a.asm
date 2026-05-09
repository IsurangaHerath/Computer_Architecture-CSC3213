.model small
.stack 100h
.data
    heading db "Which is greatest? $"
    msg1    db "n1 is greatest $"
    msg2    db "n2 is greatest $"
    msg3    db "n3 is greatest $"
    n1 db 5
    n2 db 6
    n3 db 7

.code
start:
    mov ax,@data
    mov ds,ax

    mov dx,OFFSET heading
    mov ah,09h
    int 21h

    mov dl,10
	mov ah,02h
	int 21h
	
    mov al, n1
    cmp al, n2
    jge  Lb1yes    ; if n1 ≥ n2
    jl  Lb1no     ; else n1 < n2


Lb1yes:
    mov bl, n3
    cmp al, bl
    jge  Print1   
    jl  Print3   

Lb1no:
    mov bl, n3
    cmp bl,n2   ;n3>=n2
	jge  Print3   
    jl Print2 
    jmp endd

Print1:
    mov dx, OFFSET msg1
     mov ah,09h
    int 21h
	jmp endd

Print2:
    mov dx, OFFSET msg2
     mov ah,09h
    int 21h
	jmp endd

Print3:
    mov dx, OFFSET msg3
	 mov ah,09h
    int 21h
    jmp endd

endd:
    mov ax,4C00h
    int 21h

end start
