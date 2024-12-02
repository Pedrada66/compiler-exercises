#include "lexico-pascal-v0.c"


int main(int argc, char **argv){
	if(argc < 2){
		printf("Uso:\n./compilador <arquivo.pas>\n");
		exit(0);
	}
	//else... continua
	

	yyin = fopen(argv[1],"r");
	
	int token = yylex();
	while(token != 0){
		if(token == 16) printf("<%s>",lexema);
		printf("[%d]",token);
		token = yylex();
	}
	printf("\n");
	
	fclose(yyin);
	
	
	
}
