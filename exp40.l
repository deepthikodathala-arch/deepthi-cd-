%{
#include <stdio.h>
%}

%%
"int"|"float"|"char"|"double"|"if"|"else"|"for"|"while"|"return"|"void"|"main" {
    printf("KEYWORD        : %s\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("IDENTIFIER     : %s\n", yytext);
}

[0-9]+ {
    printf("NUMBER         : %s\n", yytext);
}

"=="|"!="|"<="|">="|"++"|"--"|"+"|"-"|"*"|"/"|"="|"<"|">" {
    printf("OPERATOR       : %s\n", yytext);
}

"{"|"}"|"("|")"|"["|"]"|";"|"," {
    printf("SPECIAL SYMBOL : %s\n", yytext);
}

[ \t\n]+ ;

. {
    printf("OTHER          : %s\n", yytext);
}
%%

int main()
{
    printf("Enter the C program:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}