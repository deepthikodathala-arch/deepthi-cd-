%{
#include <stdio.h>
%}

%%
[A-Z]+      { printf("Capital Word: %s\n", yytext); }
[ \t\n]+    ;
.           ;
%%

int main()
{
    printf("Enter the text:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}