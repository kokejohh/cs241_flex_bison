%{
	#include "6.tab.h"
%}

%%
[0-9]+		{
			yylval = atoi(yytext);
			return NUMBER;
		}
[a-z]		{
			yylval = yytext[0] - 'a';
			return ID;
		}
"+"		return ADD;
"-"		return MINUS;
"="		return ASSIGN;
"\n"		return END;
%%
