%{
	#include "4.tab.h"
%}

%%
[0-9]+	{
		yylval = atoi(yytext);
		return NUMBER;
	}
"-"	return MINUS;
"="	return ASSIGN;
[a-z]	{
		yylval = yytext[0] - 'a';
		return ID;
	}
"\n"	return END;
%%
