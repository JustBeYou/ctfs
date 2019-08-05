#include <stdio.h>
#include <string.h>

int main() {
    printf("%d\n", strncmp("salut\x00", "salut cumetre\x00", 0));

    return 0;
}
