Stack pivoting with setcontext
===

Usually in CTF challenges we have at our disposal a so named _one gadget_ or _magic gadget_ which allows directlly executing `execve("/bin/sh", 0, 0)` by simply controlling the *RIP*. Sometimes this approach is not reliable by a couple of reasons:
* the constraints for _one gadget_ are not satisfied 
* the process is sandboxed using *seccomp* and `execve()` is not allowed

To overcome the situation we can try to pivot the stack to a different location (usually the heap) leveraging a classic ROP chain attack. We'll use `setcontext` to conduct our attack.

## Preconditions
* GNU/Linux environment with glibc
* Known address to a contigous (writable) region of memory 
* Known base of *libc*
* A way to take control of *RIP*

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
`setcontext` is a function from libc used to switch (user-level) contexts between threads. You can read more about it on its [man page](https://linux.die.net/man/2/setcontext). The most interesting thing about it is that a context contains a complete copy of machine's registers including *RSP*, so by calling `setcontext` with a well-crafted structure, we can pivot the stack to an arbitrary location.

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

`mcontext_t uc_mcontext` ([source](https://code.woboq.org/userspace/glibc/sysdeps/unix/sysv/linux/x86/sys/ucontext.h.html#ucontext_t)) field stores the machine state which contains the saved registers.

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
