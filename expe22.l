%{
#include <stdio.h>
%}

%%
"<"[^>]*">"    { printf("HTML Tag: %s\n", yytext); }
[^\n]+         ;
\n             ;
%%

int main()
{
    printf("Enter HTML code:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}