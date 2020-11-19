#include <bits/stdc++.h>

using namespace std;

unsigned char data[] = {0xed, 0x2f, 0xe1, 0xd3, 0x49, 0xb6, 0x44, 0x49, 0xf, 0x1e, 0x58, 0x5d, 0x60, 0xc1, 0x86, 0xdf, 0xea, 0xa2, 0x8, 0x62, 0x68, 0x89, 0x34, 0xec, 0x88, 0xf5, 0xf2, 0x11, 0xa8, 0xa4, 0x46, 0x1, };

int main() {
	char tempFlagVar[100] = "\x00";

	int iVar5 = 0;
	int iVar1;
	do {
		char pbVar4 = data[iVar5];	
		iVar1 = iVar5 * 2;
		iVar5 = iVar5 + 1;
		printf("%02X ", (unsigned int)pbVar4);
	} while (iVar5 != 8);

	iVar5 = 0x18;
  	do {
		char pbVar4 = data[iVar5];	
    	iVar1 = iVar5 * 2;
    	iVar5 = iVar5 + 1;	
		printf("%02X ", (unsigned int)pbVar4);

  	} while (iVar5 != 0x20);

	printf("\nFlag ECSC{%s}\n", tempFlagVar);

	return 0;
}
