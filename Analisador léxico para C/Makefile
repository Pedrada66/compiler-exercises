# *---------------------------------------------------
# * Analisador lexico PASCAL simplificado
# * 
# * Exemplos de arquivo Makefile para Linux
# *
# * Autor: Fabio Fernandes da Rocha Vicente
# *---------------------------------------------------

all:  rodaflex  compila executa

rodaflex:
	flex -i -o lexico-pascal-v0.c lexico-pascal-v0.y
	

compila:
	gcc compilador.c -o compilador
	
executa:
	./compilador programa1.pas 
	
apaga:
	rm -f lexico-pascal-v0.c
	rm -f compilador
	clear
	ls -l
	

