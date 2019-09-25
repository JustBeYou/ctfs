#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include <unistd.h> 
#include <sys/socket.h> 
#include <netinet/in.h> 
#include <netdb.h>

#include <pthread.h>

#define LOBYTE(x) x
#define LOWORD(x) x
#define LODWORD(x) x
#define __assert_fail(x, y, z, a) {printf("Failed: %s at %d\n", x, __LINE__); abort();}

typedef struct request_node {
    int64_t ID;
    char *url;
    size_t size;
    pthread_t thread_info;
    struct request_node *next;
} request_node;

typedef struct response_node {
    int ID;
    int is_ok;
    char *status_message;
    size_t size;
    struct response_node* next;
} response_node;

int RID; // weak

//----- (0000000000001365) ----------------------------------------------------
int64_t  min(unsigned int a1, unsigned int a2)
{
  int64_t result; // rax

  result = a2;
  if ( (int)a1 <= (int)a2 )
    result = a1;
  return result;
}

//----- (000000000000137B) ----------------------------------------------------
int64_t  sendall(int a1, const void *a2, size_t a3, int a4)
{
  size_t n; // [rsp+8h] [rbp-28h]
  int flags; // [rsp+18h] [rbp-18h]
  ssize_t v7; // [rsp+28h] [rbp-8h]

  n = a3;
  flags = a4;
  while ( n )
  {
    v7 = send(a1, a2, n, flags);
    if ( v7 < 0 )
    {
      perror("send");
      return 0LL;
    }
    n -= v7;
  }
  return 1LL;
}

//----- (00000000000013DC) ----------------------------------------------------
int64_t  make_request(const struct sockaddr *a1, socklen_t a2, char *a3, char *a4, void **a5, uint64_t *a6)
{
  int *v6; // rax
  int64_t result; // rax
  int *v8; // rax
  size_t v9; // rax
  int *v10; // rax
  size_t v11; // rax
  int *v12; // rax
  int *v13; // rax
  int *v14; // rax
  uint64_t *v15; // [rsp+0h] [rbp-A0h]
  void **v16; // [rsp+8h] [rbp-98h]
  const char *s; // [rsp+10h] [rbp-90h]
  const char *v18; // [rsp+18h] [rbp-88h]
  int fd; // [rsp+3Ch] [rbp-64h]
  int64_t v20; // [rsp+40h] [rbp-60h]
  ssize_t v21; // [rsp+48h] [rbp-58h]
  int64_t optval; // [rsp+50h] [rbp-50h]
  int64_t v23; // [rsp+58h] [rbp-48h]
  char v24[56]; // [rsp+60h] [rbp-40h]

  v18 = a3;
  s = a4;
  v16 = a5;
  v15 = a6;
  fd = socket(a1->sa_family, 1, 0);
  optval = 10LL;
  v23 = 0LL;
  setsockopt(fd, 1, 21, &optval, 0x10u);
  setsockopt(fd, 1, 20, &optval, 0x10u);
  if ( fd >= 0 )
  {
    if ( connect(fd, a1, a2) )
    {
      v8 = __errno_location();
      *v16 = strerror(*v8);
      result = 0LL;
    }
    else if ( (uint8_t)sendall(fd, "GET ", 4uLL, 0x8000) != 1
           || (v9 = strlen(s), (uint8_t)sendall(fd, s, v9, 0x8000) ^ 1)
           || (uint8_t)sendall(fd, " HTTP/1.1\r\n", 0xBuLL, 0x8000) != 1 )
    {
      v10 = __errno_location();
      *v16 = strerror(*v10);
      result = 0LL;
    }
    else if ( (uint8_t)sendall(fd, "Host: ", 6uLL, 0x8000) != 1
           || (v11 = strlen(v18), (uint8_t)sendall(fd, v18, v11, 0x8000) ^ 1)
           || (uint8_t)sendall(fd, "\r\n", 2uLL, 0x8000) != 1 )
    {
      v12 = __errno_location();
      *v16 = strerror(*v12);
      result = 0LL;
    }
    else
    {
      strcpy((char *)&v24, "Accept-Encoding: text/plain\r\nConnection: close\r\n\r\n");
      if ( (uint8_t)sendall(fd, &v24, 0x32uLL, 0) != 1 )
      {
        v13 = __errno_location();
        *v16 = strerror(*v13);
        result = 0LL;
      }
      else
      {
        *v16 = malloc(2048uLL);
        v20 = 2048LL;
        *v15 = 0LL;
        do
        {
          if ( !*v16 )
            __assert_fail("*rbuf", "task/main.c", 0x50u, "make_request");
          v21 = recv(fd, (char *)*v16 + *v15, v20 - *v15, 0);
          if ( v21 < 0 )
          {
            free(*v16);
            v14 = __errno_location();
            *v16 = strerror(*v14);
            return 0LL;
          }
          *v15 += v21;
          if ( (uint64_t)(v20 - *v15) <= 1023 )
          {
            if ( (uint64_t)(v20 + 1024) > 0x300000 )
            {
              puts("memory limit exceeded");
              abort();
            }
            *v16 = realloc(*v16, v20 + 1024);
            v20 += 1024LL;
          }
        }
        while ( v21 );
        *((unsigned char *)*v16 + *v15) = 0;
        result = 1LL;
      }
    }
  }
  else
  {
    v6 =__errno_location();
    *v16 = strerror(*v6);
    result = 0LL;
  }
  return result;
}

//----- (0000000000001858) ----------------------------------------------------
void * fetch(request_node *request)
{
  int v1; // eax
  int64_t *v2; // rax
  int64_t v3; // rdx
  int *v4; // rax
  uint16_t v6; // [rsp+1Ah] [rbp-116h]
  int port; // [rsp+1Ch] [rbp-114h]
  char *name; // [rsp+20h] [rbp-110h]
  char *semicolon_in_url; // [rsp+28h] [rbp-108h]
  char *v10; // [rsp+30h] [rbp-100h]
  char *url_no_protocol; // [rsp+40h] [rbp-F0h]
  char *slash_after_host; // [rsp+48h] [rbp-E8h]
  char *specified_port; // [rsp+50h] [rbp-E0h]
  struct hostent *v14; // [rsp+58h] [rbp-D8h]
  struct hostent *v15; // [rsp+70h] [rbp-C0h]
  void *dest; // [rsp+78h] [rbp-B8h]
  response_node new_response; // [rsp+80h] [rbp-B0h]
  char v18; // [rsp+A0h] [rbp-90h]
  uint16_t v19; // [rsp+A2h] [rbp-8Eh]
  int v20; // [rsp+A4h] [rbp-8Ch]
  int64_t v21; // [rsp+A8h] [rbp-88h]
  int64_t v22; // [rsp+B0h] [rbp-80h]
  char rest[0x80];

  new_response.ID = request->ID;
  LOBYTE(new_response.is_ok) = 1;
  new_response.status_message = 0LL;
  new_response.size = 0LL;
  new_response.next = 0LL;
  name = 0LL;
  v1 = min(request->size, 7u);
  if ( strncmp("http://", request->url, v1) )
  {
    new_response.status_message = "not http";
LABEL_39:
    LOBYTE(new_response.is_ok) = 0;
    new_response.size = strlen(new_response.status_message);
    goto LABEL_40;
  }
  url_no_protocol = request->url + 7;
  slash_after_host = strchrnul(url_no_protocol, '/');
  if ( slash_after_host - url_no_protocol > 256 )
  {
    new_response.status_message = "host too long";
    goto LABEL_39;
  }
  semicolon_in_url = strchr(url_no_protocol, ':');
  if ( semicolon_in_url >= slash_after_host )
    semicolon_in_url = 0LL;
  if ( semicolon_in_url )
  {
    name = strndup(url_no_protocol, semicolon_in_url - url_no_protocol);
    specified_port = strndup(semicolon_in_url + 1, slash_after_host - (semicolon_in_url + 1));
    if ( !specified_port )
      __assert_fail("atstr", "task/main.c", 127u, "fetch");
    port = atoi(specified_port);
    if ( port < 0 || port > 65536 )
    {
      puts("invalid port");
      abort();
    }
    free(specified_port);
  }
  else
  {
    LOWORD(port) = 80;
    name = strndup(url_no_protocol, slash_after_host - url_no_protocol);
  }
  if ( !name )
    __assert_fail("domain", "task/main.c", 135u, "fetch");
  if ( *slash_after_host )
    v10 = slash_after_host;
  else
    v10 = "/";
  if ( *v10 != 47 )
    __assert_fail("path[0] == '/'", "task/main.c", 0x8Du, "fetch");
  v6 = htons(port);
  v14 = gethostbyname2(name, 10);
  memset(&v18, 0, 0x80uLL);
  if ( v14 )
  {
    if ( v14->h_addrtype != 10 )
      __assert_fail("hent6->h_addrtype == AF_INET6", "task/main.c", 0x95u, "fetch");
    v19 = v6;
    *(unsigned short *)&v18 = 10;
    v2 = (int64_t *)*v14->h_addr_list;
    v3 = v2[1];
    v21 = *v2;
    v22 = v3;
    if ( !memcmp(&v21, &in6addr_loopback, 0x10uLL) )
    {
      new_response.status_message = "localhost not allowed";
      goto LABEL_39;
    }
  }
  v15 = gethostbyname2(name, 2);
  if ( v15 )
  {
    if ( v15->h_addrtype != 2 )
      __assert_fail("hent4->h_addrtype == AF_INET", "task/main.c", 0xA0u, "fetch");
    if ( **v15->h_addr_list == 127 )
    {
      new_response.status_message = "localhost not allowed";
      goto LABEL_39;
    }
  }
  if ( !v14
    || !(uint8_t)make_request(
                           (const struct sockaddr *)&v18,
                           0x80u,
                           name,
                           v10,
                           (void **)&new_response.status_message,
                           &new_response.size) )
  {
    if ( v15 )
    {
      *(unsigned short *)&v18 = 2;
      v19 = v6;
      v20 = **(unsigned int **)v15->h_addr_list;
      if ( (uint8_t)make_request(
                              (const struct sockaddr *)&v18,
                              0x80u,
                              name,
                              v10,
                              (void **)&new_response.status_message,
                              &new_response.size) )
        goto LABEL_40;
    }
    else
    {
      v4 = __h_errno_location();
      new_response.status_message = (char *)hstrerror(*v4);
    }
    goto LABEL_39;
  }
LABEL_40:
  free(name);
  dest = calloc(1uLL, 0x20uLL);
  memcpy(dest, &new_response, 0x20uLL);
  return dest;
}

//----- (0000000000001E43) ----------------------------------------------------
int  addp(request_node **head_ptr)
{
  int new_id; // eax
  int result; // eax
  request_node *new_node; // [rsp+10h] [rbp-10h]
  request_node *current; // [rsp+10h] [rbp-10h]
  ssize_t v5; // [rsp+18h] [rbp-8h]

  if ( *head_ptr )
  {
    for ( current = *head_ptr; current->next; current = current->next )
      ;
    current->next = (request_node *)calloc(1uLL, 0x28uLL);
    new_node = current->next;
  }
  else
  {
    new_node = (request_node *)calloc(1uLL, 0x28uLL);
    *head_ptr = new_node;
  }
  new_id = RID++;
  LODWORD(new_node->ID) = new_id;
  printf("url? ");
  v5 = getline(&new_node->url, &new_node->size, stdin);
  if ( v5 < 0 )
  {
    perror("getline");
    abort();
  }
  if ( v5 <= 7 )
  {
    puts("url too short");
    abort();
  }
  new_node->url[v5 - 1] = 0;
  result = pthread_create(&new_node->thread_info, 0LL, (void *(*)(void *))fetch, new_node);
  if ( result )
  {
    puts("error: pthread_create");
    abort();
  }
  return result;
}
// 502C: using guessed type int RID;

//----- (0000000000001F91) ----------------------------------------------------
uint64_t  dopoll(request_node **request_head, response_node **response_head)
{
  int v3; // [rsp+1Ch] [rbp-34h]
  void *thread_return; // [rsp+20h] [rbp-30h]
  response_node **response_tail; // [rsp+28h] [rbp-28h]
  response_node **current_response; // [rsp+30h] [rbp-20h]
  request_node **current_request; // [rsp+38h] [rbp-18h]
  void *request_tail; // [rsp+40h] [rbp-10h]

  if ( *request_head )
  {
    current_response = response_head;
    if ( *response_head )
    {
      while ( *current_response )
        current_response = &(*current_response)->next;
      response_tail = current_response;
    }
    else
    {
      response_tail = response_head;
    }
    current_request = request_head;
    while ( 1 )
    {
      while ( 1 )
      {
        if ( !*current_request )
          return 0;
        v3 = pthread_tryjoin_np((*current_request)->thread_info, &thread_return);
        if ( v3 != 'n' )
          break;
LABEL_18:
        current_request = &(*current_request)->next;
      }
      if ( v3 > 110 )
        goto LABEL_19;
      if ( v3 )
      {
        if ( v3 != 16 )
        {
LABEL_19:
          puts("unexpected pthread_tryjoin_np err");
          abort();
        }
        goto LABEL_18;
      }
      if ( thread_return == (void *)-1LL )
      {
        puts("pthread cancel unexpected");
        abort();
      }
      *response_tail = (response_node *)thread_return;
      response_tail = &(*response_tail)->next;
      request_tail = *current_request;
      *current_request = (*current_request)->next;
      free(request_tail);
    }
  }
  return 0;
}

//----- (00000000000020F2) ----------------------------------------------------
int main(int argc, const char **argv, const char **envp)
{
  char option; // [rsp+1Bh] [rbp-35h]
  unsigned int v5; // [rsp+1Ch] [rbp-34h]
  request_node *request_head; // [rsp+20h] [rbp-30h]
  response_node *response_head; // [rsp+28h] [rbp-28h]
  request_node *v8; // [rsp+30h] [rbp-20h]
  response_node *i; // [rsp+38h] [rbp-18h]
  char *carriage_return_pos; // [rsp+40h] [rbp-10h]

  if ( setvbuf(stdin, 0LL, 2, 0LL) )
  {
    perror("setvbuf");
    abort();
  }
  if ( setvbuf(stdout, 0LL, 2, 0LL) )
  {
    perror("setvbuf");
    abort();
  }
  request_head = 0LL;
  response_head = 0LL;
  while ( 1 )
  {
    do
    {
      puts("What do?");
      puts("\tlist [p]ending requests");
      puts("\tlist [f]inished requests");
      puts("\t[v]iew result of request");
      puts("\t[a]dd new request");
      puts("\t[q]uit");
      printf("Choice? [pfvaq] ");
      v8 = 0LL;
      i = 0LL;
      dopoll(&request_head, &response_head);
    }
    while ( (unsigned int)scanf(" %c", &option) != 1 );
    switch ( option )
    {
      case 'a':
        while ( getc(stdin) != '\n' )
          ;
        addp(&request_head);
        break;
      case 'f':
        i = response_head;
        puts("Done:");
        while ( i )
        {
          if ( LOBYTE(i->is_ok) )
          {
            carriage_return_pos = strchr(i->status_message, '\r');
            if ( carriage_return_pos
              && carriage_return_pos - i->status_message <= 100
              && carriage_return_pos <= &i->status_message[i->size] )
            {
              printf("\t[%u] OK, %.*s\n", i->ID, carriage_return_pos - i->status_message, i->status_message);
            }
            else
            {
              printf("\t[%u] OK, status unknown\n", i->ID);
            }
          }
          else
          {
            printf("\t[%u] FAIL: %s\n", i->ID, i->status_message);
          }
          i = i->next;
        }
        break;
      case 'p':
        v8 = request_head;
        puts("Pending:");
        while ( v8 )
        {
          printf("\t[%u] %s\n", LODWORD(v8->ID), v8->url);
          v8 = v8->next;
        }
        break;
      case 'q':
        return 0;
      case 'v':
        printf("request id? ");
        if ( (unsigned int)scanf("%u", &v5) == 1 )
        {
          for ( i = response_head; i && i->ID != v5; i = i->next )
            ;
          if ( i && i->ID == v5 )
          {
            if ( LOBYTE(i->is_ok) )
            {
              printf("[%u] Response, %lu bytes:\n", i->ID, i->size);
              fwrite(i->status_message, i->size, 1uLL, stdout);
              puts("\n");
            }
            else
            {
              printf("[%u] failed, error: %.*s\n", i->ID, i->size, i->status_message);
            }
          }
          else
          {
            printf("Request %u not found.\n", v5);
          }
        }
        else
        {
          puts("invalid value");
        }
        break;
      default:
        printf("invalid choice '%c'\n", (unsigned int)option);
        break;
    }
  }
}

