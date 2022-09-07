%{
	#include <stdio.h>
	int yylex();
	void	yyerror(char *s);
%}

%token NUMBER MINUS
%%
e: NUMBER MINUS NUMBER { printf("%d \n", $1 - $3); }
e: NUMBER	{ printf("%d \n", $1); }	
%%
int main() {
	yyparse();
	return (0);
}
