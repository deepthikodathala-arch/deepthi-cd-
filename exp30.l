%{
#include <stdio.h>
int consonants = 0;
%}

%%
[a-zA-Z] {
    if (yytext[0]=='b'||yytext[0]=='c'||yytext[0]=='d'||yytext[0]=='f'||
        yytext[0]=='g'||yytext[0]=='h'||yytext[0]=='j'||yytext[0]=='k'||
        yytext[0]=='l'||yytext[0]=='m'||yytext[0]=='n'||yytext[0]=='p'||
        yytext[0]=='q'||yytext[0]=='r'||yytext[0]=='s'||yytext[0]=='t'||
        yytext[0]=='v'||yytext[0]=='w'||yytext[0]=='x'||yytext[0]=='y'||
        yytext[0]=='z'||
        yytext[0]=='B'||yytext[0]=='C'||yytext[0]=='D'||yytext[0]=='F'||
        yytext[0]=='G'||yytext[0]=='H'||yytext[0]=='J'||yytext[0]=='K'||
        yytext[0]=='L'||yytext[0]=='M'||yytext[0]=='N'||yytext[0]=='P'||
        yytext[0]=='Q'||yytext[0]=='R'||yytext[0]=='S'||yytext[0]=='T'||
        yytext[0]=='V'||yytext[0]=='W'||yytext[0]=='X'||yytext[0]=='Y'||
        yytext[0]=='Z')
        consonants++;
}

. ;
%%

int main()
{
    printf("Enter the sentence:\n");
    yylex();
    printf("Number of consonants = %d\n", consonants);
    return 0;
}

int yywrap()
{
    return 1;
}