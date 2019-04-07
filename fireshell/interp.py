from struct import unpack

code = []
with open('babyvm', 'rb') as f:
    f.read(0xA00)
    raw_code = f.read(2668 * 4)
    for i in range(0, len(raw_code), 4):
        code.append(unpack('<I', raw_code[i:i+4])[0])

def fetch(i):
    return code[i]


sublist = []
def execute():
    stack = []
    IP = 0
    running = True

    while running:
        current = fetch(IP)

        if current == 0:
            IP += 1
            stack.append(fetch(IP))
            print ("[VM] fetch {} -> {}".format(IP, stack[-1]))
        elif current == 1:
            a = stack.pop(-1)
            b = stack.pop(-1)
            s = a + b
            stack.append(s)
            print ("[VM] add {}, {} -> {}".format(a, b, s))
        elif current == 2:
            # nop
            pass
        elif current == 3:
            print ("[VM] Program executed successfully!")
            running = False
        elif current == 4:
            a = stack.pop(-1)
            b = stack.pop(-1)
            p = a * b
            stack.append(p)
            print ("[VM] mul {}, {} -> {}".format(a, b, p))
        elif current == 5:
            a = stack.pop(-1)
            b = stack.pop(-1)
            d = int(b // a)
            stack.append(d)
            print ("[VM] div {}, {} -> {}".format(a, b, d))
        elif current == 6:
            a = stack.pop(-1)
            b = stack.pop(-1)
            d = b - a
            stack.append(d)
            sublist.append(d)
            print ("[VM] sub {},  {} -> {}".format(a, b, d))
        else:
            print ("[FAULT] Unkown opcode")
            print ("IP: {} Opcode: {}".format(IP, current))
            print ("Stack: {}".format(stack))
            exit(-1)
        #print ("[VM] Stack: {}".format(stack))
        IP += 1

execute()
# before every sub = 0 there is a flag character
print (sublist)
for i,j in enumerate(sublist):
    if j == 0:
        print (chr(sublist[i -1]), end='')
print ()
