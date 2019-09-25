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
%define main 0x6F90

%define _zx_vmar_root_self 0x10cb0
%define _zx_take_startup_handle 0x10d40
_start:
	; r15 binary base

	arg1 0x100
	call_func _malloc
	mov r12, rax

	mov rax, QWORD [fs:0x18]
	mov rbx, [rax]

	mov r15, 0xdeadbeef
	int 0x3


