%include "asm_io.inc"

segment .data
    soma db "Soma: ", 0
    subtracao db "Subtracao: ", 0
    multiplicacao db "Multiplicacao: ", 0
    divisao db "Divisao: ", 0
    resto db "Resto da divisao: ", 0
    x dd 0
    y dd 0
    r_soma dd 0
    r_sub dd 0
    r_mult dd 0
    r_div dd 0
    r_resto dd 0

segment .text 
        global  asm_main
        
asm_main:
        ;ler inteiros
        call read_int   ;eax = inteiro do teclado
        mov [x], eax    ;mover o conteudo de eax para x
        call read_int   ;eax = inteiro do teclado
        mov [y], eax    ;mover o conteudo de eax para y
        
        ;realizar soma
        mov eax, [x]    ;mover conteudo de x para eax
        add eax, [y]    ;eax += conteudo de y
        mov [r_soma], eax   ;mover o conteudo de eax para r_soma
        
        ;realizar subtracao
        mov eax, [x]    ;mover conteudo de x para eax
        sub eax, [y]    ;eax -= conteudo de y
        mov [r_sub], eax    ;mover o conteudo de eax para r_sub
        
        ;realizar multiplicacao
        mov eax,[x]     ;mover o conteudo de x para eax 
        mov ebx, [y]    ;mover o conteudo de y para ebx
        imul ebx        ;eax *= ebx 
        mov [r_mult], eax   ;mover o conteudo de eax para r_mult
        
        ; realizar divisao
        mov eax, [x]    ;mover o conteudo de x para eax
        cdq             ;extender sinal de eax em edx
        mov ebx, [y]    ;mover para ebx o conteudo de y
        idiv ebx        ;edx:eax = eax/ebx
        mov [r_div], eax    ;mover o conteudo de eax (quociente) para r_div    
        mov [r_resto], edx    ;mover o conteudo de edx (resto) para r_res
                
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
        
        ;printar resultado da divisao
        mov eax, divisao
        call print_string
        mov eax,[r_div]
        call print_int
        call print_nl
        
        ;printar resultado do resto da divisao
        mov eax, resto
        call print_string
        mov eax, [r_resto]
        call print_int
        call print_nl
        
        leave                     
        ret 
