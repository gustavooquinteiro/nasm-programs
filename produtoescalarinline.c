#include <stdio.h>
#include <stdlib.h>
#include <time.h>


float produtoEscalar(float * a, float * b, int n){
    float answer = 0.0;
    register int i;
    
    for (i =0; i <n; i++)
        answer += a[i]*b[i];
    
    return answer;
    
}

float produtoEscalarAsmInline(float* a, float* b, int n){
    float result = 0;
    register int i =n;
    asm(   
            "movl %3, %%ecx;"
            "dec %%ecx;"
            "movl %1, %%eax;"
            "movl %2, %%ebx;"
            "finit;"
        "for: "
            "fld (%%eax, %%ecx, 4);"
            "fld (%%ebx, %%ecx, 4);"
            "fmulp;"
            "fld %0;"
            "faddp;"
            "fstp %0;"
            "loop for;"
        :"=m"(result)
        :"g"(a), "g"(b), "g"(i)
        );

    return(result);
}


int main(){
    register int y =0;
    for (y; y < 9999999; y++){
        int n = 100;
        float a[n], b[n];
    
        register int i = 0;
        
        float seed = (rand()/(float)RAND_MAX);
        
        // Geração de vetor com numeros aleatórios
        for (i; i < n; i++){
            a[i] = ((float)rand()/(float)RAND_MAX) * seed;
            b[i]= ((float)rand()/(float)RAND_MAX) * seed;
        }
                
        produtoEscalarAsmInline(a, b, n);
        //produtoEscalar(a, b, n);
    }
    
    
    
} 
