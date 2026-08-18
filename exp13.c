#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char input[100];
int pos = 0;

void E();
void Eprime();
void T();
void Tprime();
void F();

void error()
{
    printf("Invalid String\n");
    exit(0);
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
        pos++;
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
        pos++;
        F();
        Tprime();
    }
}

void F()
{
    if (strncmp(&input[pos], "id", 2) == 0)
    {
        pos += 2;
    }
    else if (input[pos] == '(')
    {
        pos++;
        E();

        if (input[pos] == ')')
            pos++;
        else
            error();
    }
    else
    {
        error();
    }
}

int main()
{
    printf("Enter the input string: ");
    scanf("%s", input);

    E();

    if (input[pos] == '\0')
        printf("Valid String\n");
    else
        printf("Invalid String\n");

    return 0;
}
