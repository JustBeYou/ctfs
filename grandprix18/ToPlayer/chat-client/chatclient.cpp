#include <stdio.h>
#include <stdlib.h>
#include <cassert>
#include <netdb.h>
#include <netinet/in.h>

#include <string.h>
#include <unistd.h>
#include <string>

#include "../A51-crypto/crypto.h"

#define BUFF_LEN 100
#define COMM_TIMEOUT 30

int readUntil(int fd, std::string &output, const std::string& mark)
{
   char c;
   int ret;
   output = "";
   while(1) {
      ret = read(fd, &c, 1);
      if (ret != 1) return -1;
      output += c;
      if (std::string::npos != output.find(mark)) return 1;
   }
}

int main(int argc, char *argv[]) {
   int sockfd, portno, n;
   struct sockaddr_in serv_addr;
   struct hostent *server;
   uint64_t key;
   std::string input;
   char buffer[BUFF_LEN], buffer1[BUFF_LEN];
   
   if (argc < 3) {
      fprintf(stderr,"Usage %s hostname port\n", argv[0]);
      exit(1);
   }
	
   portno = atoi(argv[2]);
   
   /* Create a socket point */
   sockfd = socket(AF_INET, SOCK_STREAM, 0);
   
   if (sockfd < 0) {
      perror("ERROR opening socket");
      exit(1);
   }
	
   server = gethostbyname(argv[1]);
   
   if (server == NULL) {
      fprintf(stderr,"ERROR, no such host\n");
      exit(0);
   }
   
   bzero((char *) &serv_addr, sizeof(serv_addr));
   serv_addr.sin_family = AF_INET;
   bcopy((char *)server->h_addr, (char *)&serv_addr.sin_addr.s_addr, server->h_length);
   serv_addr.sin_port = htons(portno);
   
   /* Now connect to the server */
   if (connect(sockfd, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) < 0) {
      perror("ERROR connecting");
      exit(1);
   }
   
   // get id
   readUntil(sockfd, input, "Your id: ");
   printf("%s", input.c_str()); 
   memset(buffer, 0, BUFF_LEN);
   fgets(buffer, BUFF_LEN, stdin);
   assert(write(sockfd, buffer, strlen(buffer)) != -1);
   // check if id found
   n = readUntil(sockfd, input, "\n");
   if (input.find("Enter encrypted mode") == std::string::npos) {
	   // id not found
	  printf("%s", input.c_str());
      exit(1);
   }
   // id found
   // get key
   printf("Input your key: ");
   fgets(buffer1, BUFF_LEN, stdin);
   key = std::stoll(buffer1, 0, 16);
   printf("%s", input.c_str());
   
   A51Comm a51Comm(key, COMM_TIMEOUT, sockfd, sockfd);
   while(true) {
	   fgets(buffer, BUFF_LEN, stdin);
	   buffer[strcspn(buffer, "\n")] = 0;
	   if (!a51Comm.send(std::string(buffer))) {
		// some error occured
		fprintf(stderr, "Some error occured at send\n");
		exit(1);
		}
		if (!a51Comm.receive(input)) {
			// some error occured
			fprintf(stderr, "Some error occured at receive\n");
			exit(1);
		}
		puts(input.c_str());
   }
   return 0;
}