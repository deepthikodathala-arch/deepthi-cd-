%{
#include <stdio.h>
%}

%%
^(http|https):\/\/[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ {
    printf("Valid URL\n");
}

.* {
    printf("Invalid URL\n");
}
%%

int main()
{
    printf("Enter the URL: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}