#include <bits/stdc++.h>

using namespace std;

     int en(unsigned char b){
                              b += 96; 
                              b = (b>>7) | 2 * b; 
                              b ^= 0x7f;
                              b = ~b;
                              int v6 = (int)(237 * (int)b) ;
                              return v6;
     }

int main() {
    for (unsigned char i = 0; i < 0xff;i ++) {
//printf("%u\n", en(i));
        if (en(i) == 13746) printf("%c %d\n", i, i);
    }

 return 0;   
}
