#define _GNU_SOURCE
#include <dlfcn.h>
 
typedef size_t (*strlen_orig)(const char *s);
 
size_t strlen(const char *s)
{
    /* Some evil injected code goes here. */
    printf("\nSTRING: %s\n", s);

    strlen_orig ptr; 
    ptr = (strlen_orig)dlsym(RTLD_NEXT,"strlen");
    return ptr(s);
}

typedef int (*printf_orig) ( const char * format, ... );

int printf(const char * format, ... ) { 
    write(0, "pula mea\n", 9);   
  
    printf_orig ptr;
       ptr = (printf_orig)dlsym(RTLD_NEXT,"printf");
       return ptr(format);


}
