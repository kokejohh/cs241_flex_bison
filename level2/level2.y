%{
	#include <stdio.h>
	#include <math.h>
	int yylex();
	void yyerror(const char *s);
%}

%token	NUMBER PLUS MINUS TIMES DIVIDE POWER
%token	LEFT RIGHT
%token	END

%left	PLUS MINUS
%left	TIMES DIVIDE
%left	NEG
%right	POWER

%start Input

%%
Input:	 { printf("minus "); }	
	| Input Line END { printf("input line "); }
Line:  |NUMBER PLUS NUMBER { printf("end "); }
	| NUMBER { printf("what?"); }
/*	| Input Line { printf("input line \n"); }
Line: 
	 END { printf("end "); }
	| Expression END { printf("Result: %d\n", $1);}
;

Expression:
	NUMBER {$$ = $1;}
	| Expression PLUS Expression { $$=$1+$3; }
	| Expression MINUS Expression { $$=$1-$3; }
	| Expression TIMES Expression { $$=$1*$3; }
	| Expression DIVIDE Expression { $$=$1/$3; }
	
	| MINUS Expression %prec NEG { $$ = -$2; }
	| Expression POWER Expression { $$ = pow($1, $3); }
	| LEFT Expression RIGHT { $$ = $2; }
;
*/
%%

int main() {
	yyparse();
	return (0);
}
