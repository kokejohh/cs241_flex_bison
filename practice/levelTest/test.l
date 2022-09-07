%{
	#include "test.tab.h"
%}
%%

[0-9]+	{
		return NUMBER;
	}
"\n"	{
		printf("|newline|");
		return END;
	}

%%
