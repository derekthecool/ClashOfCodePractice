#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

int main()
{
    char S[101];
    scanf("%[^\nA-Za-z]", S);
    printf("%d",strlen(S));
}
