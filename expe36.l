%{
#include <stdio.h>
%}

%%
[0-9]+[ ]*"+"[ ]*[0-9]+    { printf("Addition Operation\n"); }
[0-9]+[ ]*"-"[ ]*[0-9]+    { printf("Subtraction Operation\n"); }
[0-9]+[ ]*"*"[ ]*[0-9]+    { printf("Multiplication Operation\n"); }
[0-9]+[ ]*"/"[ ]*[0-9]+    { printf("Division Operation\n"); }
[ \t\n]+                    ;
.                           { printf("Invalid Operation\n"); }
%%

int main()
{
    printf("Enter a mathematical expression: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}