#include <stdio.h>
main()
{
char s[999], v = 0, *a = "aeiou", S = 0;
scanf("%[^\n]", s);
fprintf(stderr, "%s\n", s);
int l = strlen(s);
for (int i = 0; i < strlen(s); i++)
{
if (s[i] == ' ')
{
S++;
}
for (int j = 0; j < strlen(a); j++)
{
if (s[i] == a[j])
{
    v++;
}
}
}
puts(l-S-v>v ? "consonants":"vowels");
}
