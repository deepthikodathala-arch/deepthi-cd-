#include <stdio.h>
#include <string.h>

char input[100];
int pos = 0;

void E();
void Eprime();
void T();
void Tprime();
void F();

void match(char c)
{
    if (input[pos] == c)
        pos++;
    else
    {
        printf("Invalid Expression\n");
        exit(0);
    }
}

void E()
{
    T();
    Eprime();
}

void Eprime()
{
    if (input[pos] == '+')
    {
        match('+');
        T();
        Eprime();
    }
}

void T()
{
    F();
    Tprime();
}

void Tprime()
{
    if (input[pos] == '*')
    {
        match('*');
        F();
        Tprime();
    }
}

void F()
{
    if (input[pos] == 'i' && input[pos + 1] == 'd')
    {
        pos += 2;
    }
    else if (input[pos] == '(')
    {
        match('(');
        E();
        match(')');
    }
    else
    {
        printf("Invalid Expression\n");
        exit(0);
    }
}

int main()
{
    printf("Enter the expression: ");
    scanf("%s", input);

    E();

    if (input[pos] == '$' || input[pos] == '\0')
        printf("Valid Expression\n");
    else
        printf("Invalid Expression\n");

    return 0;
}
