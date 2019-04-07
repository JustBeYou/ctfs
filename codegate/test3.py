import binascii

def operation_assign_addr_decimal(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param1=vm_state[param1_var_id]
    param1=param1.decode("utf-8")
    param2=vm_state[param2_var_id]
    param2=param2.decode("utf-8")
    param2=int(param2)
    vm_state[param1]=param2
    return
def operation_assign_addr_dereferenced(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    O0O000O000OOO0OO0=vm_state[param1_var_id]
    O0O000O000OOO0OO0=O0O000O000OOO0OO0.decode("utf-8")
    O0O0OO00OOO0O0OO0=vm_state[param2_var_id]
    O0O0OO00OOO0O0OO0=O0O0OO00OOO0O0OO0.decode("utf-8")
    O0O0OO00OOO0O0OO0=vm_state[O0O0OO00OOO0O0OO0]
    vm_state[O0O000O000OOO0OO0]=O0O0OO00OOO0O0OO0
    return
def operation_get_from_dict(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    param1=vm_state[param1_var_id]
    param1=param1.decode("utf-8")
    param2=vm_state[param2_var_id]
    param2=param2.decode("utf-8")
    param2=vm_state[param2]
    param3=vm_state[param3_var_id]
    param3=param3.decode("utf-8")
    if param3.isdigit():
        param3=int(param3)
    else:
        param3=vm_state[param3]
    OO0OOOOO000OO0OOO=param2[param3]
    vm_state[param1]=OO0OOOOO000OO0OOO
    return
def operation_sliceXY(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    param4_var_id=2004
    param1=vm_state[param1_var_id]
    param1=param1.decode("utf-8")
    param2=vm_state[param2_var_id]
    param2=param2.decode("utf-8")
    param3=vm_state[param3_var_id]
    param3=param3.decode("utf-8")
    if param3.isdigit():
        param3=int(param3)
    else:
        param3=vm_state[param3]
    param4=vm_state[param4_var_id]
    param4=param4.decode("utf-8")
    if param4.isdigit():
        param4=int(param4)
    else:
        param4=vm_state[param4]
    slice_=param2[param3:param4]
    vm_state[param1]=slice_
    return
def operation_assign_to_dict(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    param1=vm_state[param1_var_id]
    param1=param1.decode("utf-8")
    param2=vm_state[param2_var_id]
    param2=param2.decode("utf-8")
    if param2.isdigit():
        param2=int(param2)
    else:
        param2=vm_state[param2]
    param3=vm_state[param3_var_id]
    param3=param3.decode("utf-8")
    if param3.isdigit():
        param3=int(param3)
    else:
        param3=vm_state[param3]
    O0000OOO0OOO000O0=vm_state[param1]
    O0000OOO0OOO000O0[param2]=param3
    return
def operation_add(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    param1=vm_state[param1_var_id]
    param1=param1.decode("utf-8")
    param2=vm_state[param2_var_id]
    param2=param2.decode("utf-8")
    if param2.isdigit():
        param2=int(param2)
    else:
        param2=vm_state[param2]
    param3=vm_state[param3_var_id]
    param3=param3.decode("utf-8")
    if param3.isdigit():
        param3=int(param3)
    else:
        param3=vm_state[param3]
    OOOOO0OO000OO0000=param2+param3
    vm_state[param1]=OOOOO0OO000OO0000
    return
def operation_xor(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    param1=vm_state[param1_var_id]
    param1=param1.decode("utf-8")
    param2=vm_state[param2_var_id]
    param2=param2.decode("utf-8")
    if param2.isdigit():
        param2=int(param2)
    else:
        param2=vm_state[param2]
    param3=vm_state[param3_var_id]
    param3=param3.decode("utf-8")
    if param3.isdigit():
        param3=int(param3)
    else:
        param3=vm_state[param3]
    OOOO0OOO0000O0000=param2^param3
    vm_state[param1]=OOOO0OOO0000O0000
    return
def operation_bitwise_and(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    O0000O00OO0O0O0OO=vm_state[param1_var_id]
    O0000O00OO0O0O0OO=O0000O00OO0O0O0OO.decode("utf-8")
    OO0O0O0OO00O00OO0=vm_state[param2_var_id]
    OO0O0O0OO00O00OO0=OO0O0O0OO00O00OO0.decode("utf-8")
    if OO0O0O0OO00O00OO0.isdigit():
        OO0O0O0OO00O00OO0=int(OO0O0O0OO00O00OO0)
    else:
        OO0O0O0OO00O00OO0=vm_state[OO0O0O0OO00O00OO0]
    O00OO000O00O0OO00=vm_state[param3_var_id]
    O00OO000O00O0OO00=O00OO000O00O0OO00.decode("utf-8")
    if O00OO000O00O0OO00.isdigit():
        O00OO000O00O0OO00=int(O00OO000O00O0OO00)
    else:
        O00OO000O00O0OO00=vm_state[O00OO000O00O0OO00]
    O000O0O00O00OOOO0=OO0O0O0OO00O00OO0&O00OO000O00O0OO00
    vm_state[O0000O00OO0O0O0OO]=O000O0O00O00OOOO0
    return
def operation_bitwise_or(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    O0OO00OO00OOOOOO0=vm_state[param1_var_id]
    O0OO00OO00OOOOOO0=O0OO00OO00OOOOOO0.decode("utf-8")
    O00OOO00O0000O00O=vm_state[param2_var_id]
    O00OOO00O0000O00O=O00OOO00O0000O00O.decode("utf-8")
    if O00OOO00O0000O00O.isdigit():
        O00OOO00O0000O00O=int(O00OOO00O0000O00O)
    else:
        O00OOO00O0000O00O=vm_state[O00OOO00O0000O00O]
    O0000O000000OO000=vm_state[param3_var_id]
    O0000O000000OO000=O0000O000000OO000.decode("utf-8")
    if O0000O000000OO000.isdigit():
        O0000O000000OO000=int(O0000O000000OO000)
    else:
        O0000O000000OO000=vm_state[O0000O000000OO000]
    O0OO0OO0000000O00=O00OOO00O0000O00O|O0000O000000OO000
    vm_state[O0OO00OO00OOOOOO0]=O0OO0OO0000000O00
    return
def operation_shr(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    O0O0O0OO000O0OO0O=vm_state[param1_var_id]
    O0O0O0OO000O0OO0O=O0O0O0OO000O0OO0O.decode("utf-8")
    O0OOO0OOOOO00O0OO=vm_state[param2_var_id]
    O0OOO0OOOOO00O0OO=O0OOO0OOOOO00O0OO.decode("utf-8")
    if O0OOO0OOOOO00O0OO.isdigit():
        O0OOO0OOOOO00O0OO=int(O0OOO0OOOOO00O0OO)
    else:
        O0OOO0OOOOO00O0OO=vm_state[O0OOO0OOOOO00O0OO]
    O000OO00O0OOO00OO=vm_state[param3_var_id]
    O000OO00O0OOO00OO=O000OO00O0OOO00OO.decode("utf-8")
    if O000OO00O0OOO00OO.isdigit():
        O000OO00O0OOO00OO=int(O000OO00O0OOO00OO)
    else:
        O000OO00O0OOO00OO=vm_state[O000OO00O0OOO00OO]
    OO0OO0OOOO00O0O0O=O0OOO0OOOOO00O0OO >>O000OO00O0OOO00OO
    vm_state[O0O0O0OO000O0OO0O]=OO0OO0OOOO00O0O0O
    return
def operation_shl(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    O000O00O0OOOO0000=vm_state[param1_var_id]
    O000O00O0OOOO0000=O000O00O0OOOO0000.decode("utf-8")
    OOOO0OOOOO000OOOO=vm_state[param2_var_id]
    OOOO0OOOOO000OOOO=OOOO0OOOOO000OOOO.decode("utf-8")
    if OOOO0OOOOO000OOOO.isdigit():
        OOOO0OOOOO000OOOO=int(OOOO0OOOOO000OOOO)
    else:
        OOOO0OOOOO000OOOO=vm_state[OOOO0OOOOO000OOOO]
    OOO0OO00OO0O00OOO=vm_state[param3_var_id]
    OOO0OO00OO0O00OOO=OOO0OO00OO0O00OOO.decode("utf-8")
    if OOO0OO00OO0O00OOO.isdigit():
        OOO0OO00OO0O00OOO=int(OOO0OO00OO0O00OOO)
    else:
        OOO0OO00OO0O00OOO=vm_state[OOO0OO00OO0O00OOO]
    OO00OOOOO0OOOO0OO=OOOO0OOOOO000OOOO<<OOO0OO00OO0O00OOO
    vm_state[O000O00O0OOOO0000]=OO00OOOOO0OOOO0OO
    return
def operation_eval_eval(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    flag_is_good_var_id=1001
    param1=vm_state[param1_var_id]
    param1=param1.decode("utf-8")
    param2=vm_state[param2_var_id]
    param2=param2.decode("utf-8")
    if param2.isdigit():
        param2=int(param2)
    else:
        param2=vm_state[param2]
    fn=eval(param1)
    O00O0OO00000OOO0O=fn(param2)
    vm_state[flag_is_good_var_id]=O00O0OO00000OOO0O
    return
def operation_eval_void(vm_state):
    param1_var_id=2001
    flag_is_good_var_id=1001
    param1=vm_state[param1_var_id]
    param1=param1.decode("utf-8")
    fn=eval(param1)
    res=fn()
    vm_state[flag_is_good_var_id]=res
    return
def operation_halt_with_result(vm_state):
    param1_var_id=2001
    flag_is_good_var_id=1001
    param1=vm_state[param1_var_id]
    param1=param1.decode("utf-8")
    if param1.isdigit():
        param1=int(param1)
    else:
        param1=vm_state[param1]
    vm_state[flag_is_good_var_id]=param1
    return
def operation_get_flagisgood(vm_state):
    param1_var_id=2001
    flag_is_good_var_id=1001
    param1=vm_state[param1_var_id]
    param1=param1.decode("utf-8")
    OOOOO000OO0OOOOOO=vm_state[flag_is_good_var_id]
    vm_state[param1]=OOOOO000OO0OOOOOO
    return
def operation_jump_equal(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    ip_var_id=1000
    param1=vm_state[param1_var_id]
    param1=param1.decode("utf-8")
    param1=int(param1)
    param2=vm_state[param2_var_id]
    param2=param2.decode("utf-8")
    if param2.isdigit():
        param2=int(param2)
    else:
        param2=vm_state[param2]
    param3=vm_state[param3_var_id]
    param3=param3.decode("utf-8")
    if param3.isdigit():
        param3=int(param3)
    else:
        param3=vm_state[param3]
    if param2==param3:
        vm_state[ip_var_id]=param1
    return
def operation_jump_not_equal(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    ip_var_id=1000
    O0O0O0OO0OOOO0O0O=vm_state[param1_var_id]
    O0O0O0OO0OOOO0O0O=O0O0O0OO0OOOO0O0O.decode("utf-8")
    O0O0O0OO0OOOO0O0O=int(O0O0O0OO0OOOO0O0O)
    O0OO000O0O0000O00=vm_state[param2_var_id]
    O0OO000O0O0000O00=O0OO000O0O0000O00.decode("utf-8")
    if O0OO000O0O0000O00.isdigit():
        O0OO000O0O0000O00=int(O0OO000O0O0000O00)
    else:
        O0OO000O0O0000O00=vm_state[O0OO000O0O0000O00]
    OO00O000OOO0OOO00=vm_state[param3_var_id]
    OO00O000OOO0OOO00=OO00O000OOO0OOO00.decode("utf-8")
    if OO00O000OOO0OOO00.isdigit():
        OO00O000OOO0OOO00=int(OO00O000OOO0OOO00)
    else:
        OO00O000OOO0OOO00=vm_state[OO00O000OOO0OOO00]
    if O0OO000O0O0000O00 !=OO00O000OOO0OOO00:
        vm_state[ip_var_id]=O0O0O0OO0OOOO0O0O
    return
def operation_jump_less(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    ip_var_id=1000
    OO0OOO0O0O0000000=vm_state[param1_var_id]
    OO0OOO0O0O0000000=OO0OOO0O0O0000000.decode("utf-8")
    OO0OOO0O0O0000000=int(OO0OOO0O0O0000000)
    O0OOO0O000O00OO0O=vm_state[param2_var_id]
    O0OOO0O000O00OO0O=O0OOO0O000O00OO0O.decode("utf-8")
    if O0OOO0O000O00OO0O.isdigit():
        O0OOO0O000O00OO0O=int(O0OOO0O000O00OO0O)
    else:
        O0OOO0O000O00OO0O=vm_state[O0OOO0O000O00OO0O]
    OOO0OOO00O0000O0O=vm_state[param3_var_id]
    OOO0OOO00O0000O0O=OOO0OOO00O0000O0O.decode("utf-8")
    if OOO0OOO00O0000O0O.isdigit():
        OOO0OOO00O0000O0O=int(OOO0OOO00O0000O0O)
    else:
        OOO0OOO00O0000O0O=vm_state[OOO0OOO00O0000O0O]
    if O0OOO0O000O00OO0O<OOO0OOO00O0000O0O:
        vm_state[ip_var_id]=OO0OOO0O0O0000000
    return
def operation_jump_greater_than_or_equal(vm_state):
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    ip_var_id=1000
    OO000OOOO00OO0OOO=vm_state[param1_var_id]
    OO000OOOO00OO0OOO=OO000OOOO00OO0OOO.decode("utf-8")
    OO000OOOO00OO0OOO=int(OO000OOOO00OO0OOO)
    O00000OO000OO00O0=vm_state[param2_var_id]
    O00000OO000OO00O0=O00000OO000OO00O0.decode("utf-8")
    if O00000OO000OO00O0.isdigit():
        O00000OO000OO00O0=int(O00000OO000OO00O0)
    else:
        O00000OO000OO00O0=vm_state[O00000OO000OO00O0]
    OO00OOOO00O000OOO=vm_state[param3_var_id]
    OO00OOOO00O000OOO=OO00OOOO00O000OOO.decode("utf-8")
    if OO00OOOO00O000OOO.isdigit():
        OO00OOOO00O000OOO=int(OO00OOOO00O000OOO)
    else:
        OO00OOOO00O000OOO=vm_state[OO00OOOO00O000OOO]
    if O00000OO000OO00O0 >=OO00OOOO00O000OOO:
        vm_state[ip_var_id]=OO000OOOO00OO0OOO
    return
def jump_to_decimal_string(vm_state):
    param1_var_id=2001
    ip_var_id=1000
    next_ip=vm_state[param1_var_id]
    next_ip=next_ip.decode("utf-8")
    next_ip=int(next_ip)
    vm_state[ip_var_id]=next_ip
    return
def run(code ,flag):
    vmvars_maybe=dict()
    ip_var_id=1000
    flag_is_good_var_id=1001
    param1_var_id=2001
    param2_var_id=2002
    param3_var_id=2003
    param4_var_id=2004
    vmvars_maybe[ip_var_id]=0
    vmvars_maybe[flag_is_good_var_id]=0
    vmvars_maybe["flag"]=flag
    vm_halted=0
    while vm_halted==0:
        instruction_pointer=vmvars_maybe[ip_var_id]
        opcode=code[instruction_pointer]
        textual = str(opcode)
        instruction_pointer=instruction_pointer+1
        num_params=code[instruction_pointer]
        instruction_pointer=instruction_pointer+1
        if 0<num_params:
            param1_size=code[instruction_pointer]
            instruction_pointer=instruction_pointer+1
            param1_begin=instruction_pointer
            param1_end=instruction_pointer+param1_size
            param1=code[param1_begin:param1_end]
            vmvars_maybe[param1_var_id]=param1
            instruction_pointer=instruction_pointer+param1_size
            textual += " [" + str(param1_size) + "] " + str(param1)
        if 1<num_params:
            param2_size=code[instruction_pointer]
            instruction_pointer=instruction_pointer+1
            param2_begin=instruction_pointer
            param2_end=instruction_pointer+param2_size
            param2=code[param2_begin:param2_end]
            vmvars_maybe[param2_var_id]=param2
            instruction_pointer=instruction_pointer+param2_size
            textual += " [" + str(param2_size) + "] " + str(param2)
        if 2<num_params:
            param3_size=code[instruction_pointer]
            instruction_pointer=instruction_pointer+1
            param3_begin=instruction_pointer
            param3_end=instruction_pointer+param3_size
            param3=code[param3_begin:param3_end]
            vmvars_maybe[param3_var_id]=param3
            instruction_pointer=instruction_pointer+param3_size
            textual += " [" + str(param3_size) + "] " + str(param3)
        if 3<num_params:
            param4_size=code[instruction_pointer]
            instruction_pointer=instruction_pointer+1
            param4_begin=instruction_pointer
            param4_end=instruction_pointer+param4_size
            param4=code[param4_begin:param4_end]
            vmvars_maybe[param4_var_id]=param4
            instruction_pointer=instruction_pointer+param4_size
            textual += " [" + str(param4_size) + "] " + str(param4)
        print textual
        vmvars_maybe[ip_var_id]=instruction_pointer
        print (opcode, vmvars)
        if opcode==0:
            operation_assign_addr_decimal(vmvars_maybe)
        elif opcode==2:
            operation_assign_to_dict(vmvars_maybe)
        elif opcode==8:
            operation_jump_greater_than_or_equal(vmvars_maybe)
        elif opcode==11:
            jump_to_decimal_string(vmvars_maybe)
        elif opcode==34:
            operation_get_from_dict(vmvars_maybe)
        elif opcode==41:
            operation_eval_eval(vmvars_maybe)
        elif opcode==44:
            operation_eval_void(vmvars_maybe)
        elif opcode==49:
            operation_jump_less(vmvars_maybe)
        elif opcode==72:
            operation_get_flagisgood(vmvars_maybe)
        elif opcode==74:
            operation_halt_with_result(vmvars_maybe)
        elif opcode==81:
            operation_jump_equal(vmvars_maybe)
        elif opcode==82:
            operation_assign_addr_dereferenced(vmvars_maybe)
        elif opcode==91:
            operation_jump_not_equal(vmvars_maybe)
        elif opcode==99:
            operation_sliceXY(vmvars_maybe)
        elif opcode==102:
            operation_add(vmvars_maybe)
        elif opcode==111:
            operation_bitwise_or(vmvars_maybe)
        elif opcode==131:
            operation_bitwise_and(vmvars_maybe)
        elif opcode==151:
            operation_shl(vmvars_maybe)
        elif opcode==171:
            operation_shr(vmvars_maybe)
        elif opcode==186:
            operation_xor(vmvars_maybe)
        instruction_pointer=vmvars_maybe[ip_var_id]
        if opcode==74:
            vm_halted=1
    flag_is_good=vmvars_maybe[flag_is_good_var_id]
    return flag_is_good
