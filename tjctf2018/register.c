#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FLAG "-----REDACTED-----"

int input(char *str, float f) {

    fgets(str, 16 * f, stdin);

    if (strlen(str) <= 1) {
        puts("No input detected. Registration failed.");
        exit(0);
    } else if (!strchr(str, 10)) {
        while (fgetc(stdin) != 10);
    } else {
        str[strlen(str) - 1] = 0;
    }
}

int main() {

    int admin = 0;

    char fullname[16];
    char username[16];
    char password[16];
    char recoverypin[4];
    char email[16];
    char address[16];
    char bio[64];

    gid_t gid = getegid();
    setresgid(gid, gid, gid);

    setbuf(stdout, NULL);

    puts("******************** Please Register Below ********************");

    printf("Full Name: ");
    input(fullname, 1);

    printf("Username: ");
    input(username, 1);

    printf("Password: ");
    input(password, 1);

    printf("Recovery Pin: ");
    input(recoverypin, 4);

    printf("Email: ");
    input(email, 1);

    printf("Address: ");
    input(address, 1);

    printf("Biography: ");
    input(bio, .25);

    if (admin) {
        printf("Successfully registered '%s' as an administrator account!\n", username);
        printf("Here is your flag: %s\n", FLAG);
    } else {
        printf("Successfully registered '%s' as an user account!\n", username);
    }

    return 0;
}