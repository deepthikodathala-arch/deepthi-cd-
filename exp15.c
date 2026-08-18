%{
#include <stdio.h>

int characters = 0;
int words = 0;
int lines = 0;
%}

%%
\n              { lines++; characters++; }
[ \t]+          { characters += yyleng; }
[^ \t\n]+       { words++; characters += yyleng; }
%%

int main()
{
    FILE *fp;

    fp = fopen("input.txt", "r");

    if (fp == NULL)
    {
        printf("File cannot be opened.\n");
        return 1;
    }

    yyin = fp;
    yylex();

    fclose(fp);

    printf("\nNumber of characters: %d\n", characters);
    printf("Number of words: %d\n", words);
    printf("Number of lines: %d\n", lines);

    return 0;
}

int yywrap()
{
    return 1;
}
