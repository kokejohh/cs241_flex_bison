%{
	#include <stdio.h>
	#define TOTAL_VAR 26
	int v[TOTAL_VAR];
	int yylex();
	void yyerror(char *s);
%}

%token	NUMBER ID ADD MINUS ASSIGN END

%%

p: p END s 	{ printf("start symbol\n"); }
p: s		{ printf("p = s\n"); }
s:		{ printf("empty\n"); }
s: ID ASSIGN e	{ v[$1] = $3; }
e: e MINUS f { $$ = $1 - $3; }
e: f	{ $$ = $1; }
f: NUMBER { $$ = $1; }
f: ID { $$ = v[$1]; }

%%
int main()
{
	for (int i = 0; i < TOTAL_VAR; i++)
		v[i] = 0;
	yyparse();
	for (int i = 0; i < TOTAL_VAR; i++)
		printf("%d ", v[i]);
	return (0);
}
