#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int good_flag;
int i,j,k;
int A,B,C;
char input_memory[4096] = "Almost heaven west virginia, blue ridge mountains";
int control;

int main() {
    input_memory[250]=0xd6;
    input_memory[251]=0x4d;
    read(0, &input_memory[50], 70);
    lab0: C = 0;
lab7: i = 0;
lab14: goto lab29;
lab21: i += 1;
lab29: good_flag = i;
lab33: B = good_flag;
lab37: good_flag = 50;
lab44: good_flag += B;
lab49: good_flag = input_memory[good_flag];
lab53: control = good_flag - 0;
lab63: if (control) goto lab21; else goto lab70;
lab70: control = i - 70;
lab80: if (control) goto lab87; else goto lab101;
lab87: good_flag = 0;
lab94: goto lab575;
lab101: i = 0;
lab108: goto lab428;
lab115: j = 0;
lab122: goto lab395;
lab129: C = 0;
lab136: k = 0;
lab143: goto lab304;
lab150: B = i;
lab154: good_flag = B;
lab158: good_flag <<= 3;
lab166: good_flag -= B;
lab171: B = good_flag;
lab175: good_flag = k;
lab179: good_flag += B;
lab184: B = good_flag;
lab188: good_flag = 50;
lab195: good_flag += B;
lab200: A = input_memory[good_flag];
lab204: B = k;
lab208: good_flag = B;
lab212: good_flag <<= 3;
lab220: good_flag -= B;
lab225: B = good_flag;
lab229: good_flag = j;
lab233: good_flag += B;
lab238: B = good_flag;
lab242: good_flag = 0;
lab249: good_flag += B;
lab254: B = input_memory[good_flag];
lab258: good_flag = A;
lab262: good_flag *= B;
lab267: good_flag %= 256;
lab275: C += good_flag;
lab280: C %= 256;
lab288: good_flag = k;
lab292: good_flag += 1;
lab300: k = good_flag;
lab304: control = k - 6;
lab314: if (control > 0) goto lab321; else goto lab150;
lab321: B = i;
lab325: good_flag = B;
lab329: good_flag <<= 3;
lab337: good_flag -= B;
lab342: B = good_flag;
lab346: good_flag = j;
lab350: good_flag += B;
lab355: B = good_flag;
lab359: good_flag = 150;
lab366: good_flag += B;
lab371: A = C;
lab375: input_memory[good_flag] = A;
lab379: good_flag = j;
lab383: good_flag += 1;
lab391: j = good_flag;
lab395: control = j - 6;
lab405: if (control > 0) goto lab412; else goto lab129;
lab412: good_flag = i;
lab416: good_flag += 1;
lab424: i = good_flag;
lab428: control = i - 9;
lab438: if (control > 0) goto lab445; else goto lab115;
lab445: i = 0;
lab452: goto lab551;
lab459: good_flag = i;
lab463: B = good_flag;
lab467: good_flag = 150;
lab474: good_flag += B;
lab479: A = input_memory[good_flag];
lab483: good_flag = i;
lab487: B = good_flag;
lab491: good_flag = 250;
lab498: good_flag += B;
lab503: good_flag = input_memory[good_flag];
lab507: control = A - C;
lab514: if (control) goto lab521; else goto lab535;
lab521: good_flag = 0;
lab528: goto lab575;
lab535: good_flag = i;
lab539: good_flag += 1;
lab547: i = good_flag;
lab551: control = i - 69;
lab561: if (control > 0) goto lab568; else goto lab459;
lab568: good_flag = 1;
lab575: if (good_flag) printf("GOOOOOD!\n"); else printf("BAD\n");
lab576: if (good_flag) printf("GOOOOOD!\n"); else printf("BAD\n");

    return 0;
}