#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define INPUT_DELIM 0xFF

// Example solution function signature
// Access the first line with inputLines[0]
char *solution1(char **inputLines)
{
    return strdup("Test test test\n");
}

// Add more solution functions following the same pattern as solution1

// Reads all input from stdin until the INPUT_DELIM delimiter
char *readInput()
{
    int c;
    size_t capacity = 512;
    size_t len = 0;
    char *input = malloc(capacity);

    if (!input)
        return NULL;

    while ((c = getchar()) != EOF && c != INPUT_DELIM)
    {
        input[len++] = (char)c;
        // Expand buffer if necessary
        if (len >= capacity)
        {
            capacity *= 2;
            input = realloc(input, capacity);
            if (!input)
                return NULL;
        }
    }
    input[len] = '\0'; // Null-terminate the string
    return input;
}

// Splits input into lines and executes each solution function
void testSolutions(char *input)
{
    if (!input)
        return;

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

    // Array of function pointers to solutions
    char *(*solutions[])(char **) = {solution1 /*, solution2, ... */};
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
    char *input = readInput();
    testSolutions(input);
    return 0;
}
