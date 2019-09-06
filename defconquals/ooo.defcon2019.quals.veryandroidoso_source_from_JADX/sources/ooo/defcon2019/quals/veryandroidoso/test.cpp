#include<bits/stdc++.h>

using namespace std;

int m0(int a3, int a4)
{
  unsigned int v4,v5;

  v4 = a3 +  37 - ((a3 + ((unsigned int)((a3 +  37) >> 31) >> 24) +  37) & 0xFFFFFF00);
  v5 = a4 - 123 - ((a4 + ((unsigned int)((a4 - 123) >> 31) >> 24) - 123) & 0xFFFFFF00);
  return v4 ^ (v5 + 256 - ((v5 + ((unsigned int)((signed int)(v5 + 256) >> 31) >> 24) + 256) & 0xFFFFFF00));
}
int m1(int a3,int a4)
{
    unsigned int v4,v5;
    v4 = (a3+37)%256;
    v5 = (a4-123)%256;
    return v4^((v5+256)%256);
}

int main()
{
    for(int i=0;i<=255;i++)
        for(int j=0;j<=255;j++)
        {
            if(m1(i,j)!=m0(i,j))
                printf("pula\n");
        }
    printf("pizda!\n");

    return 0;
}
