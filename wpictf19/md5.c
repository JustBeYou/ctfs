#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#if defined(__APPLE__)
#  define COMMON_DIGEST_FOR_OPENSSL
#  include <CommonCrypto/CommonDigest.h>
#  define SHA1 CC_SHA1
#else
#  include <openssl/md5.h>
#endif

char *str2md5(const char *str, int length) {
    int n;
    MD5_CTX c;
    unsigned char digest[16];
    char *out = (char*)malloc(50);

    MD5_Init(&c);

    while (length > 0) {
        if (length > 512) {
            MD5_Update(&c, str, 512);
        } else {
            MD5_Update(&c, str, length);
        }
        length -= 512;
        str += 512;
    }

    MD5_Final(digest, &c);
    sprintf(out, "%lx%lx", ((long long*)digest)[0], ((long long*)digest)[1]);

    return out;
}

int gen(int t) {
  srand(t);
  rand();
  rand();
  return rand();
}

    int main(int argc, char **argv) {
        int start;
        char target[100];

        scanf("%d", &start);
        scanf("%s", target);
        //start=0x6921351a;

        char *p = strchr(target, "\n");
        *p = 0;

        for (int i = 0; i < 10000000; i++) {
          //printf("%x\n", i);
          int j = start + i;
          int tmp = gen(j);
          char buf[10];
          memcpy(buf, &tmp, 4);
          //printf("%s\n", &tmp);
          char *output = str2md5(&tmp, 4);
          //printf("%s\n", output);
          if (!strcmp(output, target)) {
            printf("FOUND %x %s\n", j, output);
            break;
          }
          free(output);
        }
        return 0;
    }
