#include "crypto.h"
#include "utils.h"
#include "cpptotp/src/libcppotp/otp.h"
#include "cpptotp/src/libcppotp/bytes.h"

#include <cassert>
#include <cstring>
#include <iostream>
#include <string>
#include <ctime>
#include <unistd.h>

#define BLOCK_LEN 14

byte* encrypt(const byte* aKey, const byte* data, int len)
{
	assert(len < 1000);
    byte block1[15], block2[15];
	byte key[8];
	memcpy(key, aKey, 8);
    byte* output = (byte*)malloc(len);
    assert(output != 0);
	int cOld = -1, cNew;
    for (int i = 0; i < len; ++i) {
		cNew = i/BLOCK_LEN;
		if (cOld != cNew) { // frame counter changed for each block
			cOld = cNew;
			A51_GSM(key, 64, cNew, block1, block2);
			if (DEBUG) {
				std::string d(block1, block1+BLOCK_LEN);
				std::cout << "block1: " << toHexString(d) << "\n";
			}
		}
        output[i] = data[i] ^ block1[i%BLOCK_LEN];
    }
    return output;
}

byte* decrypt(const byte* key, const byte* data, int len)
{
    return encrypt(key, data, len);
}

A51Comm::A51Comm(uint64_t aKey, int aTimeout, int aFdIn, int aFdOut)
{
	key = aKey;
	timeout = aTimeout;
	timestamp = 0;
	partnerTimestamp = 0;
	sessionKey = 0;
	fdIn = aFdIn;
	fdOut = aFdOut;
}

bool A51Comm::send(const std::string& data)
{
	// modify timestamp if timeout, and set session key
	if(time(nullptr) - timestamp > timeout) {
		timestamp = time(nullptr);
		CppTotp::Bytes::ByteString byteKey = CppTotp::Bytes::u64beToByteString(key);
		sessionKey = CppTotp::hotp(byteKey, timestamp, 9);
	}
	if (DEBUG) {std::cout << "sessionKey: " << sessionKey << "\n";}
	// encrypt data
	uint64_t dataLength = data.length();
	byte* encrypted = encrypt((const byte*)&sessionKey, (const byte*)data.c_str(), dataLength);
	// send in form: p64(timestamp) + p64(data-length) + encrypted
	write(fdOut, &timestamp, 8);
	write(fdOut, &dataLength, 8);
	write(fdOut, std::string(encrypted, encrypted + dataLength).c_str(), dataLength);
	free(encrypted);
	return true;
}

bool A51Comm::receive(std::string& data)
{
	// receive in form: p64(timestamp) + p64(data-length) + encrypted
	uint64_t mTimestamp, dataLength;
	assert(readn(fdIn, (char*)&mTimestamp, 8) != 0);
	assert(readn(fdIn, (char*)&dataLength, 8) != 0);
	if (DEBUG) {
		std::cout << "timestamp: " << mTimestamp << "\n";
		std::cout << "data-length: " << dataLength << '\n';
	}
	byte* encrypted = (byte*)malloc(dataLength);
    assert(encrypted != 0);
	assert(readn(fdIn, (char*)encrypted, dataLength) != 0);
	// modify partnerTimestamp if changed, and set partnerSessionKey
	if (partnerTimestamp != mTimestamp) { // timestamp 0 is invalid
		partnerTimestamp = mTimestamp;
		CppTotp::Bytes::ByteString byteKey = CppTotp::Bytes::u64beToByteString(key);
		partnerSessionKey = CppTotp::hotp(byteKey, partnerTimestamp, 9);
	}
	if (DEBUG) {std::cout << "partnerSessionKey: " << partnerSessionKey << "\n";}
	// decrypt data
	byte* decrypted = decrypt((const byte*)&partnerSessionKey, encrypted, dataLength);
	data = std::string(decrypted, decrypted+dataLength);
	free(encrypted);
	free(decrypted);
	return true;
}