The main process was forking and then it was reading input from the user. The master process would send the input to it's child, the child would apply some inversable transformation to it and then send it back to the master.
The transformation could be found in the following lines of code:
```
if ( read(pipe_1[0], &buf, 1uLL) <= 0  )
{
std::operator<<<std::char_traits<char>>(&_bss_start, "C: Read failed!\n");
return 0;

}
buf += 96;
rol(&buf, 2);
buf ^= 0x7Fu;
buf = ~buf;
v6 = 237 * buf;
write(fd, &v6, 4uLL);
}
```
After receiving the result, the master process will compare it with some hardcoded values. Doing the steps in reverse order will output the flag.
