%{
#include <stdio.h>
#include <string.h>

char old_word[50];
char new_word[50];
FILE *out;
%}

%%
[a-zA-Z]+ {
    if(strcmp(yytext, old_word) == 0)
        fprintf(out, "%s", new_word);
    else
        fprintf(out, "%s", yytext);
}

[ \t\n]+ {
    fprintf(out, "%s", yytext);
}

. {
    fprintf(out, "%s", yytext);
}
%%

int main()
{
    FILE *fp;

    printf("Enter word to replace: ");
    scanf("%s", old_word);

    printf("Enter new word: ");
    scanf("%s", new_word);

    fp = fopen("input.txt", "r");
    out = fopen("output.txt", "w");

    if(fp == NULL)
    {
        printf("Cannot open input.txt\n");
        return 1;
    }

    if(out == NULL)
    {
        printf("Cannot create output.txt\n");
        fclose(fp);
        return 1;
    }

    yyin = fp;
    yylex();

    fclose(fp);
    fclose(out);

    printf("Word replaced successfully.\n");
    printf("Result saved in output.txt\n");

    return 0;
}

int yywrap()
{
    return 1;
}