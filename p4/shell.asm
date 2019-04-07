bits 64

mov rax, 0x9000000000
mov BYTE [rax], 1
int3
int3
int3
