#include <stdio.h>
#include <string.h>
main(void)
{
    char input[101];
    scanf("%[^\n]", input);

    char separator[] = " ";
    for (char *p = strtok(input, separator); p != NULL; p = strtok(NULL, separator))
    {
        int number = atoi(p);
        if(isdigit(p[0]))
        {
             if(number%2==0)
             {
                 p = "Buzz";
             }
             else
             {
                 p = "Lightning";
             }
        }
         printf("%s\n",p, number);
    }
    
}
