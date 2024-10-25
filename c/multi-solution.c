#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *solution1(char **lines)
{
// 165 chars
int c=atoi(lines[0]);char*a=malloc(999),*b=malloc(999);for(int i=0;i<c;i++){strncat(a,lines[1+i]+i,1);strncat(b,lines[1+i]+c-i-1,1);}sprintf(a,"%s %s",a,b);return a;
}

char *solution2(char **inputLines)
{
    return strdup("Test test test\n");
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
