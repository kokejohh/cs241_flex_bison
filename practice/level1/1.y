%{
	#include <stdio.h>
	int yylex();
	void yyerror(char *s);
%}

%token	NUMBER MINUS
%%
e : NUMBER MINUS NUMBER		{ printf("N - N\n"); }
e : NUMBER			{ printf("N\n"); }
%%
int main() {
	yyparse();
	return 0;
}
