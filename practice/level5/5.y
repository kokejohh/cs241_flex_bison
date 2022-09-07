%{
	#include <stdio.h>
	#define TOTAL_VALUE 26
	int v[TOTAL_VALUE];
	int yylex();
	void yyerror(char *s);
%}

%token NUMBER MINUS ASSIGN ID END

%%
p : p END s		{ printf("input\n"); }
p : s			{ printf("p:s\n"); }
s : NUMBER		{ printf("s(empty)\n"); }
s : ID ASSIGN e		{ v[$1] = $3; }
e : e MINUS NUMBER	{ $$ = $1 - $3; }
e : NUMBER		{ $$ = $1; }
%%
int main()
{
	for (int i = 0; i < TOTAL_VALUE; i++)
		v[i] = 0;
	yyparse();
	for (int i = 0; i < TOTAL_VALUE; i++)
		printf("%d ", v[i]);
	return (0);
}
