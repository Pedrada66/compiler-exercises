%{
#include <stdio.h>
#include "lexico.c"
void yyerror(const char *msg);
int yywrap();
%}

/*------------------------------------------------
 | Simbolos terminais da linguagem Pascal Simples 
 +------------------------------------------------*/

%start programa

%token 	S_ID
%token  S_PROGRAM
%token 	S_PONTO
%token	S_PONTOVG
%token	S_BEGIN
%token	S_END
%token	S_ATRIB
%token	S_MAIS
%token	S_VEZES
%token	S_ABREPAR
%token 	S_FECHAPAR

%%
/*--------------------------------------------------
 | produções sintáticas da linguagem Pascal Simples
 +--------------------------------------------------*/

programa
	:S_PROGRAM S_ID S_PONTOVG bloco S_PONTO
;
bloco
	:corpo
;
corpo
	: S_BEGIN seq_comandos S_END
	;

seq_comandos
	:seq_comandos S_PONTOVG comando 
	|comando
;
comando
	:atribuicao
;

atribuicao
	:expressao S_ATRIB S_ID
	;

expressao
	: expressao S_MAIS termo {printf("SOMA\n");}
	| termo
	;
termo:
	termo S_VEZES S_ID {printf("MULT\n");}
	| S_ID
;


%%
int yywrap(){return 1;}

void yyerror(const char *msg){
	printf("Erro sintatico\n");
}

int main(){
	if( !yyparse() ){
		printf("Compilação terminada. Programa correto.\n");
	}
	else{
		printf("Erro de compilação\n");
	}
}



























