#include <stdlib.h>
#include <stdio.h>

typedef struct {
    void (*func)();
    char *buf;
} ptr;

void win() {
    puts("You hacked this!");
}

int main() {
    ptr* obj = malloc(sizeof(ptr));
    obj->func = NULL;
    obj->buf = malloc(0x200);

    printf("A: %p %p\n", obj, obj->buf);

    free(obj->buf);
    free(obj);

    free(obj->buf);
    free(obj);

    ptr* obj1 = malloc(sizeof(ptr));
    obj1->func = NULL;
    obj1->buf = malloc(sizeof(ptr));

    printf("B: %p %p\n", obj1, obj1->buf);

    size_t *mal = obj1->buf;
    mal[0] = &win;

    obj->func();
}
