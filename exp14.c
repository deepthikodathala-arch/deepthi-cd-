#include <stdio.h>
#include <string.h>
#include <ctype.h>

char expression[100];
char stack[100];
int top = -1;
int temp = 1;

int precedence(char c)
{
    if (c == '+' || c == '-')
        return 1;
    if (c == '*' || c == '/')
        return 2;
    return 0;
}

void generateTAC()
{
    int i;
    char op1, op2, op;
    char tempName[10];

    for (i = 0; expression[i] != '\0'; i++)
    {
        if (isalnum(expression[i]))
        {
            stack[++top] = expression[i];
        }
        else if (expression[i] == '+' || expression[i] == '-' ||
                 expression[i] == '*' || expression[i] == '/')
        {
            op = expression[i];

            op2 = stack[top--];
            op1 = stack[top--];

            printf("t%d = %c %c %c\n", temp, op1, op, op2);

            sprintf(tempName, "t%d", temp);
            stack[++top] = tempName[1];
            temp++;
        }
    }
}

int main()
{
    printf("Enter the expression: ");
    scanf("%s", expression);

    printf("\nThree Address Code:\n");
    generateTAC();

    return 0;
}
