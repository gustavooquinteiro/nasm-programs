%include "asm_io.inc"

segment .data

segment .bss ;variaveis nao inicializadas
	vetor resb 10

segment .text ;codigo do programa
        global  asm_main  
        
        
asm_main: 
    call read_int
	mov ebx, eax
	mov ecx, 10
	mov edi, vetor
    cld
	call read_char
lp:
	call read_char
	add al, bl
	cmp al, 90
	jg fudeu
	jmp end
fudeu:
	sub al, 26
end:
    stosb
	loop lp
	
	mov ecx, 10
	mov esi, vetor
    cld
lp2:
	lodsb
	call print_char
    loop lp2
	call print_nl
	 
    leave                     
    ret
