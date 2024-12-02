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
int	{return(SINTEGER);}
float	{return(SFLOAT);}
char		{return(SCHAR);}
double		{return(SDOUBLE);}
short		{return(SSHORT);}
long		{return(SLONG);}
unsigned		{return(SUNSIGNED);}
signed		{return(SSIGNED);}
struct  	{return(SSTRUCT);}
union		{return(SUNION);}
enum		{return(SENUM);}
void		{return(SVOID);}
auto		{return(SAUTO);}
break		{return(SBREAK);}
const		{return(SCONST);}
continue		{return(SCONTINUE);}
default		{return(SDEFAULT);}
do		{return(SDO);}
extern		{return(SEXTERN);}
for		{return(SFOR);}
goto		{return(SGOTO);}
inline		{return(SINLINE);}
register		{return(SREGISTER);}
restrict		{return(SRESTRICT);}
return		{return(SRETURN);}
sizeof		{return(SSIZEOF);}
static		{return(SSTATIC);}
switch		{return(SSWITCH);}
typedef		{return(STYPEDEF);}
volatile		{return(SVOLATILE);}
while		{return(SWHILE);}
if		{return(SIF);}
else		{return(SELSE);}
{INTEIRO}	{return(SINTEIRO);}
{ID}		{strcpy(lexema,yytext);
		return(SIDENTIFICADOR);}
":"		{return(SDOISPONTOS);}
";"		{return(SPONTOEVIRGULA);}
"("		{return(SABREPAR);}
")"		{return(SFECHAPAR);}
"{"		{return(SABRECHAVES);}
"}"		{return(SFECHACHAVES);}
"["		{return(SABRECOLCHETES);}
"]"		{return(SFECHACOLCHETES);}
"+="		{return(SATRIBUICAO);}
"-="		{return(SDECREMENTACAO);}
","		{return(SVIRGULA);}
">"		{return(SMAIORQUE);}
"<"		{return(SMENORQUE);}
">="		{return(SMAIORIGUAL);}
"<="		{return(SMENORIGUAL);}
"."		{return(SPONTO);}
"+"		{return(SMAIS);}
"-"		{return(SMENOS);}
"*"		{return(SMULTIPLICACAO);}
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
		

