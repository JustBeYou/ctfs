#include "utils.h"
#include <string>
#include <cassert>
#include <unistd.h>

static char nibbleToLCHex(uint8_t nib)
{
	if (nib < 0xa)
	{
		return static_cast<char>(nib + '0');
	}
	else if (nib < 0x10)
	{
		return static_cast<char>((nib - 10) + 'a');
	}
	else
	{
		assert(0 && "not actually a nibble");
		return '\0';
	}
}

std::string toHexString(const std::string & str)
{
	std::string ret;

	for (char b: str)
	{
		ret.push_back(nibbleToLCHex((b >> 4) & 0x0F));
		ret.push_back(nibbleToLCHex((b >> 0) & 0x0F));
	}

	return ret;
}

char* readn(int fd, char* buffer, size_t len)
{
	char c;
	size_t counter = 0;
	while(true) {
		if (len == counter) {
			return buffer;
		}
		if (read(fd, &c, 1) != 1) return 0; // some error
		buffer[counter] = c;
		counter++;
	}
}