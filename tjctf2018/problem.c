#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define PIN_SIZE 4
#define NAME_SIZE 32

int verify_pin(char* pin) {
    char pin_check[PIN_SIZE+1];
    printf("Please verify your PIN first:\nPIN: ");
    fgets(pin_check, NAME_SIZE+1, stdin);
    for(int i = 0; i < 4; i ++) {
        if(pin[i] != pin_check[i])
            return 0;
    }
    return 1;
}

char name[NAME_SIZE+1];
char pin[PIN_SIZE+1];

int main() {
    gid_t gid = getegid();
    setresgid(gid, gid, gid);
    setbuf(stdout, NULL);
    printf("Welcome to our Online Banking system!\n");
    printf("To use our system, please register an account with a 4-character PIN:\n");
    printf("Name: ");
    fgets(name, NAME_SIZE+1, stdin);
    printf("PIN: ");
    fgets(pin, PIN_SIZE+1, stdin);
    while(getchar() != '\n');
    unsigned int balance = 0;
    printf("Thank you for registering! You may now use our service.\n");
    char cmd = '\x00';
    while(cmd != 'q') {
        printf("\nWhat would you like to do?\n d - deposit\n w - withdraw\n q - quit\n");
        cmd = getchar();
        getchar();
        if(cmd == 'd') {
            if(verify_pin(pin)) {
                char deposit_s[16];
                printf("How much would you like to deposit?\n");
                fgets(deposit_s, 16, stdin);
                balance += atoi(deposit_s);
            } else {
                printf("Invalid PIN!\nFor security reasons, your account is now being locked.\n");
                cmd = 'q';
            }
        } else if(cmd == 'w') {
            if(verify_pin(pin)) {
                char deposit_s[16];
                printf("How much would you like to withdraw?\n");
                fgets(deposit_s, 16, stdin);
                balance -= atoi(deposit_s);
            } else {
                printf("Invalid PIN!\nFor security reasons, your account is now being locked.\n");
                cmd = 'q';
            }
        } else if(cmd != 'q') {
            printf("Unknown command!\n");
        }
        if(cmd == 'd' || cmd == 'w') {
            printf("Your current balance is %u\n",balance);
        }
    }
    printf("Have a nice day! Please come again soon.\n");
    return 0;
}
