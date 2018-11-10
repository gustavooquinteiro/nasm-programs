segment .data
	valor1 dd 0
	valor2 dd 0
	resto dd 0
	nl dd `\n`,0
	nlen: equ $-nl
	
segment .bss
	vetor2 resb 3
	vetor1 resb 3
	vetor3 resb 4
	barran resb 1

segment .text
	global _start:

_start:
	mov eax, 3
	mov ebx, 0
	mov ecx, vetor2
	mov edx, 3
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, barran
	mov edx, 1
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, vetor1
	mov edx, 3
	int 80h
	
	mov eax, 3
	mov ebx, 0
	mov ecx, barran
	mov edx, 1
	int 80h

	cld
	mov ecx, 3	
	mov esi, vetor1
	mov edi, vetor1
	
	
for:
	lodsb
	sub al, 48
	stosb
loop for

	cld
	mov ecx, 3
	mov esi, vetor2
	mov edi, vetor2
for2:
	lodsb
	sub al, 48
	stosb
loop for2

    mov eax, 0
	cld
	mov esi, vetor1
	
	lodsb
    mov cl, 100
	mul cl
    mov dx, ax
    
    mov eax, 0    
        
	lodsb
	mov cl, 10
	mul cl
	add dx, ax
	
	mov eax, 0
	lodsb
	add dx, ax
	
	mov [valor1], dx
	
    mov eax, 0
	cld
	mov esi, vetor2
	lodsb
	
	mov ecx, 100
	imul ecx
	mov [valor2], eax
	mov eax, 0
	lodsb
	mov edx, 10
	imul edx
	add eax, [valor2]
	mov [valor2], eax
	mov eax, 0
	lodsb
	add eax, [valor2]
	mov [valor2], eax

	add [valor1], eax	
	mov eax, [valor1]
	
	mov ebx, 1000
    cmp eax, ebx
    jge milzao
    
centenao:	
	cdq
	mov ebx, 10
	idiv ebx
	add edx, 48
    mov ecx, eax
	
	mov edi, vetor3
	add edi, 3
	std	
	
	mov eax, edx
	stosb
	cdq
	mov eax, ecx
	idiv ebx
	add edx, 48
	
	mov ecx, eax
	mov eax, edx
	stosb
		
	mov eax, ecx
	add eax, 48
	stosb
	jmp end
	
	
milzao:
    mov edi, vetor3
    add edi, 3
    std
    
    cdq
    mov ebx, 10
    idiv ebx
    add edx, 48
    mov ecx, eax
    mov eax, edx
    stosb
    
    cdq
    mov eax, ecx
    idiv ebx
    add edx, 48
    mov ecx, eax
    mov eax, edx
    stosb
    
    cdq
    mov eax, ecx
    idiv ebx
    add edx, 48
    mov ecx, eax
    mov eax, edx
    stosb
    
    mov eax, ecx
    add eax, 48
    stosb
    
end:
    mov eax, 4
    mov ebx, 1
    mov ecx, vetor3
    mov edx, 4
    int 80h


    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, nlen
    int 80h


	mov eax, 1
	mov ebx, 0
	int 80h 
