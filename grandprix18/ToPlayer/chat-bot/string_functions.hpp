#ifndef STRING_FUNCTIONS_H
#define STRING_FUNCTIONS_H

#include <string>
#include <vector>
#include <sstream>

std::vector<std::string> split(std::string strToSplit, char delimeter);
size_t levenshtein_distance(const std::string &s1, const std::string &s2); 

// trim whitespace functions
void trimLeading(std::string& str);
void trimTrailing(std::string& str);
void trim(std::string& str);

#endif
