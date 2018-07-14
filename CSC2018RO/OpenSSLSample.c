// created date : 2011/10/15 22:03:33
// last updated : 2011/10/30 22:33:38
// 
// AES128 CBC PKCS7
// Linux, openssl
// $ gcc -O2 OpenSSLSample.c -lm -o test -I/usr/local/ssl/include -L/usr/local/ssl/lib -lcrypto
// $./test
// in.txt を暗号化/復号化して out.txt に保存

#include <openssl/aes.h>
#include <stdio.h>

// 暗号化:1  復号化:0
#define ENCRYPT 0

int main(){
  int i;
  unsigned char data[1024];
  unsigned long data_size; // dataの大きさ
  // key と iv は固定
  unsigned char key[16] = {0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5};
  unsigned char iv[16]  = {0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5};
  AES_KEY enc_key;

  // data  <-  file("in.txt")
  {
	FILE *fp = fopen("in.txt","rb");
	int c;
	if(fp == NULL) return fprintf(stderr,"error0\n");
	for(data_size=0; data_size<1024 && (c=fgetc(fp))!=EOF; data_size++) data[data_size] = c;
	fclose(fp);
  }

#if ENCRYPT
  fprintf(stderr,"encrypt in.txt to out.txt\n");
  // encrypt
  // 暗号化後のサイズ パディング数は 1-16bytes
  unsigned long out_size = ((data_size/AES_BLOCK_SIZE) + 1) * AES_BLOCK_SIZE;
  unsigned char out[out_size]; // 変換後のデータ
  // 暗号化前のデータをパディング
  for(i=data_size; i<out_size; i++) data[i] = (out_size-data_size);
  AES_set_encrypt_key(key, 128, &enc_key); // 128bit = 16byte
  AES_cbc_encrypt(data, out,out_size, &enc_key, iv, AES_ENCRYPT);
#else
  fprintf(stderr,"decrypt in.txt to out.txt\n");
  // decrypt
  unsigned long out_size = data_size;
  unsigned char out[out_size]; // 変換後のデータ
  AES_set_decrypt_key(key, 128, &enc_key);
  AES_cbc_encrypt(data, out, out_size, &enc_key, iv, AES_DECRYPT);
  // 最後のbyte = パディングバイト数
  unsigned char tail = out[out_size-1];
  int/*bool*/ valid = (tail > 0 && tail<=AES_BLOCK_SIZE) ;
  for(i=1;i<tail && valid;i++)
	valid = (out[out_size-1-i] == tail);
  if(!valid) return fprintf(stderr,"padding error.\n");
  // パディング分 削除
  out_size -= tail;
#endif

  // file("out.txt")  <-  data
  {
	FILE *fp = fopen("out.txt","wb");
	if(fp == NULL) return fprintf(stderr,"error1\n");
	for(i=0;i<out_size;i++) fputc(out[i], fp);
	fclose(fp);
  }

  return 0;
}
