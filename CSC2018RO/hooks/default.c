#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdio.h>
#include <string.h>
#include <openssl/aes.h>

static void (*real_AES_cbc_encrypt)(const unsigned char *in, unsigned char *out,
            size_t length, const AES_KEY *key,
            unsigned char *ivec, const int enc);

void AES_cbc_encrypt(const unsigned char *in, unsigned char *out, size_t length, const AES_KEY *key, unsigned char *ivec, const int enc) {
    real_AES_cbc_encrypt = dlsym(RTLD_NEXT, "AES_cbc_encrypt");
    printf("%s %s %d %s %s %d\n", in, out, length, key, ivec, enc);

    return  real_AES_cbc_encrypt(in, out, length, key, ivec, enc);
}

/*
static  ssize_t (*real_write)(int fd, const void *buf, size_t count) = NULL;
static int (*real_puts)(const char* str) = NULL;

ssize_t write(int fd, const void *buf, size_t count)
{

    printf("write:chars#:%lu\n", count);
    real_write = dlsym(RTLD_NEXT, "write");
    return real_write(fd, buf, count);

}

int puts(const char* str)
{

    printf("puts:chars#:%lu\n", strlen(str));
    real_puts = dlsym(RTLD_NEXT, "puts");
    return real_puts(str);
}*/
