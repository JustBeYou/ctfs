#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <unistd.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/prctl.h>
#include <sys/syscall.h>
#include <sys/socket.h>
#include <linux/filter.h>
#include <linux/seccomp.h>
#include <linux/audit.h>

#define ArchField offsetof(struct seccomp_data, arch)
#define Allow(syscall) \
    BPF_JUMP(BPF_JMP+BPF_JEQ+BPF_K, SYS_##syscall, 0, 1), \
    BPF_STMT(BPF_RET+BPF_K, SECCOMP_RET_ALLOW)
#define SIZE 0x10
#define ALLOC_SIZE 0x400

typedef struct _chunk {
	uint32_t size;
	void * ptr;
	bool in_use;
} chunk;

bool used = false;
chunk chunks[SIZE];

void error(char * str) {
	puts(str);
	exit(1);
}

uint32_t get_int(char * str) {
	uint32_t choice;
	printf("%s", str);
	scanf("%u", &choice);
	getchar();
	return choice;
}

void get_str(char * str, char * ptr, uint32_t size) {
	printf("%s", str);
	assert(read(STDIN_FILENO, ptr, size));
}

struct sock_filter filter[] = {
	BPF_STMT(BPF_LD+BPF_W+BPF_ABS, ArchField),
	BPF_JUMP( BPF_JMP+BPF_JEQ+BPF_K, AUDIT_ARCH_X86_64, 1, 0),
	BPF_STMT(BPF_RET+BPF_K, SECCOMP_RET_KILL),

	BPF_STMT(BPF_LD+BPF_W+BPF_ABS, offsetof(struct seccomp_data, nr)),
    BPF_JUMP(BPF_JMP+BPF_JGE+BPF_K, 0x400, 0, 1),
    BPF_STMT(BPF_RET+BPF_K, SECCOMP_RET_KILL),
	Allow(brk),
	Allow(mmap),
	Allow(exit_group),
	Allow(mmap),
	Allow(munmap),
	Allow(read),
	Allow(write),
	Allow(getdents),
	Allow(mprotect),
	Allow(open),
	Allow(sendfile),

	BPF_STMT(BPF_RET+BPF_K, SECCOMP_RET_KILL),
};

struct sock_fprog _filter = {
	.len = sizeof(filter)/sizeof(filter[0]),
	.filter = filter,
};

void setup_seccomp(void) {
	assert(prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0) == 0);
	assert(prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &_filter) != -1);
}

void menu(void) {
	puts("1) Allocate");
	puts("2) Free");
	puts("3) Edit");
	puts("4) Exit");
}

uint32_t find_empty_chunk(void) {
	for(int i = 0; i < SIZE; ++i)
		if(!chunks[i].in_use)
			return i;

	error("No more chunks avaliable.");
	return 0;
}

void alloc(void) {
	uint32_t idx = find_empty_chunk();
	uint32_t size = get_int("Size: ");
	assert(size <= ALLOC_SIZE);

	char * ptr = malloc(size);
	assert(ptr != NULL);
	*(unsigned long long *)ptr = 0LL;
	get_str("Data: ", ptr, size);

	chunks[idx].ptr = ptr;
	chunks[idx].in_use = true;
	chunks[idx].size = size;
}

void delete(void) {
	uint32_t idx = get_int("Index: ");
	assert(idx <= SIZE);
	assert(chunks[idx].in_use);
	assert(chunks[idx].ptr != NULL);

	chunks[idx].in_use = false;
	printf("Data: %s\n", (char *)chunks[idx].ptr);
	free(chunks[idx].ptr);
}

void edit(void) {
	if(used)
		error("Good things only happen once :)");

	used = true;
	uint32_t idx = get_int("Index: ");
	assert(idx <= SIZE);
	assert(chunks[idx].ptr != NULL);

	get_str("Data: ", chunks[idx].ptr, 1);
}

void init(void) {
	setvbuf(stdin, NULL, _IONBF, 0);
	setvbuf(stdout, NULL, _IONBF, 0);
	setup_seccomp();
	memset((void *)chunks, 0, sizeof(chunk) * SIZE);
}

int main(void) {
	init();
	while(1) {
		menu();
		switch(get_int("Choice: ")) {
			case 1:
				alloc();
				break;
			case 2:
				delete();
				break;
			case 3:
				edit();
				break;
			case 4:
				puts("Bye!");
				exit(0);
				break;
			default:
				error("Invalid option.");
				break;
		}
	}
}
