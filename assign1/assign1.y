%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <math.h>
	int yylex();
	void yyerror(char *s);
%}

%token NUMBER ID NOTID ASSIGNOP MINUS PLUS STAR DIV MOD POW
%token LP RP
%token END

%left PLUS MINUS
%left STAR DIV
%left MOD
%left NEG 
%right POW

%start Input

%union {
	char *strval;
	int intval;
//	node node_val;
}

%%
Input: 
	| Input Line
;
Line: END
	| Exp END //	{ printf("id = %d\n", $<yylval.intval>1); }
	| Identifier END	//	{ printf("ex = %d\n", $<yylval.intval>1); }
	| Not_Identifier END
;
Exp:	Exp PLUS Term
	| Exp MINUS Term
	| Term
Term:	Term STAR Factor
	| Term DIV Factor
	| Factor
Factor: ID
	| NUMBER
	| LP Exp RP
	| MINUS Factor
Identifier: ID ASSIGNOP Exp
Not_Identifier: NOTID ASSIGNOP Exp// { printf("Wrong Identifier\n"); }
%%
int main()
{
	yyparse();
	return (0);
}
