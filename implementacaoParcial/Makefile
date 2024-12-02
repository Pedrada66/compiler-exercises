all: gera compila testa
gera:
	@echo
	@echo '**** GERANDO COMPILADOR - FLEX & BISON ****'
	@echo
	bison -d sintatico.y
	flex -i -o lexico.c lexico.y
	bison sintatico.y 
	

compila:
	@echo
	@echo '*** COMPILANDO ***'
	@echo
	gcc sintatico.tab.c -o pascal.exe
	

testa:
	@echo
	@echo '*** TESTANDO: programa 1 ***'
	@echo
	./pascal.exe prog1.pas
	@echo
	@echo '*** TESTANDO: programa 2 ***'
	@echo
	./pascal.exe prog2.pas
	@echo
	@echo '*** TESTANDO: programa 3 ***'
	@echo
	./pascal.exe prog3.pas

apaga:    
	rm -f sintatico.tab.h
	rm -f lexico.c
	rm -f sintatico.tab.c
	rm -f pascal.exe
	clear
	ls -l
                
