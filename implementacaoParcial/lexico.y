%option noyywrap

%{
#include <stdio.h>	
#include "sintatico.tab.h" 
int nlinha=1;
%}

IDENTIFICADOR	[a-z][a-z0-9_]*
NUMEROINTEIRO	[0-9]+

%%
program			{return S_PROGRAM;}
begin			{return S_BEGIN;}
end			{return S_END;}
var			{return S_VAR;}
if			{return S_IF;}
then			{return S_THEN;}
else			{return S_ELSE;}
"."			{return S_PONTO;}
";"			{return S_PONTOVG;}
","			{return S_VIRGULA;}
":"			{return S_DOISPONTOS;}
":="			{return S_ATRIB;}
"+"			{return S_MAIS;}
"-"			{return S_MENOS;}
"*"			{return S_VEZES;}
"/"			{return S_DIVI;}
">"			{return S_MAIORQUE;}
"("			{return S_ABREPAR;}
")"			{return S_FECHAPAR;}
[ \t]			/* ignora */
[\n]			{nlinha++;}
{IDENTIFICADOR}		{return S_ID;}
{NUMEROINTEIRO}		{return S_NUMERO;}
<<EOF>>			{return 0;}
.			{
			printf("Símbolo [%s] desconhecido.\n",yytext);
			printf("Linha: %d\n",nlinha);
			//return(1);
			exit(1);
			}

