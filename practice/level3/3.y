%{
	#include <stdio.h>
	int yylex();
	void yyerror(char *s);
%}

%token	NUMBER MINUS

%%
s: e	{ printf("%d \n", $1); }
e: NUMBER MINUS NUMBER { $$ = $1 - $3; }
e: NUMBER { $$ = $1; }
%%
int main()
{
	yyparse();
	return (0);
}
