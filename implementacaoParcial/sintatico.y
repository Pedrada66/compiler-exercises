%{
#include <stdio.h>
#include "lexico.c"
void yyerror(const char *msg);
%}

/*------------------------------------------------
 | Simbolos terminais da linguagem Pascal Simples 
 +------------------------------------------------*/

%start programa
%expect 1

%token 	S_ID
%token	S_NUMERO
%token  S_PROGRAM
%token 	S_PONTO
%token	S_PONTOVG
%token  S_VIRGULA
%token  S_DOISPONTOS
%token	S_BEGIN
%token	S_END
%token 	S_VAR
%token	S_IF
%token	S_THEN
%token	S_ELSE
%token	S_REPEAT
%token	S_UNTIL
%token	S_WHILE
%token	S_DO
%token	S_ATRIB
%token	S_MAIS
%token 	S_MENOS
%token	S_VEZES
%token 	S_DIVI
%token	S_MAIORQUE
%token	S_MENORQUE
%token	S_IGUAL
%token	S_AND
%token	S_OR
%token	S_ABREPAR
%token 	S_FECHAPAR

%%
/*--------------------------------------------------
 | produções sintáticas da linguagem Pascal Simples
 +--------------------------------------------------*/

programa:
	S_PROGRAM S_ID S_PONTOVG S_VAR variaveis corpo S_PONTO
;


variaveis:
	variaveis  listaDeIdentificadores S_DOISPONTOS S_ID  S_PONTOVG
	| listaDeIdentificadores S_DOISPONTOS S_ID S_PONTOVG 
;

listaDeIdentificadores: 
	listaDeIdentificadores S_VIRGULA S_ID 
	| S_ID
;

corpo: 
	S_BEGIN seq_comandos S_END
;

seq_comandos:
	seq_comandos S_PONTOVG comando 
	|comando
;
comando:
	atribuicao
	|instIF 
	|instWhile
	|instRepeat
	| /* vazio */
;
atribuicao:
	S_ID S_ATRIB expressaoL  
;

instIF:
	S_IF expressaoL S_THEN comando alternativa
;

alternativa:
	/*vazio*/	
	|S_ELSE comando
;

/* Modifique aqui */
instRepeat:
      S_REPEAT seq_comandos S_UNTIL expressaoL
;
instWhile:
	S_WHILE expressaoL S_DO comando
;
expressaoL: 
	expressaoL S_OR expressaoL
    	| expressaoL S_AND expressaoL
	expressaoR
;

expressaoR:
	expressaoR S_MAIORQUE expressao 
	| expressao S_MENORQUE expressao
    	| expressao S_IGUAL expressao
	| expressao
;
	

expressao: 
	expressao S_MAIS termo 
	| expressao S_MENOS termo 
	| termo; 
;

termo:
	termo S_VEZES fator 
	| termo S_DIVI fator 
	| fator
;

fator: 
	S_ABREPAR expressaoL S_FECHAPAR
	| S_ID 
	| S_NUMERO 
;
	

%%


void yyerror(const char *msg){
	printf("Erro sintático na linha [%d]\n",nlinha);
}

int main(int argc, char **argv){
	
	//Abre o arquivo argv[1] para leitura
	yyin = fopen(argv[1],"r");
	
          printf("RODANDO COMPILADOR PASCAL SIMPLIFICADO...\n\n\n");
	if( !yyparse() ){
		printf("Compilação terminada.\nPrograma correto.\n\n");
	}
	else{
		printf("Erro de compilação\n");

	}
	fclose(yyin);
}


























