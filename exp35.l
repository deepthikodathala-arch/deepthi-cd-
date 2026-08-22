%{
#include <stdio.h>
%}

%%
^[0-9]$    { printf("It is a Digit\n"); }
.*          { printf("It is Not a Digit\n"); }
%%

int main()
{
    printf("Enter a character: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}