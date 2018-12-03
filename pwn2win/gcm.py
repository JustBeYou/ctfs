#!/usr/bin/python -u

import os
import ast
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes

key = open("/home/gcm/secret").read().strip()
flag = open("/home/gcm/flag.txt").read().strip()

def get_token(username, admin):
    iv = os.urandom(12)
    
    encryptor = Cipher(
        algorithms.AES(key),
        modes.GCM(iv),
        backend=default_backend()
    ).encryptor()

    balance = 1000 if admin == "Y" else 0
    account = {"username": username, "balance": balance, "secret": key, "admin": admin}
    enc = encryptor.update(str(account)) + encryptor.finalize()
    token = {"iv": iv.encode("hex"), "enc": enc.encode("hex"), "tag": encryptor.tag.encode("hex")}
    return str(token)
    

def login():
    username = raw_input("Username: ")
    password = raw_input("Password: ")
    if username == "admin":
        if password == key:
            token = get_token(username, "Y")
            print("Logged in as Lord of Money! Here is the token: %s" % (token))
        else:
            print("Invalid credentials!")
    else:
        token = get_token(username, "N")
        print("Logged in as %s! Here is the token:\n%s" % (username, token))


def pay():
    token = ast.literal_eval(raw_input("Token: "))
    iv = token["iv"].decode("hex")
    enc = token["enc"].decode("hex")
    tag = token["tag"].decode("hex")

    decryptor = Cipher(
        algorithms.AES(key),
        modes.GCM(iv),
        backend=default_backend()
    ).decryptor()

    account = ast.literal_eval(decryptor.update(enc) + decryptor.finalize_with_tag(tag))
    if account["balance"] != 1000 and account["admin"] == "N":
        print("Huh? you have no money and want the flag? -.-")
    else:
        print(flag)


def menu():
    while True:
        print("\nWelcome to Tr4nsferw1s3! Please chose one of the options:")
        print("  [1] Login")
        print("  [2] Transfer/pay")
        print("  [3] Exit")
        
        option = int(raw_input())
        if option == 1:
            login()
        elif option == 2:
            pay()
        elif option == 3:
            print("Bye!")
            break
        else:
            print("Invalid option!")

if __name__ == '__main__':
    menu()
