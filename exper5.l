%{
#include <stdio.h>
int space = 0;
int newline = 0;
%}

%%
" "     { space++; }
\n      { newline++; }
"END"   { 
            printf("\nNumber of spaces: %d\n", space);
            printf("Number of newline characters: %d\n", newline);
            return 0;
        }
.       ;
%%

int main()
{
    printf("Enter text and type END to finish:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}