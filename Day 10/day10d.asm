;Print the first N numbers in the Fibonacci series.
.model small
.stack 100h
.data
m db " $"
n db 0
n1 db 0
n2 db 1
.code
start:
    mov ax, @data
    mov ds, ax

    mov cl,5        
           
    mov dl, n1        
    call intt 
     
	 mov dx,offset m
	 mov ah,09h
	 int 21h
	 
    mov dl, n2
    call intt 
	
	mov dx,offset m
	 mov ah,09h
	 int 21h
	 
    mov al,0
	mov bl,1
print_loop:
    mov dl, al
	add dl,bl
    mov n, dl        
    mov dl,n
	call intt 
     
    mov al,bl        
    mov bl,n 
	
    mov dx,offset m
	 mov ah,09h
	 int 21h
    loop print_loop
	
	 

    mov ax, 4c00h
    int 21h
	
	proc intt
	 add dl, 48        
    mov ah, 02h
    int 21h
	ret
	endp

end start
