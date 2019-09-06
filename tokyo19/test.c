#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>

int64_t custom_atoi(char *a1)
{
  int64_t v2; // [rsp+8h] [rbp-10h]
  int64_t i; // [rsp+10h] [rbp-8h]

  v2 = 0LL;
  for ( i = 0LL; a1[i] > '/' && a1[i] <= '9'; ++i )
    v2 = 10 * v2 + a1[i] - '0';
  return v2;
}


int main(){
    printf("%" PRId64 "\n", custom_atoi("9223372036854775808"));
return 0;
	int temp;
	int numbers=20;
	int a[numbers+1], upto = 9, temp2;
	for( temp2 = 1 ; temp2 <= numbers; temp2++){
		a[temp2]=1;
	}
	a[numbers]=0;
	temp=numbers;
    char s[100];
	while(1){
		if(a[temp]==upto){
			temp--;
			if(temp==0)
				break;
		}
		else{
			a[temp]++;
			while(temp<numbers){
				temp++;
				a[temp]=1;
			}

			for( temp2 = 1 ; temp2 <= numbers; temp2++){
			    s[temp2 - 1] = a[temp2] + '0';
			}
            s[temp2 - 1]  = '\0';
            int64_t kkk =custom_atoi(s);
            //if (kkk < 0)
                printf("%s -> %" PRId64 "\n", s, kkk);
		}
	}
	return 0;
}
