#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <limits.h>

bool check(__int64_t a1) {
  size_t v1, v2;
  bool result;
  int v4, v5, v6, v7;

   v7 = strtol((const char *)a1, 0LL, 10);
  result = 0;
  if ( !(v7 % (strlen((const char *)a1) + 2)) && *(char *)(a1 + 4) == '1' )
  {
    v6 = v7 / 100000;
    v5 = v7 % 10000;
    if ( 10 * (v7 % 10000 / 1000) + v7 % 10000 % 100 / 10 - (10 * (v7 / 100000 / 1000) + v7 / 100000 % 10) == 1
      && 10 * (v6 / 100 % 10) + v6 / 10 % 10 - 2 * (10 * (v5 % 100 / 10) + v5 % 1000 / 100) == 8 )
    {
      v4 = 10 * (v5 / 100 % 10) + v5 % 10;
      if ( (10 * (v6 % 10) + v6 / 100 % 10) / v4 == 3 && !((10 * (v6 % 10) + v6 / 100 % 10) % v4) )
      {
        v1 = strlen((const char *)a1) + 2;
        v2 = (strlen((const char *)a1) + 2) * v1;
        if ( v7 % (v5 * v6) == v2 * (strlen((const char *)a1) + 2) + 6 )
          result = 1;
      }
    }
  }
  return result;
}

int main() {
  char buf[100];
  for (int i = 100000000; i < 999999999; i++) {
    sprintf(buf, "%d", i);
    if (check((__int64_t)buf) == 1) {
      printf("Found solution %d\n", i);
      break;
    } else if (i % 10000000 == 0) {
      printf("%d/%d\n", i, INT_MAX);
    }
  }

  return 0;
}
