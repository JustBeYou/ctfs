from angr import *
strs=["dqzkenxmpsdoe_qkihmd","jffglzbo_zghqpnqqfjs","kdwx_vl_rnesamuxugap","ozntzohegxagreedxukr","xujaowgbjjhydjmmtapo","pwbzgymqvpmznoanomzx","qaqhrjofhfiuyt_okwxn","a_anqkczwbydtdwwbjwi","zoljafyuxinnvkxsskdu","irdlddjjokwtpbrrr_yj","cecckcvaltzejskg_qrc","vlpwstrhtcpxxnbbcbhv","spirysagnyujbqfhldsk","bcyqbikpuhlwordznpth","_xkiiusddvvicipuzyna","wsxyupdsqatrkzgawzbt","ybg_wmftbdcvlhhidril","ryvmngilaqkbsyojgify","mvefjqtxzmxf_vcyhelf","hjhofxwrk_rpwli_mxv_","enupmannieqqzcyevs_w","uhmvvb_cfgjkggjpavub","gktdphqiswomuwzvjtog","lgoehepwclbaifvtfoeq","nm_uxrukmof_fxsfpcqz","ttsbclzyyuslmutcylcm"]

p = Project('./gibberish_check')

def callback(state):
    print ("breakpoint!")

s = p.factory.entry_state(stdin="aaaaaaaaaaaaa\n")
s.inspect.b('mem_read', mem_read_address=0x4026c2, action=callback)
mgr = p.factory.simulation_manager(s)
mgr.run()
