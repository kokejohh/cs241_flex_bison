%{
	#include <stdio.h>
	#define TOTAL_VAR 26
	int v[TOTAL_VAR];
	int yylex();
	void yyerror(char *s);
%}

%token	NUMBER MINUS ASSIGN ID END

%start Input

%%
Input:			{ printf("first\n"); }
	| Input Line
;
Line:	END
	| e END		{ printf("%d \n", $1); }
	| s END		{ printf("correct\n"); }
;
s: ID ASSIGN e { v[$1] = $3; }
e: e MINUS NUMBER { $$ = $1 - $3; }
e: NUMBER { $$ = $1; }
%%
int main()
{
	for (int i = 0; i < TOTAL_VAR; i++)
		printf("%d ", v[i]);
	printf("\n");
	yyparse();
	for (int i = 0; i < TOTAL_VAR; i++)
		printf("%d ", v[i]);
	return (0);
}
