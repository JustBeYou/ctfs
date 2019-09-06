from base64 import b64encode
from os import system

def r():
    system("rm -f test.wasm && /opt/wasi-sdk/bin/clang -D_WASI_EMULATED_MMAN test1.c -o test.wasm -nostartfiles -Wl,--no-entry,--export=this_is_what_ive_got")

    with open('test.wasm', 'rb') as f:
        data = f.read()
    data = b64encode(data)
    #print (data)
    system('echo -n "{}" | nc localhost 9999 #| grep "GOT " >> output.txt'.format(data))
"""with open('test.c', 'r') as f:
    data = f.read()
for i in range(0x1, 0x400):
    print (i)
    data2 = data.replace('!!!', hex(i))
    with open('test1.c', 'w') as f:
        f.write(data2)
    """
r()
