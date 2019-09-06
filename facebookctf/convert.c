#include <stdio.h>
#include <string.h>
#include <stdlib.h>

float convert(char *value)
{
    char buf[1024];
    float d;

    memcpy(&d, value, 4);

    sprintf(buf, "%.97f\n", d);
    printf("%s", buf);
    return d;
}

int main() {
    FILE *fileptr;
    char *buffer;
    long filelen;

    fileptr = fopen("ropchain", "rb");  // Open the file in binary mode
    fseek(fileptr, 0, SEEK_END);          // Jump to the end of the file
    filelen = ftell(fileptr);             // Get the current byte offset in the file
    rewind(fileptr);                      // Jump back to the beginning of the file

    buffer = (char *)malloc((filelen+10)*sizeof(char));
    memset(buffer, 0, filelen+10);
    fread(buffer, filelen, 1, fileptr); // Read in the entire file
    fclose(fileptr); // Close the file

    for (int i = 0; 4 * i < filelen; i++) {
        float f = convert(&buffer[4 * i]);
    }

    free(buffer);

    return 0;
}
