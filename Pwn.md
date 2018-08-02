Pwning Guide
===
This is a short guide for learning pwning. 

1. Learn C/C++ at a decent level and get a better understanding of the following topics:
    - Pointers and memory management: 
        - https://en.wikipedia.org/wiki/Pointer_(computer_programming)
        - https://www.gribblelab.org/CBootCamp/7_Memory_Stack_vs_Heap.html
    - Compiling and linking
        - https://stackoverflow.com/questions/6264249/how-does-the-compilation-linking-process-work
    - File descriptors
        - https://en.wikipedia.org/wiki/File_descriptor
    - Sockets
        - http://www.cs.rpi.edu/~moorthy/Courses/os98/Pgms/socket.html
    - Forking and threads
        - https://www.geeksforgeeks.org/fork-system-call/
        - https://www.geeksforgeeks.org/multithreading-c-2/

2. Learn Assembly
    - https://www.tutorialspoint.com/assembly_programming/
    - http://www.cs.virginia.edu/~evans/cs216/guides/x86.html
    - Learn differences between 32-bit and 64-bit ASM
        - https://software.intel.com/en-us/articles/introduction-to-x64-assembly
    - Learn calling conventions for C/C++ using ASM perspective
        - https://scc.ustc.edu.cn/zlsc/sugon/intel/compiler_c/main_cls/bldaps_cls/common/bldaps_calling_conv.htm
        - https://en.wikibooks.org/wiki/X86_Disassembly/Calling_Conventions
        - https://aaronbloomfield.github.io/pdr/book/x86-64bit-ccc-chapter.pdf
    - Learn how C and ASM work together
        - https://www.devdungeon.com/content/how-mix-c-and-assembly

3. Now you have enough knowledge to proceed to actual exploits, take this course https://github.com/RPISEC/MBE ; don't focus to much on exercices as some are buggy

4. Watch this https://www.youtube.com/watch?v=iyAyN3GFM7A&list=PLhixgUqwRTjxglIswKp9mpkfPNfHkzyeN

5. Read those articles: https://ctf101.org/binary-exploitation/overview/ , https://0x00sec.org/t/heap-exploitation-abusing-use-after-free/3580

6. Practice on:
    - pwnable.kr
    - pwnable.tw
    - https://365.csaw.io/
    - https://www.hackthebox.eu/home/challenges/Pwn


Before you start to practices on those websites, you should have some knowledge in:
- How calling functions works and how to pass parameters (32bit and 64bit)
- What are EBP/RBP, ESP/RSP, EIP/RIP and what they are used for
- How stack and heap works
- What are the most important ELF sections and what they are used for: text, data, bss, got, plt
- Classic exploits like buffer overflow, GOT rewrite using string format, return oriented programming, how to write shellcode, signal oriented programming, heap exploits
-  Mitigation techniques like DEP, ASLR, PIE
