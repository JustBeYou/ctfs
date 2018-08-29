The algorithm found in the executable simply iterates over the factors of
25052 671110 843108 and tries to find the last one.
The algorithm is veeeeeeery slow as it iterates over every number.
So, using a fast factorizing calculator we get 
25052 671110 843108 = 2^2 × 3^3 × 231 969176 952251

We use calculate 16420105858350620421142892712 - 231969176952251 = 16420105858350388451965940461

And then sha256 of this number output the flag:
flag{5121b89fd330e8aaf59109e37ea3adf9c9497ee49dac1262e039919a9cb84912}
