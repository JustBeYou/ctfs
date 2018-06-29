signed __int64 __fastcall encrypt_file(unsigned int a1, const char *a2)
{
  char ptr; // [rsp+1Bh] [rbp-25h]
  int v4; // [rsp+1Ch] [rbp-24h]
  unsigned __int64 i; // [rsp+20h] [rbp-20h]
  FILE *stream; // [rsp+28h] [rbp-18h]
  unsigned __int64 v7; // [rsp+30h] [rbp-10h]
  unsigned __int64 v8; // [rsp+38h] [rbp-8h]

  v8 = __readfsqword(0x28u);
  stream = fopen(a2, "rb+");
  if ( !stream )
    return 1LL;
  srand(a1);
  fseek(stream, 0LL, 2);
  v7 = ftell(stream);
  fseek(stream, 0LL, 0);
  for ( i = 0LL; i < v7; ++i )
  {
    v4 = fread(&ptr, 1uLL, 1uLL, stream);
    if ( v4 != 1 )
    {
      fclose(stream);
      return 2LL;
    }
    ptr ^= rand();
    fseek(stream, -1LL, 1);
    v4 = fwrite(&ptr, 1uLL, 1uLL, stream);
    if ( v4 != 1 )
    {
      fclose(stream);
      return 3LL;
    }
  }
  fclose(stream);
  return 0LL;
}

signed __int64 __fastcall save_key(int a1, const char *a2)
{
  signed __int64 result; // rax
  int ptr; // [rsp+Ch] [rbp-14h]
  int v4; // [rsp+14h] [rbp-Ch]
  FILE *s; // [rsp+18h] [rbp-8h]

  ptr = a1;
  s = fopen(a2, "w+");
  if ( !s )
    return 1LL;
  v4 = fwrite(&ptr, 4uLL, 1uLL, s);
  if ( v4 == 1 )
  {
    fclose(s);
    result = 0LL;
  }
  else
  {
    fclose(s);
    result = 2LL;
  }
  return result;
}

int __cdecl main(int argc, const char **argv, const char **envp)
{
  int result; // eax
  time_t v4; // ST18_8
  unsigned __int16 v5; // [rsp+12h] [rbp-Eh]
  int v6; // [rsp+14h] [rbp-Ch]
  int v7; // [rsp+14h] [rbp-Ch]

  if ( argc > 2 )
  {
    v4 = time(0LL);
    v5 = ((signed __int64)((unsigned __int128)(5247073869855161349LL * (signed __int128)v4) >> 64) >> 10) - (v4 >> 63);
    v6 = encrypt_file(v5, argv[1]);
    switch ( v6 )
    {
      case 1:
        puts("Couldn't open file");
        result = 2;
        break;
      case 2:
        puts("Problems reading file");
        result = 3;
        break;
      case 3:
        puts("Problems writing to file");
        result = 4;
        break;
      default:
        v7 = save_key(v5, argv[2]);
        if ( v7 == 1 )
        {
          puts("Problems opening key file");
          result = 5;
        }
        else if ( v7 == 2 )
        {
          puts("Problems writing to key file");
          result = 6;
        }
        else
        {
          result = 0;
        }
        break;
    }
  }
  else
  {
    printf("Usage: %s <path_to_file> <path_to_key>\n", *argv, envp, argv);
    result = 1;
  }
  return result;
}
