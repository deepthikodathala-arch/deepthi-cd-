#include <stdio.h>
#include <string.h>

int main()
{
    int n, i;
    char op1[20], op2[20], result[20], op;

    printf("Enter number of three address statements: ");
    scanf("%d", &n);

    printf("Enter three address code:\n");

    for (i = 0; i < n; i++)
    {
        scanf("%s = %s %c %s", result, op1, &op, op2);

        printf("\nMOV R0, %s", op1);

        if (op == '+')
            printf("\nADD R0, %s", op2);
        else if (op == '-')
            printf("\nSUB R0, %s", op2);
        else if (op == '*')
            printf("\nMUL R0, %s", op2);
        else if (op == '/')
            printf("\nDIV R0, %s", op2);

        printf("\nMOV %s, R0\n", result);
    }

    return 0;
}
