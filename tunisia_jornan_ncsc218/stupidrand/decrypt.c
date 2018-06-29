#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stddef.h>
#include <stdint.h>

char *load_file(const char* name) {
    FILE *stream = fopen(name, "rb");
    
    fseek(stream, 0, 2);
    uint64_t size = ftell(stream);
    fseek(stream, 0, 0);

    char *buffer = malloc(sizeof(char) * size);
    fread(buffer, size, 1, stream);
    fclose(stream);

    return buffer;
}

void decrypt(char *encrypted, int32_t key) {
    srand(key);

    for (int i = 0; encrypted[i] != '\0'; i++) {
        encrypted[i] ^= rand();
    }
}

int32_t brute_decrypt(char *encrypted) {
    char *tmp = malloc(sizeof(char) * 6);
    tmp[5] = '\0';

    for (int key = 0; key < 0xffff; key++) {
        memcpy(tmp, encrypted, 5);
        printf("Trying key %x\n", key);
        decrypt(tmp, key);

        if (!memcmp(tmp, "flag{", 5)) {
            printf("Found key %x\n", key);
            return key;
        }
    }

    return 0;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <file>\n", argv[0]);
        return 1;
    }
    char *encrypted = load_file(argv[1]);
    printf("Encrypted text: %s\n", encrypted);

    uint32_t key = brute_decrypt(encrypted);
    decrypt(encrypted, key);

    printf("Decrypted text: %s\n", encrypted);

    free(encrypted);
    return 0;
}
