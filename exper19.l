%{
#include <stdio.h>

int characters = 0;
int lines = 0;
int words = 0;
%}

%%

[ \t]+              ;                  /* Ignore spaces and tabs */

\n                  { lines++; }

"//".*              ;                  /* Ignore single-line comments */

"/*"([^*]|\*+[^*/])*\*+"/"   ;         /* Ignore multi-line comments */

[a-zA-Z_][a-zA-Z0-9_]* {
                        words++;
                        characters += yyleng;
                     }

[0-9]+              {
                        words++;
                        characters += yyleng;
                     }

.                   {
                        characters++;
                     }

%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("sample19.c", "r");

    if (yyin == NULL)
    {
        printf("Cannot open sample.c\n");
        return 1;
    }

    yylex();

    printf("\nNumber of Characters = %d", characters);
    printf("\nNumber of Lines      = %d", lines);
    printf("\nNumber of Words      = %d\n", words);

    fclose(yyin);

    return 0;
}