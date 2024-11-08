#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *solution1(char **l)
{
    int count = atoi(*(l++));
    double lowest = 1000000;
    char name_of_lowest[100];
    for (int i = 0; i < count; i++)
    {
        char *string = l[i];
        char separator[] = " ";
        char *p = strtok(string, separator);

        char item[100];
        strcpy(item, p);
        int weight = atoi(strtok(NULL, separator));
        int price = atoi(strtok(NULL, separator));
        double current = (double)price / (double)weight;
        if (current < lowest)
        {
            lowest = current;
            memcpy(name_of_lowest, item, 100);
        }
    }
    return strdup(name_of_lowest);
}

char *solution2(char **l)
{
    char *letters = malloc(sizeof(char) * 9999);
    int index = 0;
    for (int i = 2; i < strlen(l[0]); i += 3)
    {
        letters[index++] = l[0][i];
    }
    return letters;
}

// Array of function pointers to solutions
// To quickly get all function names and load into this array run this lua file
// luafile ./get-all-multi-solution-function-names.lua
char *(*solutions[])(char **) = {solution1, /* solution2 */};

// Splits input into lines and executes each solution function
void testSolutions(char *input)
{
    if (!input)
    {
        return;
    }

    fprintf(stderr, "input:\n%s\n\n", input);

    char **lines = NULL;
    size_t numLines = 0;
    char *line = strtok(input, "\n");
    while (line != NULL)
    {
        lines = realloc(lines, sizeof(char *) * (numLines + 1));
        lines[numLines++] = line;
        line = strtok(NULL, "\n");
    }

    size_t numSolutions = sizeof(solutions) / sizeof(solutions[0]);

    char *expectedResult = NULL;
    bool allMatch = true;

    for (size_t i = 0; i < numSolutions; i++)
    {
        char *result = solutions[i](lines);
        fprintf(stderr, "Function %zu result: %s\n", i + 1, result);

        if (expectedResult == NULL)
        {
            expectedResult = result;
        }
        else if (strcmp(expectedResult, result) != 0)
        {
            allMatch = false;
            fprintf(stderr, "Function %zu does not match the expected result: %s\n", i + 1, expectedResult);
            free(result);
            break;
        }

        if (i > 0)
        {
            free(result);
        }
    }

    if (allMatch)
    {
        fprintf(stderr, "All solutions match.\n");
        printf("%s\n", expectedResult);
    }
    else
    {
        fprintf(stderr, "There was a discrepancy between solutions.\n");
    }

    free(expectedResult);
    free(input);
    free(lines);
}

int main()
{
    char *input, *line = 0;
    getdelim(&input, &line, 0xFF, stdin);

    testSolutions(input);
    return 0;
}
