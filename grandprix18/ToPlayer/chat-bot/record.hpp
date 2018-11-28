#ifndef RECORD_H
#define RECORD_H

#include <string>
#include <vector>
#include <iostream>

class Record {
		public:
				std::string phrase;
				std::vector<std::string> responses;
				void printRecord();
};

#endif
