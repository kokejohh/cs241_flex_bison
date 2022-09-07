%{
	#include <stdio.h>
	int yylex();
	void yyerror(char *s);	
%}

%token	NUMBER END

%%

p: p END	{ printf("p end\n"); }
p: s		{ printf("p:s\n"); }
s:		{ $$ = 99; printf("empty\n"); }
s: NUMBER	{ $$ = 55; printf("number\n"); }

%%

int main()
{
	yyparse();
	return (0);
}
