%{
 #include "1.tab.h"
%}

%%
[0-9]+	return NUMBER;
"-"	return MINUS;
%%
