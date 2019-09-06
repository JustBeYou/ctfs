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

def run(input_data, breakpoints = []):
    input_memory = list("Almost heaven west virginia, blue ridge mountains\x00{}".format(input_data))
    input_memory = [ord(c) for c in input_memory]
    input_memory += [0] * 131

    vm_memory = [0] * 1024

    code = load()
    #print (code)
    ip = 0
    control = 0
    counter = 0

    def dump(msg):
        f = lambda l: ' '.join([hex(x) for x in l])
        print (msg)
        print ("--- CONTEXT ---")
        print ("IP: {} CONTROL: {} COUNTER: {}".format(ip, control, counter))
        print ("CODE: {}".format(f(code[ip:ip+10])))
        print ("VM MEMORY: {}".format(f(vm_memory)))
        print ("INPUT MEMORY: {}".format(f(input_memory)))

    # leave and ret
    while code[ip] != 0xc9 and code[ip] != 0xc3:
        to_print = ""

        if counter in breakpoints:
            dump("BREAKPOINT at {}".format(ip))
            cmd = input('> ').split()
            if cmd[0] == 'b':
                breakpoints.append(int(cmd[1]))
            elif cmd[0] == 'c':
                pass


        if code[ip] == 0x06: # SIGILL (4)
            to_print = "SIGILL\n"

            if code[ip + 1] == 0x1:
                val = to_int(code[ip+3:ip+7])
                idx = code[ip + 2]
                to_print += "vm_memory[{}] = {}\n".format(idx, val)
                vm_memory[idx] = val

                #to_print += "\nval = *(int*)(&ip+3) = {}".format(val)
                ip += 7
            else:
                val = code[ip + 3]

                if code[ip + 1] == 2:
                    to_print += "vm_memory[{}] = input_memory[{}] = {}\n".format(code[ip + 2], vm_memory[val], input_memory[vm_memory[val]])
                    vm_memory[code[ip + 2]] = input_memory[vm_memory[val]]
                elif code[ip + 1] == 32:
                    to_print += "input_memory[{}] = vm_memory[{}] = {}\n".format(vm_memory[code[ip + 2]], val, vm_memory[val])
                    input_memory[vm_memory[code[ip + 2]]] = vm_memory[val];
                elif code[ip + 1] == 0:
                    to_print += "vm_memory[{}] = vm_memory[{}] = {}\n".format(code[ip + 2], val, vm_memory[val])
                    vm_memory[code[ip + 2]] = vm_memory[val]

                ip += 4
                #to_print += "\nval = *(char*)(&ip+3) = {}".format(val)
        elif code[ip] == 0xcc: # SIGTRAP (5)
            to_print = "SIGTRAP\n"
            ip += 1 # as this is a valid instruction, ip will be incremented
            to_add = 0

            if code[ip + 1] == 1:
                val = to_int(code[ip+3:ip+7])
                temp_print = "{}".format(val)
                to_add += 7
            elif code[ip + 1] == 0:
                val = vm_memory[code[ip + 3]]
                temp_print = "vm_memory[{}]".format(code[ip + 3], val)
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

            to_print += "vm_memory[{}] {}= {} = {}\n".format(code[ip + 2], operations[op], temp_print, vm_memory[code[ip + 2]])
            ip += to_add

        elif code[ip:ip+4] == [0x30, 0xc0, 0xf6, 0xf8]: # SIGFPE (8)
            to_print = "SIGFPE\n"
            ip += 2 # the first instruction is valid (xor al, al)
            to_add = 0

            if code[ip + 2] == 1:
                val = to_int(code[ip+4:ip+8])
                control = vm_memory[code[ip+3]] - val

                to_print += "control = vm_memory[{}] - {} = {} - {} = {}\n".format(code[ip+3], val, vm_memory[code[ip+3]], val, control)

                to_add += 8
            elif code[ip + 2] == 0:
                val = code[ip+4]
                control = vm_memory[code[ip+3]] - vm_memory[val]

                to_print += "control = vm_memory[{}] - vm_memory[{}] = {} - {} = {}\n".format(code[ip + 3], code[val], vm_memory[code[ip+3]], vm_memory[val], control)

                to_add += 5

            ip += to_add
        elif code[ip:ip+2] == [0x0, 0x0]: # SIGSEGV (11)
            to_print = "SIGSEGV\n"

            jmp = code[ip+2]
            val = to_int(code[ip+3:ip+7])
            if jmp == 0:
                ip += val
                to_print += "(relative) jmp {}".format(val)
            elif jmp == 1:
                if control:
                    ip += 7
                    to_print += "(relative) jmp {}".format(7)
                else:
                    ip += val
                    to_print += "(relative) jmp {}".format(val)
            elif jmp == 2:
                if control:
                    ip += val
                    to_print += "(relative) jmp {}".format(val)
                else:
                    ip += 7
                    to_print += "(relative) jmp {}".format(7)
            elif jmp == 3:
                if control <= 0:
                    ip += 7
                    to_print += "(relative) jmp {}".format(7)
                else:
                    ip += val
                    to_print += "(relative) jmp {}".format(val)
            elif jmp == 4:
                if control < 0:
                    ip += 7
                    to_print += "(relative) jmp {}".format(7)
                else:
                    ip += val
                    to_print += "(relative) jmp {}".format(val)
            elif jmp == 5:
                if control >= 0:
                    ip += 7
                    to_print += "(relative) jmp {}".format(7)
                else:
                    ip += val
                    to_print += "(relative) jmp {}".format(val)
            elif jmp == 6:
                if control > 0:
                    ip += 7
                    to_print += "(relative) jmp {}".format(7)
                else:
                    ip += val
                    to_print += "(relative) jmp {}".format(val)
            to_print += "\n"
        else:
            dump("Unknown opcode")
            break

        counter += 1
        print (to_print)
    print (counter + 1)
    dump("Good?")

run("de1ctf{7h3n_f4r3_u_w3ll_5w337_cr4g13_HILL_wh3r3_0f3n_71m35_1_v3_r0v3d}", breakpoints = [])
