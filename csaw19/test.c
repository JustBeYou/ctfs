       #define _XOPEN_SOURCE       /* See feature_test_macros(7) */
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    if (argc != 3) {
            printf("Usage: crypttest key salt\n");
                return EXIT_FAILURE;
                  
    }
      char *s;
      for (int i = 0; i < 10000; i++) {
              s = crypt(argv[1], argv[2]);
                
      }
        printf("%s\n", s);
          return EXIT_SUCCESS;
          
}
