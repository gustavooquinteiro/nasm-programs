%include "asm_io.inc"

segment .data
    primo db "Primo", 0
    notprimo db "Não é primo", 0
    x dd 0
    cont db 0

segment .text 
        global  asm_main
        
asm_main:

    call read_int   ;eax = inteiro do teclado
    mov [x], eax    ;x = eax
    cmp eax, 0      ;eax - 0
    je nprimo       ;if (eax == 0) nprimo
    cmp eax,1       ;eax - 1
    je nprimo       ;if (eax == 1) nprimo
    mov ecx, [x]    ;ecx = x
    mov ebx, [cont] ;ebx = cont
    jmp forloop     ;for

;imprime "Não é primo" e sai    
nprimo:
    mov eax, notprimo  
    call print_string
    call print_nl
    leave
    ret
    
;for loop de x ate 0
forloop:
    mov eax, [x]    ;eax = x
    cdq             ;extender sinal
    idiv ecx        ;divisao de edx:eax = eax/ecx
    cmp edx, 0      ;edx - 0
    jne until       ;if (edx != 0) until
    inc ebx         ;ebx++
    cmp ebx, 2      ;ebx - 2
    jg nprimo       ;if (ebx > 2) nprimo
    
until:
    loop forloop        ;for(ecx=x; ecx>0; ecx--) forloop
    
    ;imprime "Primo" e sai
    mov eax, primo      
    call print_string
    call print_nl
    leave 
    ret
