%{
	#include "5.tab.h"
%}

%%
[a-z]	{
		yylval = yytext[0] - 'a';
		return ID;
	}
[0-9]+	{
		yylval = atoi(yytext);
		return NUMBER;
	}
"-"	return MINUS;
"="	return ASSIGN;
"\n"	return END;
%%
