# Trial and Error (150pts) Third to solve this challenge!

>[Task author: Sin__] Having passed the PoW you analyze the service: a victim user is allowed to encrypt anything but decryption is not fully available (unless they pay). Encrypting and then decrypting a number of your choice proves that they have the private key that the victim so badly needs. Use this trial service against itself to decrypt the given ciphertext that the mad doctor placed at the beginning of the communication.
Hint! First you need to query the service in some way so that you can deduce the modulus value, N.
Tamago (250pts)

## Solution:
Bypassed the captha from the preview task we get access to the server which encrypt and decrypt RSA, but the decryption is only "trial" meaning it's only returns the last byte of the decrypted data (`sha1(data % 256)` but it's easily brute-forceable).

We have the flag encrypted and using the service we had to decrypt it.

First thing is figuring out the `N`. I know that if the data I encrypt is bigger than `N` decrypting it doesn't give me the correct result. So I can do a simple binary search. Now I have the `N`, so i can compute modulo inverse.

Here I can use known cyphertext attack, so if I encrypt a value and multiply it to cyphertext I basicly multiplied the original plain text with the value.

Here I can write the plaintext as: `x1 + x2*256 + x3* 256^2 ...`. I know `x1`(the last byte). So I can multiply the plaintext with the modulo inverse of 256, so I get : `x1*256^(-1) + x2 + x3*256 ...`. and I see the last byte of this: `x1*256^(-1) + x2`. I can calculate `x1*256^(-1)` so I can get `x2` by substraction. Following this method i can decrypt the flag.

(see attached script: `decrypt.py`)
