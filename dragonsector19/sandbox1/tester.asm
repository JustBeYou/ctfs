[BITS 64]

global _start
global syscall
global _exit
global vfork

extern main

section .text

syscall:
    mov rax, rdi
    mov rdi, rsi
    mov rsi, rdx
    mov rdx, rcx
    mov r10, r8
    mov r8, r9
    mov r9, [rsp + 8]
    syscall
    ret

_exit:
    mov rax, 231
    syscall
    hlt
.loop:
    jmp .loop

vfork:
    push rbx
    mov rbx, [rsp + 8]
    mov rax, 58
    syscall
    mov [rsp + 8], rbx
    pop rbx
    ret

_start:
    sub rsp, 0x10
    and rsp, ~0xf
    call main
    mov rdi, rax
    call _exit
