#include <sys/syscall.h>
#include <sys/types.h>

#define NULL ((void*)0)
#define CLOCK_PROCESS_CPUTIME_ID 2

#define TESTS_COUNT 5000ul

long syscall(long, ...);
void _exit(int status) __attribute__((noreturn));
pid_t vfork(void) __attribute__((returns_twice));

static pid_t wait(int *wstatus) {
    return syscall(SYS_wait4, -1, wstatus, 0, NULL);
}

static clock_t clock(void) {
    struct timespec {
        clock_t tv_sec;
        long tv_nsec;
    } ts;

    if (syscall(SYS_clock_gettime, CLOCK_PROCESS_CPUTIME_ID, &ts) < 0) {
        return -1;
    }

    return ts.tv_sec * 1000000ll + ts.tv_nsec / 1000ll;
}

static pid_t fork(void) {
    return syscall(SYS_fork);
}

static long strlen(const char *s) {
    long len = 0;
    while (*s++) len++;
    return len;
}

static void strrev(char *s) {
    long len = strlen(s),
         i = 0;
    char tmp;

    for (i = 0; i < len/2; ++i) {
        tmp = s[len - 1 - i];
        s[len - 1 - i] = s[i];
        s[i] = tmp;
    }
}

static void ltoa(long x, char *buf) {
    unsigned long i = 0;

    if (x < 0) {
        buf[0] = '-';
        buf += 1;
        x = -x;
    } else if (x == 0) {
        buf[0] = '0';
        buf[1] = '\0';
        return;
    }

    while (x) {
        buf[i++] = '0' + x % 10;
        x /= 10;
    }
    buf[i] = '\0';

    strrev(buf);
}

static void print_str(const char *s) {
    long len = strlen(s);

    syscall(SYS_write, 1, s, len);
}

static void print_long(long x) {
    char buf[0x20] = { 0 };
    ltoa(x, buf);
    print_str(buf);
}

static int test(size_t n, pid_t (*f)(void)) {
    size_t i;
    pid_t p;

    for (i = 0; i < n; ++i) {
        p = f();
        if (p < 0) {
            return -1;
        } else if (p == 0) {
            _exit(0);
        } else {
            wait(NULL);
        }
    }

    return 0;
}

int main(void) {
    clock_t t1, t2;
    long d1, d2;

    if ((t1 = clock()) == (clock_t) -1) {
        return 1;
    }
    if (test(TESTS_COUNT, fork) < 0) {
        return 1;
    }
    if ((t2 = clock()) == (clock_t) -1) {
        return 1;
    }
    d1 = t2 - t1;
    if ((t1 = clock()) == (clock_t) -1) {
        return 1;
    }
    if (test(TESTS_COUNT, vfork) < 0) {
        return 1;
    }
    if ((t2 = clock()) == (clock_t) -1) {
        return 1;
    }
    d2 = t2 - t1;

    print_long(TESTS_COUNT);
    print_str(" runs\n");
    print_str("fork:    ");
    print_long(d1);
    print_str("\n");
    print_str("vfork:   ");
    print_long(d2);
    print_str("\n");

    return 0;
}
