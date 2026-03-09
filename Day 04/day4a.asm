.model small
.stack 100h

.data
msg1 db "Enter the number: $"
t db 0 ;2
o db 0 ;3
dig db 0
r db 0

.code
	mov ax,@data
	mov ds,ax

		mov dx,offset msg1
		mov ah,09h
		int 21h
		
	;read the first digit
		mov ah,01h
		int 21h
		sub al,48
		mov t,al
		
		
	;read the second digit
		mov ah,01h
		int 21h
		sub al,48
		mov o,al
		
		mov dl,10
		mov ah,02h
		int 21h
		
	;unknown variable
		mov bl,10
		
		mov al,t
		mul bl
		add al,o
		
		mov dig,al  ;23
		
		mov al,dig
		mov ah,00
		div bl
		
		mov r,ah
		
		mov dl,al
		add dl,48
		mov ah,02h
		int 21h
		
		mov dl,r
		add dl,48
		mov ah,02h
		int 21h
		
		mov ax,4c00h
		int 21h
		
end