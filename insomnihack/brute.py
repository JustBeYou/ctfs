import os
import string

User='73FF9B24EF8DE48C346D93FADCEE01151B0A1644BC81'

for i in string.hexdigits:
	for j in string.hexdigits:
		os.system('./junk {} {}'.format(User,i+41*'a'+j ) )
