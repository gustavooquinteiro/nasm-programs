%include "asm_io.inc"

segment .data

segment .bss 

segment .text 
        global  asm_main  
        
        
asm_main: 
    mov ecx, 30     ; ecx = 30 (tamanho máximo da entrada)
    mov ebx, 0      ; ebx = 0  (tamanho da pilha)
for:
    call read_char  ; eax = char do teclado
    cmp al, '.'
    je lastdump     ; if (al == '.') lastdump
    cmp al, ' ' 
    je dump         ; if (al == ' ') dump
    inc ebx         ; ebx++
    push eax        ; if (al != ' ' && al != '.') topo da pilha = eax
    jmp endfor      
dump:
    pop eax         ; eax = topo da pilha
    call print_char ; imprime eax
    dec ebx         ; ebx--
    cmp ebx, 0      
    jne dump        ; if (ebx != 0) dump (while(!pilha.empty()))
    mov eax, ' '
    call print_char
endfor:
    loop for        ; ecx--
    
lastdump:
    pop eax         ; eax = topo da pilha
    call print_char ; imprime eax
    dec ebx         ; ebx--
    cmp ebx, 0      
    jne lastdump    ; if (ebx != 0) lastdump (while(!pilha.empty()))

    call print_nl
        
    leave                     
    ret
        















