%{
#include <stdio.h>
%}

%%
"+"     { printf("Valid Operator: +\n"); }
"-"     { printf("Valid Operator: -\n"); }
"*"     { printf("Valid Operator: *\n"); }
"/"     { printf("Valid Operator: /\n"); }

[0-9]+  { printf("Number: %s\n", yytext); }

[ \t\n]+ ;

.       { printf("Invalid Operator: %s\n", yytext); }
%%

int main()
{
    printf("Enter an expression:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}