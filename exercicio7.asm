%include "asm_io.inc"

segment .data

segment .bss 

segment .text 
        global  asm_main  
        

fibonacci:
    push ebp
    mov ebp, esp
    mov ebx, [ebp+8]
if:
    cmp ebx, 0
    jne else
    mov edx, 0
    pop ebp
    ret
else:
    cmp ebx, 1
    jne recursao
    mov edx, 1
    pop ebp
    ret
recursao:
    dec ebx ;eax = x -1
    push ebx
    call fibonacci
    pop ebx
    add ecx, edx
    dec ebx ; eax = x-2
    push ebx
    call fibonacci
    pop eax
    add ecx, edx
    pop ebp
    ret
    


asm_main: 
    call read_int   ;eax = inteiro do teclado
    mov ecx, 0
    push eax
    call fibonacci
    mov ecx, eax
    pop eax
    call print_int
    call print_nl
    
    leave                     
    ret
