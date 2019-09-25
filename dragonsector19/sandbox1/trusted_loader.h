#ifndef _TRUSTED_LOADER_H
#define _TRUSTED_LOADER_H

#define CHALL_DIR "/home/chall"

#define CHROOT_PATH CHALL_DIR "/chroot"
#define STORAGE_PATH CHALL_DIR "/storage"
#define LOADER_PATH "/trusted_loader"
#define RSA_PUBKEY_PATH "/pubkey.pem"

#define FREEZER_MOUNT_PATH CHALL_DIR "/freezer"
#define FREEZER_GROUP_PATH FREEZER_MOUNT_PATH "/0"
#define FREEZER_TASK_PATH FREEZER_GROUP_PATH "/tasks"
#define FREEZER_PATH FREEZER_GROUP_PATH "/freezer.state"

#define FREEZE_STR "FROZEN\n"
#define UNFREEZE_STR "THAWED\n"

#define FREEZER_FD 999
#define FREEZER_START_CHAR 'S'
#define FREEZER_CONFIRM_CHAR 'T'
#define FREEZER_FREEZE_CHAR 'F'
#define FREEZER_UNFREEZE_CHAR 'U'

#define USER_ID 1337

#define IPC_FD 666

#define RAND_NAME_SIZE 0x20
#define SIG_EXT ".sig"
#define REJECTED_EXT ".rejected"

#define MAX_ELF_SIZE 0x100000

#define MSG_MAX_SIZE 0x100

struct msg {
    unsigned char type;
    char data[];
} __attribute__((packed));

#define MSG_ADD_EXE 1

#endif // _TRUSTED_LOADER_H
