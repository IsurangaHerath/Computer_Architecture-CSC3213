.model small
.stack 100h
.data
msg db 'Enter the units: $'
msg1 db 'Total bill balane:$'
newline db 13, 10, '$'
a db 0 
b db 0
d db 0
d1 db 0
d2 db 0
r1 db 0
r2 db 0
r db 0
   

.code
main:
    mov ax, @data
    mov ds, ax

    ;Print header message
    mov dx, offset msg
    mov ah, 09h
    int 21h

    call readInt
	
	cmp al,20
	jg nextunit1
	
	mov bl,2
	mul bl
	
	call print1
	jmp endd
	nextunit1:
	cmp al,30
	jg nextunit2
	
	mov dl,al
	sub dl,20
	mov bl,4
	mov al,dl
	mul bl
	mov dl,al
	mov bl,2
	mov al,20
	mul bl
	add dl,al
	mov al,dl
	
	call Print1 
	jmp endd
	nextunit2:
	mov d,al
	mov dl,d
	sub dl,30
	mov bl,10
	mov al,dl
	mul bl
	mov d1,al
	mov al,20
	mov bl,2
	mul bl
	mov d2,al
	
	mov al,10
	mov bl,4
	mul bl
	add al,d2
	add al,d1

   call print
   jmp endd
   endd:
    mov ax, 4C00h
    int 21h


proc readInt
		mov ah,01h
		int 21h
		sub al,48
		mov a,al
			read :
				mov ah,01h
				int 21h
				cmp al,0dh
				je exit
				
				sub al,48
				mov b,al
				
				mov al,a
				mov bl,10
				mul bl
				add al,b
				
				mov a,al
				jmp read
				
				exit:
				mov al,a
	ret
	endp
	
proc print	

mov dx, offset msg1
    mov ah, 09h
    int 21h

			mov bl,100
			mov ah,00
			div bl
			mov r1,ah
			mov dl,al
			add dl,48
			mov ah,02h
			int 21h

			mov al,r1
			mov dl,10
			mov ah,00
			div dl
			mov r2,ah

			mov dl,al
			add dl,48
			mov ah,02h
			int 21h


			mov dl,r2
			add dl,48
			mov ah,02h
			int 21h
	    ret 
    endp

proc print1
	mov dx, offset msg1
    mov ah, 09h
    int 21h

			mov bl,10
			mov ah,00
			div bl
			mov r1,ah
			mov dl,al
			add dl,48
			mov ah,02h
			int 21h

			mov dl,r1
			add dl,48
			mov ah,02h
			int 21h
	    ret 
    endp
end main
