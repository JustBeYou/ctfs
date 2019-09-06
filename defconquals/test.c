#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <wasi/core.h>
#include <sys/mman.h>

size_t this_is_what_ive_got(){
    char msg[] = "sssalut baieti\n";
    write(1, msg, sizeof(msg));
    void *p = malloc(10);
    //read(0, msg, 4);
    memcpy(p, "pula!", 5); 

    return *(char*)!!!;
}
