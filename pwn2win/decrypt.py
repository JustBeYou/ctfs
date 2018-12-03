def decrypt_char(char0, char1):
	s3 = 0x3b9ad
	
	a0 = pow(char0, 2)
	s5 = a0
	s2 = 7
	s3 = s3 - 1529
	
	while True:
		if s5 <= s2: break
		
		char0 = char0 + char1
		s4 = char0 % s3
		a0 = 10
		char_0 = char1
		s2 = s2 + 1
		char1 = s4
	
	a0 = 89
	a0 = char1 % a0
	a0 = a0 + 37
	a0 = a0 & 0xff # to remain in ASCII table
	return a0
	
print (decrypt_char(10, 12))
