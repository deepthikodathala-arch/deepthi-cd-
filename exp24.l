%{
#include <stdio.h>

FILE *out;
int comment_count = 0;
%}

%x COMMENT

%%

"//".*                  {
                            comment_count++;
                         }

"/*"                    {
                            comment_count++;
                            BEGIN(COMMENT);
                         }

<COMMENT>"*/"           {
                            BEGIN(INITIAL);
                         }

<COMMENT>\n             {
                         }

<COMMENT>.              {
                         }

.|\n                    {
                            fputs(yytext, out);
                         }

%%

int main()
{
    yyin = fopen("input.c", "r");
    out = fopen("output.c", "w");

    if (yyin == NULL)
    {
        printf("Cannot open input.c\n");
        return 1;
    }

    if (out == NULL)
    {
        printf("Cannot create output.c\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(out);

    printf("Number of comment lines: %d\n", comment_count);
    printf("Comments eliminated successfully.\n");
    printf("Output written to output.c\n");

    return 0;
}

int yywrap()
{
    return 1;
}