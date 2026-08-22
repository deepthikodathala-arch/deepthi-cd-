%{
#include <stdio.h>
#include <string.h>

char search_word[50];
int count = 0;
%}

%%
[a-zA-Z]+ {
    if(strcmp(yytext, search_word) == 0)
        count++;
}

[ \t\n]+ ;
. ;
%%

int main()
{
    printf("Enter the word to search: ");
    scanf("%s", search_word);

    printf("Enter the sentence:\n");
    getchar();

    yylex();

    printf("Frequency of '%s' = %d\n", search_word, count);

    return 0;
}

int yywrap()
{
    return 1;
}