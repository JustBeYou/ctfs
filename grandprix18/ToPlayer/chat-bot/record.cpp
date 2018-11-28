#include "record.hpp"

void Record::printRecord() {
	std::cout << "Phrase: " << phrase << std::endl;
	std::cout << "Responses: " << std::endl;
	for (size_t i = 0; i < responses.size(); i++) {
			std::cout << '\t' << responses.at(i) << std::endl;
	}
}
