%{
	#include "3.tab.h"
%}

%%
[0-9]+	{
		yylval = atoi(yytext);
		return NUMBER;
	}
"-"	return MINUS;
%%
