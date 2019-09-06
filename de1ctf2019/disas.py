from struct import *

def load():
    with open('bytecode.txt', 'rb') as f:
        data = f.read()
    return [ord(x) for x in data]

def byten(x, n): return (x >> (n * 0x8)) & 0xff
def byte0(x): return x & 0xff
def byte1(x): return byten(x, 1)
def byte2(x): return byten(x, 2)
def byte3(x): return byten(x, 3)
def byte4(x): return byten(x, 4)

def to_int(x):
    return unpack('<i', ''.join([chr(c) for c in x]))[0]

def disas():
    code = load()
    ip = 0
    counter = 0
    final_to_print = ''

    def dump(msg):
        f = lambda l: ' '.join([hex(x) for x in l])
        print (msg)
        print ("--- CONTEXT ---")
        print ("IP: {} COUNTER: {}".format(ip, counter))
        print ("CODE: {}".format(f(code[ip:ip+10])))

    # leave and ret
    while code[ip] != 0xc9 and code[ip] != 0xc3:
        to_print = "lab{}: ".format(ip)

        if code[ip] == 0x06: # SIGILL (4)
            #to_print = "SIGILL;\n"

            if code[ip + 1] == 0x1:
                val = to_int(code[ip+3:ip+7])
                idx = code[ip + 2]
                to_print += "vm_memory[{}] = {};\n".format(idx, val)
                #vm_memory[idx] = val

                #to_print += ";\nval = *(int*)(&ip+3) = {}".format(val)
                ip += 7
            else:
                val = code[ip + 3]

                if code[ip + 1] == 2:
                    to_print += "vm_memory[{}] = input_memory[{}];\n".format(code[ip + 2], "vm_memory[{}]".format(val))
                    #vm_memory[code[ip + 2]] = input_memory[vm_memory[val]]
                elif code[ip + 1] == 32:
                    to_print += "input_memory[{}] = vm_memory[{}];\n".format("vm_memory[{}]".format(code[ip+2]), val)
                    #input_memory[vm_memory[code[ip + 2]]] = vm_memory[val];
                elif code[ip + 1] == 0:
                    to_print += "vm_memory[{}] = vm_memory[{}];\n".format(code[ip + 2], val)
                    #vm_memory[code[ip + 2]] = vm_memory[val]

                ip += 4
                #to_print += ";\nval = *(char*)(&ip+3) = {}".format(val)
        elif code[ip] == 0xcc: # SIGTRAP (5)
            #to_print = "SIGTRAP;\n"
            ip += 1 # as this is a valid instruction, ip will be incremented
            to_add = 0

            if code[ip + 1] == 1:
                val = to_int(code[ip+3:ip+7])
                temp_print = "{}".format(val)
                to_add += 7
            elif code[ip + 1] == 0:
                val = "vm_memory[{}]".format(code[ip+3])
                temp_print = val
                to_add += 4

            op = code[ip]
            operations = {
                0: '+',
                1: '-',
                2: '*',
                3: '/',
                4: '%',
                5: '|',
                6: '&',
                7: '^',
                8: '<<',
                9: '>>'
            }

            """
            if op == 0:
                vm_memory[code[ip + 2]] += val
            elif op == 1:
                vm_memory[code[ip + 2]] -= val
            elif op == 2:
                vm_memory[code[ip + 2]] *= val
            elif op == 3:
                vm_memory[code[ip + 2]] /= val
            elif op == 4:
                vm_memory[code[ip + 2]] %= val
            elif op == 5:
                vm_memory[code[ip + 2]] |= val
            elif op == 6:
                vm_memory[code[ip + 2]] &= val
            elif op == 7:
                vm_memory[code[ip + 2]] ^= val
            elif op == 8:
                vm_memory[code[ip + 2]] <<= val
            elif op == 9:
                vm_memory[code[ip + 2]] >>= val
            """

            to_print += "vm_memory[{}] {}= {};\n".format(code[ip + 2], operations[op], temp_print)
            ip += to_add

        elif code[ip:ip+4] == [0x30, 0xc0, 0xf6, 0xf8]: # SIGFPE (8)
            #to_print = "SIGFPE;\n"
            ip += 2 # the first instruction is valid (xor al, al)
            to_add = 0

            if code[ip + 2] == 1:
                val = to_int(code[ip+4:ip+8])

                to_print += "control = vm_memory[{}] - {};\n".format(code[ip+3], val)

                to_add += 8
            elif code[ip + 2] == 0:
                val = code[ip+4]
                to_print += "control = vm_memory[{}] - vm_memory[{}];\n".format(code[ip + 3], code[val])
                to_add += 5

            ip += to_add
        elif code[ip:ip+2] == [0x0, 0x0]: # SIGSEGV (11)
            #to_print = "SIGSEGV;\n"

            goto = code[ip+2]
            val = to_int(code[ip+3:ip+7])
            if goto == 0:
                to_print += "goto lab{};\n".format(ip + val)
                #to_print += "(relative) goto lab{}".format(val)
            elif goto == 1:
                to_print += "if (control) goto lab{}; else goto lab{};\n".format(ip+7,ip+val)
            elif goto == 2:
                to_print += "if (control) goto lab{}; else goto lab{};\n".format(ip+val,ip+7)
            elif goto == 3:
                to_print += "if (control <= 0) goto lab{}; else goto lab{};\n".format(ip+7,ip+val)
            elif goto == 4:
                to_print += "if (control < 0) goto lab{}; else goto lab{};\n".format(ip+7,ip+val)
            elif goto == 5:
                to_print += "if (control >= 0) goto lab{}; else goto lab{};\n".format(ip+7,ip+val)
            elif goto == 6:
                to_print += "if (control > 0) goto lab{}; else goto lab{};\n".format(ip+7,ip+val)
            ip+=7
        else:
            dump("Unknown opcode")
            break

        final_to_print += to_print
        counter += 1

    d = {0xc9: 'leave', 0xc3: 'ret'}
    while ip < len(code):
        final_to_print += "lab{}: {}\n".format(ip, "if (vm_memory[0]) printf(\"GOOOOOD!\\n\"); else printf(\"BAD\\n\");")
        ip += 1

    final_to_print = final_to_print.replace("vm_memory[0]", "good_flag").replace("vm_memory[3]", "i").replace("vm_memory[4]", "j").replace("vm_memory[5]", "k").replace("vm_memory[2]", "B").replace("vm_memory[1]", "A").replace("vm_memory[6]", "C");
    print (final_to_print)
disas()
