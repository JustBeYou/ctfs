#include <fcntl.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#include "utils.h"

int write_to_path(const char *path, const char *str) {
    int fd;
    size_t len;

    fd = open(path, O_WRONLY);
    if (fd < 0) {
        return -1;
    }

    len = strlen(str);
    if (write(fd, str, len) != len) {
        return -1;
    }

    if (close(fd) < 0) {
        return -1;
    }

    return 0;
}

int read_from_path(const char *path, char *buf, size_t len) {
    int fd;
    size_t x;

    if (len == 0) {
        return 0;
    }

    fd = open(path, O_RDONLY);
    if (fd < 0) {
        return -1;
    }

    if ((x = read(fd, buf, len - 1)) < 0) {
        return -1;
    }
    buf[x] = '\0';

    if (close(fd) < 0) {
        return -1;
    }

    return 0;
}

int has_slash(const char *name) {
    while (*name) {
        if (*name == '/') {
            return 1;
        }
        name++;
    }
    return 0;
}
