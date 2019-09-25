#define _GNU_SOURCE
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <openssl/pem.h>
#include <openssl/rsa.h>
#include <openssl/sha.h>
#include <pthread.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

#include "trusted_loader.h"
#include "utils.h"

static int RANDOM_FD;

static char msg_buf[sizeof(struct msg) + MSG_MAX_SIZE];

static pthread_mutex_t storage_mutex = PTHREAD_MUTEX_INITIALIZER;
static int needs_unfreeze = 0;


static void err(const char *fmt, ...) {
    va_list ap;
    int e = errno;

    fprintf(stderr, "Error: ");
    va_start(ap, fmt);
    vfprintf(stderr, fmt, ap);
    va_end(ap);
    fprintf(stderr, ": %s\n", strerror(e));

    _exit(1);
}

static int read_msg() {
    ssize_t x;

    memset(msg_buf, 0, sizeof msg_buf);

    if ((x = read(IPC_FD, msg_buf, sizeof msg_buf - 1)) <= 0) {
        return -1;
    }
    msg_buf[x] = '\0';
    return 0;
}

static char alph[0x10] = "0123456789abcdef";

static int get_rand_name(char *rand_name) {
    size_t i;
    unsigned char c;

    for (i = 0; i < RAND_NAME_SIZE; ++i) {
        if (read(RANDOM_FD, &c, 1) != 1) {
            err("reading from urandom");
        }
        rand_name[i] = alph[c % sizeof alph];
    }

    rand_name[RAND_NAME_SIZE] = '\0';

    return 0;
}

static int is_file(const char *path) {
    struct stat buf = { 0 };

    if (stat(path, &buf) < 0) {
        return 0;
    }

    return S_ISREG(buf.st_mode);
}

static void write_to_freezer_with_ack(char c) {
    if (write(FREEZER_FD, &c, 1) != 1) {
        err("cannot write to FREEZER_FD");
    }

    while (1) {
        if (read(FREEZER_FD, &c, 1) != 1) {
            err("cannnot read from FREEZER_FD");
        }
        if (c == FREEZER_CONFIRM_CHAR) {
            break;
        }
    }
}
static void freeze_sandbox(void) {
    write_to_freezer_with_ack(FREEZER_FREEZE_CHAR);
}

static void unfreeze_sandbox(void) {
    write_to_freezer_with_ack(FREEZER_UNFREEZE_CHAR);
}

static int verify_sig(const unsigned char *data, size_t data_len,
                      const unsigned char *sig, size_t sig_len) {
    int ret = 0;
    unsigned char md[SHA256_DIGEST_LENGTH] = { 0 };
    RSA *pubkey = NULL;
    FILE *fp = NULL;

    if (SHA256(data, data_len, md) == NULL) {
        ret = -1;
        goto out;
    }

    if ((fp = fopen(RSA_PUBKEY_PATH, "r")) == NULL) {
        ret = -1;
        goto out;
    }

    if ((pubkey = PEM_read_RSA_PUBKEY(fp, NULL, NULL, NULL)) == NULL) {
        ret = -1;
        goto out;
    }

    if (RSA_verify(NID_sha256, md, sizeof md, sig, sig_len, pubkey) != 1) {
        ret = -1;
        goto out;
    }

    ret = 0;

out:
    if (pubkey) {
        RSA_free(pubkey);
    }
    if (fp) {
        fclose(fp);
    }
    return ret;
}

static int check_exe_signature(const char *file_path, const char *sig_path) {
    int fd = -1,
        ret = 0;
    struct stat buf;
    unsigned char *data = NULL,
                  *sig = NULL;
    size_t data_size = 0,
           sig_size = 0;

    if ((fd = open(sig_path, O_RDONLY)) < 0) {
        ret = -1;
        goto out;
    }
    if (fstat(fd, &buf) < 0) {
        ret = -1;
        goto out;
    }
    sig_size = buf.st_size;
    if (sig_size > 0x1000) {
        ret = -1;
        goto out;
    }
    sig = (unsigned char *)mmap(NULL, sig_size, PROT_READ, MAP_PRIVATE, fd, 0);
    if (sig == MAP_FAILED) {
        ret = -1;
        goto out;
    }
    close(fd);
    fd = -1;

    if ((fd = open(file_path, O_RDONLY)) < 0) {
        ret = -1;
        goto out;
    }
    if (fstat(fd, &buf) < 0) {
        ret = -1;
        goto out;
    }
    data_size = buf.st_size;
    if (data_size > MAX_ELF_SIZE) {
        ret = -1;
        goto out;
    }
    data = (unsigned char *)mmap(NULL, data_size, PROT_READ, MAP_PRIVATE, fd, 0);
    if (data == MAP_FAILED) {
        ret = -1;
        goto out;
    }
    close(fd);
    fd = -1;

    if (verify_sig(data, data_size, sig, sig_size) < 0) {
        ret = -2;
        goto out;
    }

    ret = 0;

out:
    if (fd >= 0) {
        close(fd);
    }
    if (data && data != MAP_FAILED) {
        munmap(data, data_size);
    }
    if (sig && sig != MAP_FAILED) {
        munmap(sig, sig_size);
    }
    return ret;
}

static void return_file(const char *name, const char *source) {
    char to[1024];

    snprintf(to, sizeof to, "%s" REJECTED_EXT, source);

    if (rename(name, to) < 0) {
        // cannot return, just delete it
        unlink(name);
    }
}

static void add_exe(const char *name) {
    char source[512];
    char source_sig[512];
    char rand_name[RAND_NAME_SIZE + 1];
    char rand_name_sig[RAND_NAME_SIZE + strlen(SIG_EXT) + 1];

    if (has_slash(name)) {
        return;
    }

    if (get_rand_name(rand_name) < 0) {
        return;
    }
    if (snprintf(rand_name_sig, sizeof rand_name_sig,
                 "%s" SIG_EXT, rand_name) < 0) {
        return;
    }
    if (snprintf(source, sizeof source, "%s/%s", CHROOT_PATH, name) < 0) {
        return;
    }
    if (snprintf(source_sig, sizeof source_sig, "%s" SIG_EXT, source) < 0) {
        return;
    }

    if (pthread_mutex_lock(&storage_mutex) != 0) {
        return;
    }

    freeze_sandbox();
    needs_unfreeze = 1;

    if (!is_file(source) || !is_file(source_sig)) {
        goto out_unfreeze;
    }

    if (rename(source, rand_name) < 0
            || rename(source_sig, rand_name_sig) < 0) {
        unlink(rand_name);
        unlink(rand_name_sig);
        goto out_unfreeze;
    }

    if (check_exe_signature(rand_name, rand_name_sig) < 0) {
        return_file(rand_name, source);
        return_file(rand_name_sig, source_sig);
        goto out_unfreeze;
    }

    unlink(rand_name_sig);

    goto out_unlock;

out_unfreeze:
    needs_unfreeze = 0;
    unfreeze_sandbox();

out_unlock:
    pthread_mutex_unlock(&storage_mutex);
}

static void spawn_exe(char *name) {
    pid_t p;
    char *argv[] = { name, 0 };

    p = vfork();
    if (p < 0) {
        return;
    } else if (p == 0) {
        alarm(10);
        execve(name, argv, NULL);
        _exit(1);
    }
    // parent
    wait(NULL);
}

static void load_execs(void) {
    DIR *dirp;
    struct dirent *ent;
    char *name;

    if (pthread_mutex_lock(&storage_mutex) != 0) {
        return;
    }

    if ((dirp = opendir(STORAGE_PATH)) == NULL) {
        goto out;
    }

    while (1) {
        errno = 0;
        ent = readdir(dirp);
        if (!ent) {
            if (!errno) {
                // no more entries
                break;
            } else {
                goto out;
            }
        }

        name = ent->d_name;

        if (strcmp(name, ".") == 0 || strcmp(name, "..") == 0) {
            continue;
        }

        spawn_exe(name);

        unlink(name);
    }

out:
    if (dirp) {
        closedir(dirp);
    }

    if (needs_unfreeze) {
        needs_unfreeze = 0;
        unfreeze_sandbox();
    }

    pthread_mutex_unlock(&storage_mutex);
}

static void *loader_thread(void *x) {
    while (1) {
        sleep(3);
        load_execs();
    }
    return x;
}

static void wait_for_freezer(void) {
    char c;

    while (1) {
        if (read(FREEZER_FD, &c, 1) < 0) {
            err("reading from FREEZER_FD");
        }
        if (c == FREEZER_START_CHAR) {
            break;
        }
    }
}

int main(void) {
    struct msg *msg = (struct msg *)&msg_buf;
    pthread_t tid = 0;

    RANDOM_FD = open("/dev/urandom", O_RDONLY);
    if (RANDOM_FD < 0) {
        puts("cannot open urandom");
        return 1;
    }

    if (chdir(STORAGE_PATH) < 0) {
        puts("cannot chdir");
        return 1;
    }

    wait_for_freezer();

    if (pthread_create(&tid, NULL, loader_thread, NULL) != 0) {
        puts("cannot spawn loader");
        return 1;
    }

    while (1) {
        if (read_msg() < 0) {
            continue;
        }
        switch (msg->type) {
            case MSG_ADD_EXE:
                add_exe(msg->data);
                break;
            default:
                break;
        }
    }

    return 0;
}
