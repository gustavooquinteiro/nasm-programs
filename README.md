# nasm-programs
Programas em NASM Assembly, de acordo a matéria MATA49 - Programação de Software Básico, ministrada por Leandro Andrade
> OBS: assumo que os arquivos Assembly serão colocados dentro da [biblioteca para facilitar entrada e saida de dados](https://disciplinas.dcc.ufba.br/pub/MATA49/InstalacaoLinux32Bits/linux-ex.zip)  
Comando para compilar: ``` nasm -f elf32 arquivo.asm && gcc -m32 -o executavel arquivo.o driver.c asm_io.o && ./executavel ``` Substitua ``` arquivo ``` pelo nome do arquivo a ser compilado e ``` executavel ``` pelo nome do executável a ser criado

## Exercicios
1. [Calculadora simples](../master/exercicio1.asm) 
* Intuito: Treinar as 4 operações aritméticas (adição, subtração, multiplicação e divisão)
        
2. [Identificador de primos](../master/exercicio2.asm)
* Intuito: Treinar saltos condicionais e loops ao identificar se um numero é primo ou não

3. [Conversor binário para decimal](../master/exercicio3.asm)
* Intuito: Treinar deslocamentos e operações bitwise na conversão de um número binário em um número decimal

4. [Interseção de vetores](../master/exercicio4.asm)
* Intuito: Treinar operações com vetores na comparação entre seus elementos na busca de sua interseção, ou seja, mostrar os elementos presentes em ambos os vetores

5. [Criptografia de Júlio César](../master/exercicio5.asm)
* Intuito: Treinar operações com vetores, utilizando os registradores edi e esi, na criptografia de uma mensagem de 10 letras. [Descritivo](https://www.moodle.ufba.br/pluginfile.php/630179/mod_resource/content/1/exercicio_vetores.pdf)

6. [Inversão de palavras](../master/exercicio6.asm)
* Intuito: Treinar operações com a região da memória central comandada pela CPU, a pilha, ao fazer a inversão de cada palavra de uma frase 

7. [Fibonacci recursivo](../master/exercicio7.asm)
* Intuito: Treinar operações com a pilha, comandada pela CPU, em chamadas de funções recursivas para calcular o i-ésimo número de Fibonacci

> OBS: A partir daqui serão utilizadas as interrupções do sistema Linux, então **não** será mais necessária a utilização da [biblioteca para facilitar entrada e saida de dados](https://disciplinas.dcc.ufba.br/pub/MATA49/InstalacaoLinux32Bits/linux-ex.zip) e os comandos para compilar o aquivo agora são: `nasm -f elf32 arquivo.asm && ld -m elf_i386 -s -o executavel arquivo.o && ./executavel` Substitua `arquivo` pelo nome do arquivo a ser compilado e `executavel` pelo nome do executável a ser criado

8. [Soma de dois números](../master/exercicio8.asm)
* Intuito: Treinar interrupções do sistema Linux para realizar a leitura de dois números e a escrita de sua soma 
