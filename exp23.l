%{
#include <stdio.h>
int line = 1;
%}

%%

\n      {
            printf("\n");
            line++;
          }

.*      {
            printf("%d  %s", line, yytext);
          }

%%

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}