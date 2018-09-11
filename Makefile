
EXE = exercicio1.asm
OBJ = driver.c asm_io.o 
OBJ_EXE = $(subst .asm,.o, $(EXE))
PROJ_NAME = Exercicio

all:
	nasm -f elf32 $(EXE)
	gcc -m32 -o $(PROJ_NAME) $(OBJ) $(OBJ_EXE) 
	
clean:
	rm -rf $(PROJ_NAME) $(OBJ_EXE)
