#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  int n, a;
  scanf("%d", &n);
  scanf("%d", &a);
  fgetc(stdin);
  char symbol[2];
  scanf("%[^\n]", symbol);

  char * long_string = malloc(sizeof(char *) * 1000);
  memset(long_string, 0, 999);
  for(int i = 0; i < 999; i++)
  {
      long_string[i] = symbol[0];
  }
  fprintf(stderr, "p: %s\n", p);

  for (int i = 0; i < n; i++) {
    printf("%*s%*s\n", a + i - 1, " ", a, symbol);
  }
}
