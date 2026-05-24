.model small
.stack 100h

.data
	msg1 db 13,10, "Enter a character	: &"
	msg2 db 13,10, "Total Vovels		: $"
	msg3 db 13,10, "Total Consinants	: $"
	msg4 db 13,10, "Invalid Inputs		: $"
	
	count_v db 0
	count_c db 0
	count_i db 0
	loop_cnt db 10
	
.code
main proc
	mov ax,@data
	mov ds,ax

	input_loop:
		mov dx, offset msg1
		mov ah,09h
		int 21h
.model small
.stack 100h

.data
    msg_prompt  db 13, 10, 'Enter a character: $'
    msg_vowels  db 13, 10, 'Total Vowels     : $'
    msg_cons    db 13, 10, 'Total Consonants : $'
    msg_invalid db 13, 10, 'Invalid Inputs   : $'
    
    count_v     db 0    
    count_c     db 0    
    count_i     db 0    
    loop_cnt    db 10   ; Variable to control loop

.code
main proc
    mov ax, @data
    mov ds, ax

input_loop:
    ; Prompt for character
    mov dx, offset msg_prompt
    mov ah, 09h
    int 21h

    ; Read character
    mov ah, 01h
    int 21h

    ; --- Check if valid alphabet ---
    cmp al, 'A'         
    jl invalid_char     
    
    cmp al, 'z'         
    jg invalid_char     
    
    cmp al, 'Z'         
    jle is_upper        
    
    cmp al, 'a'         
    jl invalid_char     

    ; Convert lowercase to uppercase
    sub al, 32          

is_upper:
    ; --- Check if Vowel ---
    cmp al, 'A'
    je is_vowel
    cmp al, 'E'
    je is_vowel
    cmp al, 'I'
    je is_vowel
    cmp al, 'O'
    je is_vowel
    cmp al, 'U'
    je is_vowel

    ; If not a vowel, it must be a consonant
    inc count_c         
    jmp next_iter

is_vowel:
    inc count_v
    jmp next_iter

invalid_char:
    inc count_i

next_iter:
    dec loop_cnt        ; Decrease our memory counter
    cmp loop_cnt, 0     ; Check if we have hit 0
    jne input_loop      ; If not 0, loop back

    ; =========================================================
    ; OUTPUT PHASE (Fully contained inside main proc)
    ; =========================================================

    ; --- 1. Display Vowels ---
    mov dx, offset msg_vowels
    mov ah, 09h
    int 21h
    mov al, count_v
    
    cmp al, 10          ; Did they type exactly 10 vowels?
    je print_v_ten
    
    add al, 48          ; Single digit: convert to ASCII
    mov dl, al
    mov ah, 02h
    int 21h
    jmp print_cons      ; Move to the next category
    
print_v_ten:
    mov dl, '1'         ; Print '1'
    mov ah, 02h
    int 21h
    mov dl, '0'         ; Print '0'
    mov ah, 02h
    int 21h

print_cons:
    ; --- 2. Display Consonants ---
    mov dx, offset msg_cons
    mov ah, 09h
    int 21h
    mov al, count_c
    
    cmp al, 10          
    je print_c_ten
    
    add al, 48          
    mov dl, al
    mov ah, 02h
    int 21h
    jmp print_inv       
    
print_c_ten:
    mov dl, '1'         
    mov ah, 02h
    int 21h
    mov dl, '0'         
    mov ah, 02h
    int 21h

print_inv:
    ; --- 3. Display Invalid Inputs ---
    mov dx, offset msg_invalid
    mov ah, 09h
    int 21h
    mov al, count_i
    
    cmp al, 10          
    je print_i_ten
    
    add al, 48          
    mov dl, al
    mov ah, 02h
    int 21h
    jmp exit_prog       
    
print_i_ten:
    mov dl, '1'         
    mov ah, 02h
    int 21h
    mov dl, '0'         
    mov ah, 02h
    int 21h

exit_prog:
    ; Exit program cleanly
    mov ah, 4ch
    int 21h
main endp

end main
		mov ah,01h
		int 21h

		cmp al, 'A'
		jl invalid_char

		cmp al,'z'
		jg invalid_char

		cmp al,'Z'
		jle is_upper

		cmp al,'a'
		jl invalid_char

		sub al,32
	
	is_upper:
		cmp al,'A'
		je is_vowel
		
		cmp al,'E'
		je is_vowel
		
		cmp al,'I'
		je is_vowel
		
		cmp al,'O'
		je is_vowel
		
		cmp al,'U'
		je is_vowel
		
		
		inc count_c
		jmp next_iter
	
	is_vowel:
		inc count_v
		jmp next_iter
	
	invalid_char:
		inc count_i
		jmp next_iter
		
	next_iter:
	dec loop_cnt
	cmp	loop_cnt,0
	jne input_loop
	
	
	
	
	mov dx, offset msg2
	mov ah,09h
	int 21h
	
	mov al,count_v
	cmp al,10
	je print_10
	
	add al,48
	mov dl,al
	mov ah,02h
	int 21h
	
		print_10_v:
		mov dl,'1'
		mov ah,02h
		int 21h
		
		mov dl,'0'
		mov ah,02h
		int 21h
	

	mov dx,offset msg3
	mov ah,09h
	int 21h
	
	mov al,count_c
	cmp al,10
	je print_10_c
	
	add al,48
	mov dl,al
	mov ah,02h
	int 21h
		
		print_10_c:
			mov dl,'1'
			mov ah,02h
			int 21h
			
			mov dl,'0'
			mov ah,02h
			int 21h
	
	mov dx,offset msg4
	mov ah,09h
	int 21h
	
	mov al,count_i
	cmp al,10
	je print_10_i
	
	add al,48
	mov dl,al
	mov ah,02h
	int 21h
	
		print_10_i:
		mov dl,'1'
		mov ah,02h
		int 21h
		
		mov dl,'0'
		mov ah,02h
		int 21h
		
	mov ah,4c00h
	int 21h
	
	main endp
	end main