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

float produtoEscalarAsmInline(float * a, float * b, int n){
    float answer = 0.0;
    asm(    
            "finit;"
            "FOR:"
            "fldl (%%eax, %%ecx, 4);"
            "fldl (%%ebx, %%ecx, 4);"
            "fmul %%ST(1), %%ST;"
            "fldl (%0);"
            "fadd %%ST(2), %%ST;"
            "fstp (%0);"
            "inc %%ecx;"
            "cmpl    %%ecx, %%edx;"
            "jl FOR;"   
        :"=r"(answer)
        :"c"(0), "b"(a), "a"(b), "d"(n)
        :
    );    
    return answer;
    
}


int main(){
    register int y =0;
    for (y; y < 99999; y++){
        int n = 10;
        //scanf("%d", &n);
        float a[n], b[n];
        
        srand((unsigned int)time(NULL));
        register int i = 0;
        
        float seed = (rand()/(float)RAND_MAX);
        
        for (i; i < n; i++){
            a[i] = ((float)rand()/(float)RAND_MAX) * seed;
            b[i]= ((float)rand()/(float)RAND_MAX) * seed;
        }
        /*printf("VETOR A: ");
        for (i=0; i < n; i++)
            printf("%f ", a[i]);
        printf("\n");
        
        printf("VETOR B: ");
        for (i=0; i < n; i++)
            printf("%f ", b[i]);
        printf("\n");*/
        
        printf("PRODUTO ESCALAR ENTRE A E B = %f\n", produtoEscalar(a, b, n));  
        printf("PRODUTO ESCALAR ENTRE A E B = %f\n", produtoEscalarAsmInline(a, b, n));  
    }
} 
