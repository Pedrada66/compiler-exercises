%{
#include <stdio.h>	
#include "sintatico.tab.h" 
%}


%%
program			{return S_PROGRAM;}
"."			{return S_PONTO;}
";"			{return S_PONTOVG;}
begin			{return S_BEGIN;}
end			{return S_END;}
"-->"			{return S_ATRIB;}
"+"			{return S_MAIS;}
"*"			{return S_VEZES;}
"("			{return S_ABREPAR;}
")"			{return S_FECHAPAR;}
[ \t]			/* ignora */
[\n]			/* nada */
[a-z][a-z0-9]*		{return S_ID;}
<<EOF>>			{return 0;}
.			{
			printf("Símbolo [%s] desconhecido.\n",yytext);
			exit(1);
			}

