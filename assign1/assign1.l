%{
	#include <ctype.h>
	#include "assign1.tab.h"
%}

%%
[0-9]*[a-zA-Z_$][a-zA-Z0-9_$]*	{
					yylval->strval = strcpy(yylval, yytext);
					if (isalpha(yytext[0]) || yytext[0] == '_' || yytext[0] == '$')
						return ID;
					else
						return NOTID;
				}
[0-9]+				{
					yylval->intval = atoi(yytext);
					return NUMBER;
				}
"="	return ASSIGNOP;
"-"	return MINUS;
"+"	return PLUS;	
"*"	return STAR;	
"/"	return DIV;	
"^"	return POW;
"%"	return MOD;	
"("	return LP;
")"	return RP;
"\n"	return END;
%%
