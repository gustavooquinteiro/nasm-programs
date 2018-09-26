%include "asm_io.inc"

segment .data
    x dd 0
    cont db 0

segment .text 
        global  asm_main
        
asm_main:

    mov ecx, 8
    mov edx, 0
lp:
    call read_char
    sub al, 48
    movzx ebx, al
    shl ebx,cl
    add edx, ebx
    mov eax, edx
        
    loop lp
    shr eax, 1
    call print_int
    call print_nl 

    leave 
    ret
    
    
