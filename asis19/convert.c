double convert(char *value)
{
  char buf[1024];
  double d;

  memcpy(&d, value, 8);

  sprintf(buf, "%.127lg\n", d);
  printf("There you go %s", buf);
    return d;
}

int main(int argc, char **argv) {
  char buf[8];
  read(0, buf, 8);
  convert(buf);

  return 0;
}
