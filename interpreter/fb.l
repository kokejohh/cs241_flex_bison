%{
#include "fb.tab.h"
%}

%%
[0-9]+	{
		yylval = atoi(yytext);
		return NUMBER;
	}
"+"		return ADD;
"-"		return MINUS;
[a-z]+	{
		yylval = yytext[0];
		return ALPHABET;
	}

%%
