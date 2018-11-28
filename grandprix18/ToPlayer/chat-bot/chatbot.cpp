#include <ctime>
#include <string>
#include <vector>
#include <fstream>
#include <sstream>
#include <cstdlib>
#include <cstdio>
#include <iostream>
#include <map>
#include <cassert>
#include <cstring>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <sys/types.h> 
#include "record.hpp"
#include "string_functions.hpp"
#include "../A51-crypto/crypto.h"


#define ENABLE_LOG 1

class FileLog {
	public:
		FileLog(const char* fileName) {
			if (ENABLE_LOG) {
				// get time
				time_t rawtime;
				struct tm * timeinfo;
				char timeBuf[80];

				time (&rawtime);
				timeinfo = localtime(&rawtime);

				strftime(timeBuf,sizeof(timeBuf),".%d-%m-%Y_%I-%M-%S.log",timeinfo);
				std::string file = fileName; file += timeBuf;
				f.open(file.c_str());
			}
		}
		~FileLog() {if (ENABLE_LOG) f.close();}
		template<typename T>
		void log(const T& obj) {
			if (ENABLE_LOG) {
				f << obj << '\n'; f.flush();
			}
		}
	private:
		std::ofstream f;
};

std::vector<std::string> readLinesIntoArr(std::ifstream &file) {
		std::string line;
		std::vector<std::string> fileLines;

		while(std::getline(file, line)) {
				fileLines.push_back(line);
		}
		
		if (DEBUG) {
			std::cout << "===============lines==============\n";
			for(auto line: fileLines) {
				std::cout << line << "\n";
			}
			std::cout << "=============end-lines============\n";
		}

		return fileLines;
}

std::vector<Record> getRecords(std::string fileName) {
		const std::string phraseTag = "<phrase>";
		const std::string respTag = "<response>";
		std::vector<Record> records;
		std::vector<std::string> rawFile; 
		std::vector<std::string> splitString; 
		std::string line;
		char delim = '>';
		std::ifstream file(fileName.c_str());
		rawFile = readLinesIntoArr(file);
		Record *curRec;


		for(size_t i = 0;i < rawFile.size();i++) {
				line = rawFile[i];
				if(line.find(phraseTag) != std::string::npos) { // if this line defines a phrase
						Record tempRec;
						splitString = split(line, delim);
						tempRec.phrase = splitString[1];
						trim(tempRec.phrase);
						records.push_back(tempRec);
						curRec = &records[records.size()-1];
				} else if (line.find(respTag) != std::string::npos) {
						splitString = split(line, delim);
						trim(splitString[1]);
						curRec->responses.push_back(splitString[1]);
				}
		}

		return records;
}

std::string getResponse(std::string input, std::vector<Record> records) {
		std::string response;
		std::vector<std::string> words = split(input, ' ');
		int total = levenshtein_distance(input, records[0].phrase);
		int index = 0;

		// go through each response and each word in the smalles levenshtien distance
		for (size_t i = 1; i < records.size(); i++) {
				int tempTotal = levenshtein_distance(input, records[i].phrase);
				if(tempTotal <= total) {
						total = tempTotal;
						index = i;
				}
		}

		int randIndex = rand() % records[index].responses.size();
		response = records[index].responses[randIndex];

		return response;
}

void getSecretKeys(std::map<std::string, uint64_t>& secretKeys, char* fileName)
{
	std::ifstream file;
	file.open(fileName, std::ios_base::in);
	if (!file) {
		std::cerr << "Cannot open file " << fileName << "\n";
		exit(1);
	}
	std::vector<std::string> lines = readLinesIntoArr(file);
	for(size_t i = 0; i < lines.size(); ++i) {
		std::string line = lines[i];
		trim(line);
		if (line == "") continue;
		if (DEBUG) std::cout << "[" << line << "]\n";
		std::vector<std::string> tokens = split(line, ':');
		secretKeys[tokens[0]] = std::stoll(tokens[1], 0, 16); // hexa value
	}
}

void getSuperSecretKey(uint64_t& superSecretKey, char* fileName)
{
	std::ifstream file(fileName);
	file >> std::hex >> superSecretKey;
}

std::string getSecretData(char* filename)
{
	std::string data;
	std::ifstream file(filename);
	std::getline(file, data);
	return data;
}
 
char* readline(int fd, char* buffer, size_t len) // same as fgets
{
	char c;
	assert(len != 0);
	size_t counter = 0;
	while(true) {
		if (len-1 == counter) {
			buffer[len-1] = 0;
			return buffer;
		}
		if (read(fd, &c, 1) != 1) return 0; // some error
		buffer[counter] = c;
		counter++;
		if (c == '\n') {
			buffer[counter] = 0;
			return buffer;
		}
	}
}
 
#define BUFF_LEN 100
#define COMM_TIMEOUT 30
int chatbot(int fd, struct sockaddr* clientaddress, char** argv) { //<record-file> <secret-key-file> <super-secret-key-file>
	std::string sInput;
	std::string sResponse = "";
	std::vector<Record> records;
	std::map<std::string, uint64_t> secretKeys;
	std::map<std::string, uint64_t>::iterator it;
	std::string partnerId;
	uint64_t secretKey, superSecretKey;
	char buffer[BUFF_LEN];
	bool superMode = false;
	int n;
	
	// set up stdout, stderr, cout, cerr
	setbuf(stdout, NULL);
	setbuf(stderr, NULL);
	std::cout.setf(std::ios::unitbuf);
	std::cerr.setf(std::ios::unitbuf);

	// get client ip
	struct sockaddr_in* pV4Addr = (struct sockaddr_in*)clientaddress;
	char ip[INET_ADDRSTRLEN];
	strcpy(ip, inet_ntoa(pV4Addr->sin_addr));
	// get log file
	std::string logFile("/tmp/");
	logFile += ip;
	FileLog l(logFile.c_str());
	
	records = getRecords(argv[1]);
	
	getSecretKeys(secretKeys, argv[2]);
	if (DEBUG) {
		std::cout << "============secretkeys=============\n";
		for (auto it = secretKeys.begin(); it != secretKeys.end(); it++)
		{
			std::cout << it->first << ':' << it->second << "\n";
		}
		std::cout << "==========end-secretkey============\n";
	}

	n = snprintf(buffer, BUFF_LEN, "==============Set up communication===============\n");
	write(fd, buffer, n);
	// get partner id
	l.log("Getting id");
	n = snprintf(buffer, BUFF_LEN, "Your id: ");
	write(fd, buffer, n);
	assert(readline(fd, buffer, BUFF_LEN) != 0);
	buffer[strcspn(buffer, "\n")] = 0;
	partnerId = std::string(buffer);
	l.log(partnerId);
	// get secret key according to the id
	it = secretKeys.find(partnerId);
	if (it == secretKeys.end()) {
		n = snprintf(buffer, BUFF_LEN, "Your id %s does not exist\n", partnerId.c_str());
		write(fd, buffer, n);
		if (DEBUG) {std::cout << "Id " << partnerId << "not exist\n";}
		l.log("Id not found");
		return 1;
	}
	l.log("Id found");
	secretKey = it->second;
	n = snprintf(buffer, BUFF_LEN, "Your id is found. Enter encrypted mode!\n");
	write(fd, buffer, n);
	A51Comm a51Comm(secretKey, COMM_TIMEOUT, fd, fd);
	if (DEBUG) {std::cout << "Enter encrypted mode\n";}
	while(1) {
		if (!a51Comm.receive(sInput)) {
			// some error occured
			std::cerr << "Some error occured at receive\n";
			return 1;
		}
		l.log("Got: "); l.log(sInput);
		if (DEBUG) {std::cout << "Got: " << sInput << "\n";}
		if (sInput == "quit") {
			l.log("quit");
			if (DEBUG) {std::cout << "quit\n";}
			break;
		} else if (sInput == "super") {
			superMode = true;
			if (!a51Comm.send(std::string("Enter supper mode!"))) {
				// some error occured
				std::cerr << "Some error occured at send\n";
				return (1);
			}
			l.log("Enter super mode");
			getSuperSecretKey(superSecretKey, argv[3]);
			a51Comm = A51Comm(superSecretKey, COMM_TIMEOUT, fd, fd);
		} else if (sInput == "secret") {
			if (!superMode) {
				if (!a51Comm.send(std::string("You have not entered super mode!"))) {
					// some error occured
					std::cerr << "Some error occured at send\n";
					return (1);
				}
				l.log("Have not entered super mode!");
			} else {
				std::string data = "Secret: ";
				data += getSecretData(argv[4]);
				if (!a51Comm.send(data)) {
					// some error occured
					std::cerr << "Some error occured at send\n";
					return (1);
				}
				l.log("Sent secret");
			}
		} else {
			sResponse = getResponse(sInput, records);
			if (!a51Comm.send(sResponse)) {
				// some error occured
				std::cerr << "Some error occured at send\n";
				return (1);
			}
			l.log(sResponse);
		}
	}

	return (0);
}
