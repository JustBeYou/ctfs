#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>

#include <stdlib.h>
#include <string.h>

//compiled with gcc source.c -o source -fno-stack-protector -no-pie
//gcc (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0

//flag for source1 is WPI{Typos_are_GrEaT!}
int getpw(void){
        int res = 0;
        char pw[100];

        fgets(pw, 0x100, stdin);
        *strchrnul(pw, '\n') = 0;
        if(!strcmp(pw, getenv("SOURCE1_PW"))) res = 1;
        return res;
}

char *lesscmd[] = {"less", "source.c", 0};
int main(void){
        setenv("LESSSECURE", "1", 1);
        printf("Enter the password to get access to https://www.imdb.com/title/tt0945513/\n");
        if(!getpw()){
                printf("Pasword auth failed\nexiting\n");
                return 1;
        }

        execvp(lesscmd[0], lesscmd);
        return 0;
}

