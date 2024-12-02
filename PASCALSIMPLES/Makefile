all: gera compila teste
gera:
	bison -d sintatico.y
	flex -i -o lexico.c lexico.l
	bison sintatico.y

compila:
	gcc sintatico.tab.c -o sintatico.exe

teste:
	./sintatico.exe < programa1.pas

