enc = "997335c2ec3f5a010984263bec51f32aecfcdab9eeb063b7d237b105f954ab497de726c4835fcd5f612aa0927739a7459e22f83a30c2c19e856b5621f2ba78d6b1d6dfd54a6c210dfcbce86744699e9be90cdffb3da1a8eb877bef2584bb02e26713ab491953c8fc9b03bd66ef39124c2633044d6cf3fec9d76c0b0c75eeacbc"
plain = "Your OTP for transaction #731337 in ABCXYZ Bank is 744343781."

plain = "".join("{}".format(hex(ord(c))[2:]) for c in plain)
print (plain)

print (len(enc), len(plain))

print (0x99 ^ 744343781)

otp = 744343781
