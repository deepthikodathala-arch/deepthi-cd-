#include <stdio.h>

int main()
{
    char text[1000];
    int i;
    int characters = 0;
    int words = 0;
    int lines = 1;
    int inWord = 0;

    printf("Enter the text:\n");
    fgets(text, sizeof(text), stdin);

    for (i = 0; text[i] != '\0'; i++)
    {
        characters++;

        if (text[i] == '\n')
        {
            lines++;
            inWord = 0;
        }
        else if (text[i] == ' ' || text[i] == '\t')
        {
            inWord = 0;
        }
        else if (inWord == 0)
        {
            words++;
            inWord = 1;
        }
    }

    if (characters > 0 && text[characters - 1] == '\n')
        lines--;

    printf("\nNumber of characters = %d\n", characters);
    printf("Number of words = %d\n", words);
    printf("Number of lines = %d\n", lines);

    return 0;
}
