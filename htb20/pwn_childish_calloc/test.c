int main() {
    void *p[100];
    for (int i = 0; i < 8*5; i++) {
        p[i] = malloc(0x20);
    }

    for (int i = 0; i < 7*5; i++) {
        free(p[i]);
    }

    return 0;
}
