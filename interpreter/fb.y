%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token NUMBER ADD MINUS ALPHABET

%%

e : NUMBER ADD NUMBER	{ printf("%d \n", $1 + $3); }
e : NUMBER ADD NUMBER ADD NUMBER { printf("%d \n", $1 + $3 + $5); }; 
e : NUMBER MINUS NUMBER { printf("%d \n", $1 - $3); }
e : ALPHABET ADD	{ printf("alpha and add \n"); }
e : ALPHABET		{ printf("|%d| \n", $1); }
e : ADD			{ printf("plus \n"); }
e : NUMBER		{ printf("%d \n", $1); }

%%

int main() {
	yyparse();
	return (0);
}
