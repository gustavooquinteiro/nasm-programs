%include "asm_io.inc"

segment .data
	espaco db " ",0
	index dd 0
	value dd 0
	shift dd 0

segment .bss ;variaveis nao inicializada
	arr resd 10
	arr1 resd 10



segment .text ;codigo do programa
        global  asm_main  
        
        
asm_main: 

	mov ecx, 10
	mov edx, 0

for:
	call read_int   ;eax = inteiro do teclado
	mov [arr+edx], eax
	add edx, 4
	loop for

	mov ecx, 10
	mov edx, 0

for2:
	call read_int   ;eax = inteiro do teclado
	mov [arr1+edx], eax
	add edx, 4
	loop for2

	mov ecx, 10
	mov edx, 0
	
;comparação entre os vetores
outterfor:
	mov eax, [arr1+edx]
	mov [index], ecx
	mov [shift], edx
	mov edx, 0
	mov ecx, 10
innerfor:
	cmp eax, [arr+edx]
	jne nextinner ;senao for igual compare com o proximo elemento de arr 
	jmp print ;se for printa o elemento
nextinner:
    add edx, 4
	loop innerfor
nextoutter:
    mov ecx, [index]
	mov edx, [shift]
	add edx, 4
	loop outterfor
	jmp end ;finaliza o programa
print:
    call print_int
	mov eax, espaco
	call print_string
    jmp nextoutter ;vai pra proxima iteração de arr1 no outterfor
    
end:
    call print_nl
    leave                     
    ret
        





