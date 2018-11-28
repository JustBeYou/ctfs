#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void enc(char *input, char *output) {
    char *s = malloc(0x16uLL);
    memset(s, 0, 0x16uLL);
    memcpy(s, input, 0x15);
    
    char *src = malloc(0x15uLL);
  
    for (int i = 20; i >= 0; --i )
        src[21 - i - 1] = *(s + i);
  
    memcpy(s, src, 0x15uLL);
    printf("%s\n", s);

    for (int j = 0; j < 21; ++j )
        *(s + j) -= 5;
    printf("%s\n", s);    

    for (int k = 0; k < 21; ++k )
        src[k] = *(s + (k + 10) % 21);

    memcpy(output, src, 0x15);
    printf("%s\n", output);

    free(s);
    free(src);
}


void dec(char *input, char *output) {
          char *s = malloc(0x16uLL);
       memset(s, 0, 0x16uLL);
       memcpy(s, input, 0x15);
   
       char *src = malloc(0x15uLL);

       for (int j = 0; j < 21; ++j )
           *(s + j) += 5;

    for (int i = 20; i >= 0; i--) {
        src[21 - i - 1] = *(s + i);
    }

    memcpy(output, src, 0x15);
    printf("%s\n", output);
    free(s);
    free(src);
}

int main() {
    char s[] = "this_is_a_simple_test_flag";
    char fl[] = "jmt_j]tm`q`t_j]mpjtf^";
    char tmp[30];
    char out[30];
    enc(s, tmp);
    dec(tmp, out);
    dec(fl, out);

    return 0;
}
