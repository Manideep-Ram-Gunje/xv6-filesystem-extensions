#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fs.h"
#include "kernel/fcntl.h"

#define BIGFILE_SIZE (NDIRECT + NINDIRECT + 4733)

int main() {

  int fd;
  char buf[BSIZE]; // BSIZE is 1KB
  long int i,j;
  
  printf("\nTesting big file creation...\n");
  

  for(i=0; i<BSIZE; i++) {
    buf[i]=(i%256);
  }
  
  // Creating file
  fd=open("bigfile", O_CREATE | O_RDWR);
  if(fd<0) {
    printf("Error: cannot create bigfile\n");
    exit(1);
  }
  
  // Writing data blocks
  printf("Writing %ld blocks to bigfile...\n",BIGFILE_SIZE);
  for(i=0; i<BIGFILE_SIZE; i++){

    for(j=0;j<BSIZE;j++){
      buf[j]=(i+j)% 256;
    }

    if(write(fd,buf,BSIZE)!=BSIZE) {
      printf("Error: write failed at block %ld\n",i);
      close(fd);
      exit(1);
    }
    
    if(i%1000==0 && i!=0){
      printf("Written %ld blocks...\n", i);
    }

  }
  
  printf("Write completed. Total blocks: %ld\n",BIGFILE_SIZE);
  
  // Verifying file size
  struct stat st;
  if(fstat(fd,&st) < 0) {
    printf("Error: cannot stat file\n");
    close(fd);
    exit(1);
  }
  
  printf("File size: %ld KB (expected: %ld KB)\n", st.size/1024 , BIGFILE_SIZE);
  
  if(st.size!=BIGFILE_SIZE*BSIZE) {
    printf("Error: file size mismatch!\n");
    close(fd);
    exit(1);
  }

  close(fd);

  fd=open("bigfile", O_RDONLY);
  if(fd<0) {
    printf("Error: cannot reopen bigfile\n");
    exit(1);
  }
  
  printf("Reading back data for verification...\n");
  
  for(i=0; i<BIGFILE_SIZE; i++) {
    if(read(fd,buf,BSIZE)!= BSIZE){
      printf("Error: read failed at block %ld\n", i);
      close(fd);
      exit(1);
    }
    
    // Verifying pattern
    for(j=0; j<BSIZE; j++) {
      if(buf[j]!= (char)((i+j)%256)) {
        printf("Error: data mismatch at block %ld, byte %ld\n",i,j);
        printf("Expected: %ld, Got: %d\n", (i+j)%256, buf[j]&0xFF);
        close(fd);
        exit(1);
      }
    }
  
    if(i%1000==0 && i!=0) {
      printf("Verified %ld blocks...\n", i);
    }
  }
  
  printf("Data verification successful!\n");
  close(fd);
  
  printf("Big file test completed successfully!\n\n");
  

  exit(0);
}