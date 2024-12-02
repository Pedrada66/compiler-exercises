%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include "tokens.h"
int numero_da_linha=1;
char lexema[100];

%}
ID		[a-z][a-z0-9]*	
INTEIRO		[0-9][0-9]*


%%
program		{return(SPROGRAM);}
var		{return(SVAR);}
real		{return(SREAL);}
integer		{return(SINTEGER);}
boolean		{return(SBOOLEAN);}
begin		{return(SBEGIN);}
read		{return(SREAD);}
write		{return(SWRITE);}
if		{return(SIF);}
then		{return(STHEN);}
else		{return(SELSE);}
{INTEIRO}	{return(SINTEIRO);}
{ID}		{strcpy(lexema,yytext);
		return(SIDENTIFICADOR);}
":"		{return(SDOISPONTOS);}
";"		{return(SPONTOEVIRGULA);}
"("		{return(SABREPAR);}
")"		{return(SFECHAPAR);}
":="		{return(SATRIBUICAO);}
","		{return(SVIRGULA);}
">"		{return(SMAIORQUE);}
"."		{return(SPONTO);}
"+"		{return(SMAIS);}
"/"		{return(SDIVI);}




[ \t]		/* FAZ NADA */
[\n]		{numero_da_linha++;}
<<EOF>>		{return 0;}
.		{ fprintf(stderr,"\nErro.\n");
		  fprintf(stderr,"Símbolo desconhecido:[%s]\n",yytext);
		  fprintf(stderr,"LINHA--->%d\n\n",numero_da_linha);
		  //exit(1);
		}
%%
		

