#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <grp.h>
#include <sched.h>
#include <signal.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/mount.h>
#include <sys/prctl.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

#include "trusted_loader.h"
#include "utils.h"

static pid_t loader_pid = 0;
static pid_t init_pid = 0;
static pid_t freezer_pid = 0;

static int dev_null = 0;


static void kill_em_all(void) {
    if (init_pid) {
        if (kill(init_pid, SIGKILL) < 0) {
            fprintf(stderr, "killing init failed: %m\n");
        }
    }
    if (loader_pid) {
        if (kill(loader_pid, SIGKILL) < 0) {
            fprintf(stderr, "killing loader failed: %m\n");
        }
    }
    if (freezer_pid) {
        if (kill(freezer_pid, SIGKILL) < 0) {
            fprintf(stderr, "killing freezer failed: %m\n");
        }
    }
}

static void err(const char *fmt, ...) {
    va_list ap;
    int e = errno;

    fprintf(stderr, "Error: ");
    va_start(ap, fmt);
    vfprintf(stderr, fmt, ap);
    va_end(ap);
    fprintf(stderr, ": %s\n", strerror(e));

    kill_em_all();

    _exit(1);
}

static int execveat(int dirfd, const char *pathname, char *const argv[],
                    char *const envp[], int flags) {
    long x;
    x = syscall(SYS_execveat, dirfd, pathname, argv, envp, flags);
    if (x < 0) {
        errno = -x;
        return -1;
    }
    return 0;
}

static void sigchld_handler(int _unused) {
    pid_t pid;

    while (1) {
        pid = waitpid(-1, NULL, WNOHANG);
        if (pid < 0) {
            if (errno == ECHILD) {
                break;
            }
            // WORLD IS BURNING
            if (write(2, "WAITPID ERROR\n", 14) < 0) {
                // we are gonna die anyway
            }
            kill_em_all();
            _exit(1);
        } else if (pid == 0) {
            break;
        } else {
            if (pid == init_pid) {
                // init elf exited, time to go home
                if (write(2, "Init exited\n", 12) < 0) {
                    _exit(1);
                }
                kill_em_all();
                _exit(0);
            }
        }
    }
}

static void init_stuff(void) {
    struct sigaction sa = { 0 };

    setbuf(stdin, NULL);
    setbuf(stdout, NULL);
    setbuf(stderr, NULL);

    if (sigemptyset(&sa.sa_mask) < 0) {
        err("sigemptyset failed");
    }
    sa.sa_flags = SA_NOCLDSTOP | SA_RESTART;
    sa.sa_handler = sigchld_handler;
    if (sigaction(SIGCHLD, &sa, NULL) < 0) {
        err("sigaction (SIGCHLD) failed");
    }
    if (prctl(PR_SET_CHILD_SUBREAPER, 1) < 0) {
        err("cannot set child subreaper");
    }

    if (chdir(CHALL_DIR) < 0) {
        err("cannot chdir to %s", CHALL_DIR);
    }

    if (mkdir(CHROOT_PATH, 0) < 0 || chmod(CHROOT_PATH, 0777) < 0) {
        err("%s creation failed", CHROOT_PATH);
    }
    if (mkdir(STORAGE_PATH, 0) < 0 || chmod(STORAGE_PATH, 0777) < 0) {
        err("%s creation failed", STORAGE_PATH);
    }
    if (mkdir(FREEZER_MOUNT_PATH, 0700) < 0) {
        err("%s creation failed", FREEZER_MOUNT_PATH);
    }

    if (mount("freezer", FREEZER_MOUNT_PATH, "cgroup",
              MS_MGC_VAL, "freezer") < 0) {
        err("cannot mount freezer on %s", FREEZER_MOUNT_PATH);
    }

    if (mkdir(FREEZER_GROUP_PATH, 0700) < 0) {
        err("%s creation failed", FREEZER_GROUP_PATH);
    }

    if ((dev_null = open("/dev/null", O_RDONLY | O_CLOEXEC)) < 0) {
        err("cannot open /dev/null");
    }
}

static void close_unneeded_fds(int *leave_open, size_t size) {
    int i, j, skip;

    if (dup2(dev_null, 0) < 0) {
        err("cannot disalbe stdin");
    }

    for (i = 3; i <= 1024; ++i) {
        skip = 0;
        for (j = 0; j < size; ++j) {
            if (leave_open[j] == i) {
                skip = 1;
                break;
            }
        }
        if (!skip) {
            close(i);
        }
    }
}

static void read_to_fd(int fd, size_t size) {
    char buf[0x1000];
    ssize_t x;

    while (size) {
        x = read(0, buf, sizeof buf < size ? sizeof buf : size);
        if (x <= 0) {
            err("read error");
        }
        if (write(fd, buf, x) != x) {
            err("write error");
        }
        size -= x;
    }
}

static int get_elf(void) {
    int fd;
    size_t size = 0;

    puts("Elf size?");
    if (scanf("%zu", &size) == EOF) {
        err("reading stdin failed");
    }

    if (size > MAX_ELF_SIZE) {
        err("CANNOT HANDLE SUCH A BIG ELF");
    }

    fd = memfd_create("ELF", MFD_CLOEXEC);

    if (fd < 0) {
        err("cannot create new memfd");
    }

    puts("Elf content?");
    read_to_fd(fd, size);

    return fd;
}

static int enter_chroot(const char *path) {
    if (chroot(path) < 0) {
        return -1;
    }
    if (chdir("/") < 0) {
        return -1;
    }
    return 0;
}

static void write_id_maps(pid_t p) {
    char buf[0x100],
         path[0x100];

    if (snprintf(buf, sizeof buf, "%d %d 1\n", USER_ID, USER_ID) < 0) {
        err("cannot create map string");
    }

    if (snprintf(path, sizeof path, "/proc/%d/setgroups", (int)p) < 0) {
        err("cannot create path to setgroups");
    }
    if (write_to_path(path, "deny\n") < 0) {
        err("cannot write to setgroups");
    }
    if (snprintf(path, sizeof path, "/proc/%d/uid_map", (int)p) < 0) {
        err("cannot create path to uid_map");
    }
    if (write_to_path(path, buf) < 0) {
        err("cannot write to uid_map");
    }
    if (snprintf(path, sizeof path, "/proc/%d/gid_map", (int)p) < 0) {
        err("cannot create path to gid_map");
    }
    if (write_to_path(path, buf) < 0) {
        err("cannot write to gid_map");
    }
}

static const char *ns_types[] = { "pid", "net", "uts", "ipc", "cgroup", "user", "mnt" };
static const size_t ns_types_len = 7;
static void join_ns(void) {
    size_t i;
    char path[0x100];
    int fd;

    for (i = 0; i < ns_types_len; ++i) {
        if (snprintf(path, sizeof path, "/proc/%d/ns/%s", init_pid, ns_types[i]) < 0) {
            err("cannot create path for ns/%s", ns_types[i]);
        }
        if ((fd = open(path, O_RDONLY)) < 0) {
            err("cannot open %s", path);
        }
        if (setns(fd, 0) < 0) {
            err("cannot setns for %s", path);
        }
        if (close(fd) < 0) {
            err("cannot close fd for %s", path);
        }
    }
}

static void setuids(void) {
    if (setresgid(USER_ID, USER_ID, USER_ID) < 0) {
        err("cannot setresgid");
    }
    if (setresuid(USER_ID, USER_ID, USER_ID) < 0) {
        err("cannot setresuid");
    }
}

static pid_t spawn_new_sandbox(int elf_fd, int chroot_me,
                               int *leave_open, size_t leave_open_size) {
    pid_t p;
    int pip_pid[2];
    char *argv[] = { "ELF", NULL };

    if (pipe2(pip_pid, O_CLOEXEC) < 0) {
        err("cannot create pid pipe");
    }

    p = vfork();
    if (p < 0) {
        err("cannot create new process");
    } else if (p == 0) {
        setuids();

        if (unshare(CLONE_NEWUSER | CLONE_NEWPID | CLONE_NEWNS | CLONE_NEWNET
                    | CLONE_NEWIPC | CLONE_NEWUTS | CLONE_NEWCGROUP) < 0) {
            err("cannot unshare");
        }

        if (chroot_me) {
            if (enter_chroot(CHROOT_PATH) < 0) {
                err("cannot enter chroot");
            }
        }

        p = vfork();
        if (p < 0) {
            err("cannot join pid ns");
        } else if (p == 0) {
            close_unneeded_fds(leave_open, leave_open_size);

            if (execveat(elf_fd, "", argv, NULL, AT_EMPTY_PATH) < 0) {
                err("cannot execve memfd");
            }
        }

        if (write(pip_pid[1], &p, sizeof p) != sizeof p) {
            err("cannot write to pid pipe");
        }
        _exit(0);
    }

    // parent
    if (close(pip_pid[1]) < 0) {
        err("cannot close write end of pid pipe");
    }
    if (read(pip_pid[0], &p, sizeof p) != sizeof p) {
        err("cannot read from pid pipe");
    }
    if (close(pip_pid[0]) < 0) {
        err("cannot close read end of pid pipe");
    }

    write_id_maps(p);

    return p;
}

static int spawn_trusted_loader(void) {
    int pip[2],
        sp[2],
        fd,
        leave_open[3];

    if (pipe2(pip, O_CLOEXEC) < 0) {
        err("cannot create ipc pipe");
    }
    if (dup2(pip[0], IPC_FD) < 0) {
        err("cannot dup IPC_FD - read");
    }
    if (close(pip[0]) < 0) {
        err("cannot close pip[0]");
    }

    if (socketpair(AF_UNIX, SOCK_STREAM | SOCK_CLOEXEC, 0, sp) < 0) {
        err("cannot create socketpair");
    }
    if (dup2(sp[1], FREEZER_FD) < 0) {
        err("cannot dup FREEZER_FD");
    }
    if (close(sp[1]) < 0) {
        err("cannot close sp[1]");
    }

    if ((fd = open(LOADER_PATH, O_PATH | O_CLOEXEC)) < 0) {
        err("cannot open %s", LOADER_PATH);
    }

    leave_open[0] = fd;
    leave_open[1] = IPC_FD;
    leave_open[2] = FREEZER_FD;
    loader_pid = spawn_new_sandbox(fd, 0, leave_open, 3);

    if (dup2(pip[1], IPC_FD) < 0) {
        err("cannot dup IPC_FD - write");
    }
    if (close(pip[1]) < 0) {
        err("cannot close pip[1]");
    }

    if (close(FREEZER_FD) < 0) {
        err("cannot close FREEZER_FD");
    }

    return sp[0];
}

static void write_to_freezer(const char *str) {
    if (write_to_path(FREEZER_PATH, str) < 0) {
        err("cannot write to %s", FREEZER_PATH);
    }
}

static void read_from_freezer(char *buf, size_t len) {
    if (read_from_path(FREEZER_PATH, buf, len) < 0) {
        err("cannot read from %s", FREEZER_PATH);
    }
}

static void freeze_sandbox(void) {
    char buf[0x40];

    write_to_freezer(FREEZE_STR);

    while (1) {
        read_from_freezer(buf, sizeof buf);
        if (strcmp(buf, FREEZE_STR) == 0) {
            break;
        }
    }
}

static void unfreeze_sandbox(void) {
    char buf[0x40];

    write_to_freezer(UNFREEZE_STR);

    while (1) {
        read_from_freezer(buf, sizeof buf);
        if (strcmp(buf, UNFREEZE_STR) == 0) {
            break;
        }
    }
}

static void write_ack(int freezer_fd) {
    char c = FREEZER_CONFIRM_CHAR;

    if (write(freezer_fd, &c, 1) != 1) {
        err("cannot write to freezer_fd");
    }
}

static void freezer_daemon(int freezer_fd) {
    char c;

    while (1) {
        if (read(freezer_fd, &c, 1) < 0) {
            err("cannot read from freezer_fd");
        }

        switch (c) {
        case FREEZER_FREEZE_CHAR:
            freeze_sandbox();
            write_ack(freezer_fd);
            break;
        case FREEZER_UNFREEZE_CHAR:
            unfreeze_sandbox();
            write_ack(freezer_fd);
            break;
        default:
            break;
        }
    }
}

static void spawn_freezer_daemon(int freezer_fd) {
    pid_t p;
    char c = FREEZER_START_CHAR;

    p = fork();
    if (p < 0) {
        err("cannot spawn freezer daemon");
    } else if (p == 0) {
        if (write(freezer_fd, &c, 1) != 1) {
            err("cannot write to freezer_fd");
        }
        freezer_daemon(freezer_fd);
        _exit(1);
    }

    freezer_pid = p;
}

static void create_sandbox(int elf_fd) {
    char buf[0x10];
    int leave_open[] = { IPC_FD, elf_fd };

    init_pid = spawn_new_sandbox(elf_fd, 1, leave_open, 2);

    if (snprintf(buf, sizeof buf, "%u\n", init_pid) < 0) {
        err("cannot create init_pid buf");
    }
    if (write_to_path(FREEZER_TASK_PATH, buf) < 0) {
        err("cannor write to %s", FREEZER_TASK_PATH);
    }
}

static void spawn_elf_in_sandbox(int elf_fd) {
    char *argv[] = { "ELF", NULL };
    pid_t p;
    int leave_open[] = { IPC_FD, elf_fd };

    p = vfork();
    if (p < 0) {
        err("cannot create new process");
    } else if (p == 0) {
        join_ns();

        if (enter_chroot(CHROOT_PATH) < 0) {
            err("cannot enter chroot");
        }

        setuids();

        p = vfork();
        if (p < 0) {
            err("cannot join pid ns");
        } else if (p == 0) {
            if (prctl(PR_SET_DUMPABLE, 1) < 0) {
                err("cannot prctl");
            }

            close_unneeded_fds(leave_open, 2);

            if (execveat(elf_fd, "", argv, NULL, AT_EMPTY_PATH) < 0) {
                if (write(1, "exec fail\n", 10) < 0) {}
                _exit(1);
            }
        }
        _exit(0);
    }
}

static void upload_file(void) {
    char name[0x100] = { 0 },
         path[0x200] = { 0 };
    size_t size = 0;
    int fd;

    puts("File name?");
    if (scanf("%255s", name) == EOF) {
        puts("scanf failed.");
        return;
    }
    puts("File size?");
    if (scanf("%zu", &size) == EOF) {
        puts("Reading size failed.");
        return;
    }
    if (size > MAX_ELF_SIZE) {
        puts("Size too big.");
        return;
    }

    if (has_slash(name)) {
        puts("Invalid file name.");
        return;
    }

    if (snprintf(path, sizeof path, "%s/%s", CHROOT_PATH, name) < 0) {
        puts("snprintf failed.");
        return;
    }

    if ((fd = open(path, O_WRONLY | O_CREAT | O_EXCL | O_NOFOLLOW, 0700)) < 0) {
        puts("Cannot open path.");
        return;
    }

    puts("File content?");
    read_to_fd(fd, size);

    if (fchown(fd, USER_ID, USER_ID) < 0) {
        puts("fchown failed");
    }

    if (close(fd) < 0) {
        puts("Closing path failed.");
    }
}

static void print_menu(void) {
    puts("1. Spawn new elf.");
    puts("2. Upload file.");
    puts("3. Exit.");
}

int main(void) {
    int fd, freezer_fd;
    char buf[8];

    init_stuff();
    freezer_fd = spawn_trusted_loader();

    puts("Send init elf");
    fd = get_elf();
    create_sandbox(fd);
    if (close(fd) < 0) {
        err("cannot close init elf fd");
    }

    spawn_freezer_daemon(freezer_fd);
    if (close(freezer_fd) < 0) {
        err("cannot close freezer_fd");
    }

    while (1) {
        print_menu();
        if (scanf("%2s", buf) == EOF) {
            err("reading stdin failed");
        }

        switch (buf[0]) {
        case '1':
            fd = get_elf();
            spawn_elf_in_sandbox(fd);
            if (close(fd) < 0) {
                err("cannot close elf fd");
            }
            break;
        case '2':
            upload_file();
            break;
        case '3':
            puts("BYE BYE!");
            kill_em_all();
            return 0;
        default:
            puts("Invalid choice!");
            break;
        }

    }

    return 0;
}
