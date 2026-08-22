%{
#include <stdio.h>
#include <string.h>

int max_length = 0;
char longest_word[100];
%}

%%
[a-zA-Z]+ {
    if(strlen(yytext) > max_length)
    {
        max_length = strlen(yytext);
        strcpy(longest_word, yytext);
    }
}

[ \t\n]+ ;
. ;
%%

int main()
{
    printf("Enter the sentence:\n");
    yylex();

    printf("Longest Word : %s\n", longest_word);
    printf("Length       : %d\n", max_length);

    return 0;
}

int yywrap()
{
    return 1;
}