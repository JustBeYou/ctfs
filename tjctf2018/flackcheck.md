Open the file in IDA, you will see a strlen that must be 43
You also see this fake flag: tjctf{ju57_c4ll_m3_r3v3r53_60d_fr0m_n0w_0n}
As you see, it is modified dinamically and then it calls strcmp to validate.
Just run the program with a 43 length argument inside ltrace and you will see the flag

ltrace -s 1000 ./flagcheck AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
__libc_start_main([ "./flagcheck", "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" ] <unfinished ...>
strlen("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA") = 43
strcmp("tjctf{ju57_c4ll_m3_35r3v3r_60d_fr0m_n0w_0n}", "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA") = 1
puts("Invalid flag."Invalid flag.
)                            = 14
+++ exited (status 0) +++

tjctf{ju57_c4ll_m3_35r3v3r_60d_fr0m_n0w_0n}
