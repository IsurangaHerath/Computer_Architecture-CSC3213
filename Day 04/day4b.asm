.model small
.stack 100

.data 
msg1 db "Emter the first number: $"
msg2 db "Enter the second number: $"
msg3 db "Summation is $"
msg4 db "Substraction is $"

t1 db 0
o1 db 0

t2 db 0
o2 db 0

sum db 0
subb db 0

r1 db 0
r2 db 0

.code

	mov ax,@data
	mov ds,ax
	
		mov dx,offset msg1
		mov ah,09h
		int 21h
		
	;first number 1 digit	
		mov ah,01h
		int 21h
		sub al,48
		mov t1,al
		
	;first number 2 digit
		mov ah,01h
		int 21h
		sub al,48
		mov o1,al
		
		;new line
		mov dl,10
		mov ah,02h
		int 21h
		
		
		mov dx,offset msg2
		mov ah,09h
		int 21h
		
	;second number 1 digit
		mov ah,01h
		int 21h
		sub al,48
		mov t2,al
		
	;second number 2 digit
		mov ah,01h
		int 21h
		sub al,48
		mov o2,al
		
		;new line
		mov dl,10
		mov ah,02h
		int 21h
		
		mov dx,offset msg3
		mov ah,09h
		int 21h
		
	;find summation	
		mov bl,10		
		mov al,t1
		mul bl
		add al,o1
		
		mov sum,al
		
		mov bl,10
		mov al,t2
		mul bl
		add al,o2
		
		add al,sum	
		
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
	;summation find end
	
		;new line
		mov dl,10
		mov ah,02h
		int 21h
		
		mov dx,offset msg4
		mov ah,09h
		int 21h
		
	;find substraction
		mov bl, 10
		mov al, t1      
		mul bl         
		add al, o1      
		mov subb, al    

		mov al, t2     
		mul bl          
		add al, o2      
		
		; Perform Subtraction: First - Second
		mov bl, subb    
		sub bl, al      
		mov al, bl
		
		mov ah, 00
		mov bl, 10
		div bl          
		
		mov r2, ah      
		
		mov dl, al
		add dl, 48
		mov ah, 02h
		int 21h
		
		mov dl, r2
		add dl, 48
		mov ah, 02h
		int 21h
	;substraction finds end
	
		mov ax,4c00h
		int 21h
		
end
		
		
		
	
		
	