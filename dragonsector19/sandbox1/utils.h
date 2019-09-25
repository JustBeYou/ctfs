#ifndef _UTILS_H
#define _UTILS_H

int write_to_path(const char *path, const char *str);
int read_from_path(const char *path, char *buf, size_t len);

int has_slash(const char *name);

#endif // _UTILS_H
