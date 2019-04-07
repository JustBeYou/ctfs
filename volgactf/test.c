#include <math.h>
#include <complex.h>

int main() {
    double PI = acos(-1);
    double complex z = cexp(I * PI * -1 * 2 * 2 / 15); // Euler's formula
    printf("exp(i*pi) = %.1f%+.1fi\n", creal(z), cimag(z));

    return 0;  
}
