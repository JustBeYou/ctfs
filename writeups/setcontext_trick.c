/**
 * System
 *  Fedora release 31 (Thirty One)
 *  GNU/Linux 5.6.13-200.fc31.x86_64
 *  ldd (GNU libc) 2.30
 * 
 * Compile
 *  gcc setcontext_trick.c -g -o setcontext_trick
 */

#include <stdio.h>
#include <stdlib.h>

size_t leak_libc() {
    return (size_t)stdout - 0x1c3500;
}

void call(void* p) {
    void (*func_ptr)() = p;
    func_ptr();
}

int main() {
    size_t libc_base = leak_libc();
    printf("libc at 0x%zx\n", libc_base);

    size_t* fake_stack = malloc(0x200);
    printf("fake stack at %p\n", fake_stack);

    call((void*)0xdeadbeef);

    return 0;
}
