int main() {
    void *a = malloc(0x400);
    void *b = malloc(0x400);
    void *c = malloc(0x30);

    free(a);
    free(b);
    free(a);
}
