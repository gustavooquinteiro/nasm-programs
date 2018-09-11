%include "asm_io.inc"

segment .data
    x dd 0
    y dd 0
    r_soma dd 0
    r_sub dd 0
    r_mult dd 0
    r_div dd 0
    r_res dd 0
    soma db "Soma: ", 0
    subtracao db "Subtracao: ", 0
    multiplicacao db "Multiplicacao: ", 0
    divisao db "Divisao: ", 0
    resto db "Resto da divisao: ", 0

segment .bss 

segment .text 
        global  asm_main
        
        
asm_main:
        
        ;ler inteiros
        call read_int   ;eax = inteiro do teclado
        mov [x], eax
        call read_int
        mov [y], eax
        
        ;realizar soma
        mov eax, [x]
        add eax, [y]
        mov [r_soma], eax
        
        ;realizar subtracao
        mov eax, [x]
        sub eax, [y]
        mov [r_sub], eax
        
        ;realizar multiplicacao
        mov eax,[x]
        mov ebx, [y]
        imul ebx
        mov [r_mult], eax
        
        ; realizar divisao
        mov eax, [x]
        cdq
        mov ebx, [y]
        idiv ebx
        mov [r_div], eax
        mov [r_res], edx
        
        
        ;printar resultado da soma
        mov eax, soma
        call print_string
        mov eax, [r_soma]
        call print_int
        call print_nl
        
        ;printar resultado da subtracao
        mov eax, subtracao
        call print_string
        mov eax,[r_sub]
        call print_int
        call print_nl
        
        ;printar resultado da multiplicacao
        mov eax, multiplicacao
        call print_string
        mov eax,[r_mult]
        call print_int
        call print_nl
        
        ;printar resultado da divisao e resto
        mov eax, divisao
        call print_string
        mov eax,[r_div]
        call print_int
        call print_nl
        
        mov eax, resto
        call print_string
        mov eax, [r_res]
        call print_int
        call print_nl
        
        leave                     
        ret 
