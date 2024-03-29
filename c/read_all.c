#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DELIMITER '\n'  // Define the line delimiter

char** readAndSplitStdin(int *count) {
    size_t bufferSize = 0;
    char *buffer = NULL;
    ssize_t bytesRead;

    // Read the entire input until EOF or 0xFF
    while ((bytesRead = getdelim(&buffer, &bufferSize, 0xFF, stdin)) != -1 && buffer[bytesRead - 1] != 0xFF) {
        // Normally, getdelim would stop reading if 0xFF is found
    }

    // If no input was read, return NULL
    if (bytesRead <= 0) {
        free(buffer);
        return NULL;
    }

    // Overwrite 0xFF with '\0' to terminate the string if it exists
    if (buffer[bytesRead - 1] == 0xFF) {
        buffer[bytesRead - 1] = '\0';
    }

    // Count how many lines (delimited by '\n') are in the buffer
    *count = 0;
    for (char *p = buffer; *p; p++) {
        if (*p == DELIMITER) {
            (*count)++;
        }
    }
    (*count)++; // Add one more count for the last line

    // Allocate memory for pointers to each line
    char **lines = malloc(*count * sizeof(char *));
    if (lines == NULL) {
        free(buffer);
        return NULL;
    }

    // Split the buffer into lines
    char *line = strtok(buffer, "\n");
    int i = 0;
    while (line != NULL && i < *count) {
        lines[i++] = strdup(line);  // Duplicate the line (remember to free later)
        line = strtok(NULL, "\n");
    }

    // Free the original buffer since we've duplicated strings
    free(buffer);

    return lines;  // Return the array of lines
}
