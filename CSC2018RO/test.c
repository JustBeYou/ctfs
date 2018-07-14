#include <vector>
#include <string>
#include <iostream>
#include <iomanip>
#include <algorithm>
#include <initializer_list>
#include <openssl/aes.h>

#define AES_BLOCK_SIZE 16

typedef unsigned char byte;

template <size_t multiple> size_t round_up(const size_t len)
{
    if (len % multiple == 0) return len;
    else return ((len / multiple) + 1) * multiple;
}

std::ostream &print_buffer_as_hex(std::ostream &o, const unsigned char *buf, size_t size)
{
    o << std::hex << std::setfill('0');
    for( size_t i = 0; i < size; ++i )
    {
        o << std::setw(2) << static_cast<unsigned int>(buf[i]);
    }
    return o << std::dec;
}

inline std::ostream &operator<<(std::ostream &o, const std::vector<byte> &buf)
{
    return print_buffer_as_hex(o, reinterpret_cast<const unsigned char*>(&buf[0]), buf.size());
}

// Make a Key of exactly 32 bytes, truncates or adds values if it's necessary
std::string AES_NormalizeKey(const void *const apBuffer, size_t aSize)
{
    static const unsigned char key32[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31};
    const char *const Buffer = reinterpret_cast<const char *>(apBuffer);
    std::string Result(reinterpret_cast<const char *>(key32), 32);
    std::copy(Buffer, Buffer + ((aSize < 32)? aSize: 32), Result.begin());
    return Result;
}

// Encrypt using AES cbc
std::string AESEncrypt(const void *const apBuffer, size_t aBufferSize, const void *const apKey, size_t aKeySize, std::vector<byte> &aIVector)
{
    // Create IVector.
    unsigned char AES_IVector[AES_BLOCK_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
    aIVector.resize(sizeof(AES_IVector));
    std::copy(std::begin(AES_IVector), std::end(AES_IVector), aIVector.begin());

    // Create key.
    const std::string Key(AES_NormalizeKey(apKey, aKeySize));
    //std::cout << "(Normalized key: ";
    //print_buffer_as_hex(std::cout, (const unsigned char*)Key.data(), Key.size()) << ")\n";
    AES_KEY EncryptKey;
    AES_set_encrypt_key(reinterpret_cast<const unsigned char *>(Key.data()), 256, &EncryptKey);

    // Encrypt.
    unsigned char AES_Encrypted[1024] = {0};
    AES_cbc_encrypt(static_cast<const unsigned char *>(apBuffer), AES_Encrypted, aBufferSize, &EncryptKey, AES_IVector, AES_ENCRYPT);
    const std::string Encrypted(reinterpret_cast<const char *>(AES_Encrypted), round_up<AES_BLOCK_SIZE>(aBufferSize));

    // Finish.
    return Encrypted;
};

// Decrypt using AES cbc
std::string AESDecrypt(const void *const apBuffer, size_t aBufferSize, const void *const apKey, size_t aKeySize, std::vector<byte> &aIVector)
{
    // Read IVector.
    unsigned char AES_IVector[AES_BLOCK_SIZE] = {0};
    std::copy(aIVector.begin(), aIVector.end(), std::begin(AES_IVector));

    // Create Key.
    const std::string Key((char*) apKey);
    //std::cout << "(Normalized key: ";
    //print_buffer_as_hex(std::cout, (const unsigned char*)Key.data(), Key.size()) << ")\n";
    AES_KEY DecryptKey;
    AES_set_decrypt_key(reinterpret_cast<const unsigned char *>(Key.data()), 256, &DecryptKey);

    // Decrypt.
    unsigned char AES_Decrypted[1024] = {0};
    AES_cbc_encrypt(static_cast<const unsigned char *>(apBuffer), AES_Decrypted, aBufferSize, &DecryptKey, AES_IVector, AES_DECRYPT);
    const std::string Decrypted(reinterpret_cast<const char *>(AES_Decrypted));

    // Finish.
    return Decrypted;
};

// Entry point

void brute_force() {
    typedef std::vector<std::string> vs;
    vs a;
    

    char key[] = { 0x31, 0x35, 0x33, 0x30, 0x39, 0x39, 0x37, 0x39, 0x31, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,   0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f, 0xa};
    char data[] = { 0xE2, 0xE0, 0x42, 0xD5, 0xB4, 0xDE, 0x82, 0x0D, 0x6A, 0x13, 0x71, 0x9A, 0x8A, 0xCA, 0x74, 0xA6};
    std::string data_str = std::string(data);
    std::string key_str = std::string(key);
    std::vector<byte> IV;

    std::string d(AESDecrypt(data_str.data(), data_str.size(), key_str.data(), key_str.size(), IV));
    std::cout << d << std::endl; 

    /*for (int64_t start_time = 1530987794; start_time < 1530987794 + 3000; start_time++) {
        std::string key = std::to_string(start_time) + std::string(":;<=>?@ABCDEFGHIJKLMNO");
        std::cout << key << std::endl;

        std::string d(AESDecrypt(data_str.data(), data_str.size(), key.data(), key.size(), IV));
        std::cout << IV << std::endl;
        std::cout << d << std::endl;
    }*/
}

int main(int argc, char **argv)
{
   /* typedef std::vector<std::string> vs;
    vs a;

    for (vs::size_type Index = 0; Index < static_cast<unsigned>(argc); ++Index)
    {
        a.push_back(argv[Index]);
    }

    if (a.size() == 3)
    {
        std::vector<byte> IV;

        std::string e(AESEncrypt(a.at(1).data(), a.at(1).size(), a.at(2).data(), a.at(2).size(), IV));
            std::cout << "Encrypting : " << a.at(1) << "\n"
                      << "With Key   : " << a.at(2) << "\n"
                      << "Init Vec   : " << IV << "\n"
                      << "Becomes    : " << e << "\n";

        std::string d(AESDecrypt(e.data(), e.size(), a.at(2).data(), a.at(2).size(), IV));
            std::cout << "Decrypting : " << e << "\n"
                      << "With Key   : " << a.at(2) << "\n"
                      << "Init Vec   : " << IV << "\n"
                      << "Becomes    : " << d << "\n";
    }*/
    brute_force();
    std::cout.flush();

    return 0;
}
