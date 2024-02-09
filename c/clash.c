#include <stdio.h>
#include <stdlib.h>
#include <string.h>

main()
{
    char input[999];
    scanf("%s", input);

    char *p, *l = 0;
    getdelim(&p, &l, 0xFF, stdin);

    int angle = 0;
    bool toggle = false;

    char separator[] = " \n";
    for (char *string_to_split = strtok(p, separator); string_to_split != NULL;
         string_to_split = strtok(NULL, separator))
    {
         if(toggle)
         {
             toggle = false;
         }
         else
         {
             toggle = true;
         }

        angle += atoi(string_to_split);
        switch (angle)
        {
        case 90:
            puts("SUPPLEMENTARY");
            break;
        case 180:
            puts("COMPLEMENTARY");
            break;
        default:
            puts("NEITHER");
            break;
        }
    }

    for(int i = 0; i < 10; i++)
    {
        
    }

    // printf("%s",p);
}

for(int i = 0; i < 10; i++)
{
    
}

if()
{
    
}

else
{
    
    else if()
    {
        int MyFunction()
        {
            
        }
    }
}
