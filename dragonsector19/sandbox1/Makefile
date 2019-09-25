TARGETS = main trusted_loader tester tester.sig

CFLAGS = -O2 -Wall -Werror -no-pie
NOLIBC = -static -nostdlib -fno-stack-protector

.PHONY: all
all: $(TARGETS) pubkey.pem

%.o: %.c
	gcc $(CFLAGS) -c -o $@ $<

trusted_loader: trusted_loader.o utils.o
	gcc $(CFLAGS) -o $@ $^ -lpthread -lcrypto

main: main.o utils.o
	gcc $(CFLAGS) -o $@ $^

tester_syscalls.o: tester.asm
	nasm -felf64 -o $@ $^

tester.o: tester.c
	gcc $(CFLAGS) $(NOLIBC) -c -o $@ $^

tester: tester.o tester_syscalls.o
	ld -o $@ $^

tester.sig: tester privkey.pem
	openssl dgst -sha256 -sign privkey.pem -out $@ $<

privkey.pem:
	openssl genrsa -out $@ 4096
pubkey.pem: privkey.pem
	openssl rsa -in $< -pubout > $@

.PHONY: files.tar.gz
files.tar.gz:
	tar -vczf $@ main.c tester.asm tester.c trusted_loader.c trusted_loader.h utils.c utils.h Makefile main trusted_loader tester tester.sig pubkey.pem initramfs_user.cpio.gz vmlinuz-4.15.0-64-generic start.sh pow.py hashcash.py

.PHONY: genkeys
genkeys: pubkey.pem

.PHONY: clean
clean:
	rm -f $(TARGETS) *.o

.PHONY: cleankeys
cleankeys:
	rm -f pubkey.pem privkey.pem
