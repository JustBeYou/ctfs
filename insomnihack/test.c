#include <stdint.h>
#include <stdio.h>

int64_t const_1()
{
  signed int v0; // eax
  signed int v1; // eax
  signed int v2; // eax
  signed int v3; // eax
  signed int v4; // eax
  signed int v5; // eax
  unsigned int v7; // [rsp+Ch] [rbp-Ch]
  signed int i; // [rsp+10h] [rbp-8h]
  signed int v9; // [rsp+14h] [rbp-4h]
  signed int v10; // [rsp+14h] [rbp-4h]
  signed int v11; // [rsp+14h] [rbp-4h]
  signed int v12; // [rsp+14h] [rbp-4h]
  signed int v13; // [rsp+14h] [rbp-4h]
  signed int v14; // [rsp+14h] [rbp-4h]

  for ( i = 0; i < 626; ++i )
    ;
  v7 = 491;
  v9 = 1;
  while ( 1 )
  {
    v0 = v9--;
    if ( v0 <= 0 )
      break;
    v7 -= 766;
  }
  v10 = 1;
  while ( 1 )
  {
    v1 = v10--;
    if ( v1 <= 0 )
      break;
    v7 += 580;
  }
  v11 = 1;
  while ( 1 )
  {
    v2 = v11--;
    if ( v2 <= 0 )
      break;
    v7 -= 330;
  }
  v12 = 1;
  while ( 1 )
  {
    v3 = v12--;
    if ( v3 <= 0 )
      break;
    v7 -= 335;
  }
  v13 = 1;
  while ( 1 )
  {
    v4 = v13--;
    if ( v4 <= 0 )
      break;
    v7 += 626;
  }
  v14 = 1;
  while ( 1 )
  {
    v5 = v14--;
    if ( v5 <= 0 )
      break;
    v7 += 360 - i;
  }
  return v7;
}

int64_t const_2()
{
  signed int v0; // eax
  signed int v1; // eax
  signed int v2; // eax
  signed int v3; // eax
  signed int v5; // [rsp+Ch] [rbp-Ch]
  unsigned int v6; // [rsp+Ch] [rbp-Ch]
  signed int i; // [rsp+10h] [rbp-8h]
  signed int v8; // [rsp+14h] [rbp-4h]
  signed int v9; // [rsp+14h] [rbp-4h]
  signed int v10; // [rsp+14h] [rbp-4h]
  signed int v11; // [rsp+14h] [rbp-4h]

  for ( i = 0; i < 748; ++i )
    ;
  v5 = -1174;
  v8 = 1;
  while ( 1 )
  {
    v0 = v8--;
    if ( v0 <= 0 )
      break;
    v5 -= 1105;
  }
  v9 = 1;
  while ( 1 )
  {
    v1 = v9--;
    if ( v1 <= 0 )
      break;
    v5 += 269;
  }
  v6 = v5 - 89;
  v10 = 1;
  while ( 1 )
  {
    v2 = v10--;
    if ( v2 <= 0 )
      break;
    v6 += 1393;
  }
  v11 = 1;
  while ( 1 )
  {
    v3 = v11--;
    if ( v3 <= 0 )
      break;
    v6 += i;
  }
  return v6;
}

int main() {
  printf("%lld %lld\n", const_1(), const_2());

  return 0;
}
