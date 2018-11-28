#ifndef __UTILS_H__
#define __UTILS_H__
#include <string>
std::string toHexString(const std::string & str);
char* readn(int fd, char* buffer, size_t len);
#endif // __UTILS_H__