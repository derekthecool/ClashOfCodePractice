#include <stdbool.h>
#include <stdio.h>

int main(void)
{
    char line[101];
    scanf("%[^\n]", line);
    int acid, water;
    scanf("%d", &acid);
    int water_count;
    scanf("%d", &water);
    bool known = false;
    if (strcmp(line, "Citric") == 0 || strcmp(line, "Sulfuric") == 0 || strcmp(line, "Nitric") == 0 ||
        strcmp(line, "Hydrochloric") == 0)
    {
        known = true;
    }
    float percent = (float)acid / ((float)acid + (float)water);
    printf("%.1f%% %s Acid", percent * 100, known ? line : "Unknown");
}
