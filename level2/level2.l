%{
	#include "level2.tab.h"
%}

%%
[0-9]+	{
		yylval = atoi(yytext);
		return NUMBER;
	}
"+"	return PLUS;	
"-"	return MINUS;
"*"	return TIMES;
"/"	return DIVIDE;
"^"	return POWER;
"("	return LEFT;
")"	return RIGHT;
"\n"	return END;
%%
