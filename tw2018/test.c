#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main() {
    close(0);
    close(1);
    close(2);

    char s1[] = "/proc/self/fd/0";
    char s2[] = "/proc/self/fd/1";
    int fd = open(s1, O_RDONLY, 0);
    fd = open(s2, O_WRONLY, 0);

    write(fd, "test\n", 5);
}
