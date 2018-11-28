#ifndef __CRYPTO_H__
#define __CRYPTO_H__
#include "A51.h"
#include <stdint.h>
#include <string>
/*
@param key: 8 byte long; input
@param data: byte array; data to be encrypted/decrypted
@param len: int; length of data
@return: byte array; output of decrypted/encrypted data; allocated with malloc
*/
byte* encrypt(const byte* key, const byte* data, int len);
byte* decrypt(const byte* key, const byte* data, int len);

/*
Encrypted communication with shared private key.
Session key is derived from timestamp.
Timestamp is modified each time-out second interval.
API:
	send: send data into socket. Data is encrypted before sending.
	receive: receive data from socket. Data is decrypted before return.
*/
class A51Comm {
	public:
		A51Comm(uint64_t aKey, int aTimeout, int aFdIn, int aFdOut);
		bool send(const std::string& data);
		bool receive(std::string& data);
	private:
		uint64_t timestamp;
		uint64_t partnerTimestamp;
		uint64_t timeout;
		uint64_t key;
		uint64_t sessionKey;
		uint64_t partnerSessionKey;
		int fdIn;
		int fdOut;
};

#endif // __CRYPTO_H__