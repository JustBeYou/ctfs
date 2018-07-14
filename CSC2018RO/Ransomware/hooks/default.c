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

    if (enc) {
        printf("Input: %s -> ", in);
        for (int i = 0; in[i]; i++) {
            printf("%x ", in[i]);
        }
        printf("\n");
        printf("Len: %d\nIV: ", length);
        for (int i = 0; i < 16;i++) {
            printf("%x ", ivec[i]);
        }
        printf("\n");
     
        real_AES_cbc_encrypt(in, out, length, key, ivec, enc);
        printf("Output: %s -> ", out);
        for (int i = 0; out[i]; i++) {
            printf("%x ", out[i]);
        }
        printf("\n");
    } else {
        printf("Input: %s -> ", in);
        for (int i = 0; in[i]; i++) {
            printf("%x ", in[i]);
        } 
        printf("\n");
        printf("Len: %d\nIV: ", length);
        for (int i = 0; i < 16;i++) {
            printf("%x ", ivec[i]);
        }
        printf("\n");

        real_AES_cbc_encrypt(in, out, length, key, ivec, enc);
        printf("Output: %s -> ", out);
        for (int i = 0; out[i]; i++) {
            printf("%x ", out[i]);
        }
        printf("\n");
    }

    return  ;
}

static int (*real_AES_set_encrypt_key)(const unsigned char *userKey, const int bits,
AES_KEY *key);

int AES_set_encrypt_key(const unsigned char *userKey, const int bits,
AES_KEY *key) {
   
    char cuserKey[35];
    memcpy(cuserKey, userKey, 32);
    cuserKey[32] = '\0';

    real_AES_set_encrypt_key = dlsym(RTLD_NEXT, "AES_set_encrypt_key");
    printf("key: %s -> %d bits: %d\n", cuserKey, strlen(cuserKey), bits);
    for (int i = 0; cuserKey[i]; i++) {
        printf("%x ", cuserKey[i]);
    }
    printf("\n");

    
    int r = real_AES_set_encrypt_key(cuserKey, bits, key);
    return r;
}

static int (*real_AES_set_decrypt_key)(const unsigned char *userKey, const int bits,
AES_KEY *key);

int AES_set_decrypt_key(const unsigned char *userKey, const int bits,
AES_KEY *key) {
    
    char cuserKey[35];
    memcpy(cuserKey, userKey, 32);
    cuserKey[32] = '\0';
    
    real_AES_set_decrypt_key = dlsym(RTLD_NEXT, "AES_set_decrypt_key");
    printf("key: %s bits: %d\n", cuserKey, bits);
    for (int i = 0; cuserKey[i]; i++) {
        printf("%x ", cuserKey[i]);
    }
    printf("\n");

    return  real_AES_set_decrypt_key(cuserKey, bits, key);
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
