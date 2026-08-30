
user/_bigfile:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/fs.h"
#include "kernel/fcntl.h"

#define BIGFILE_SIZE (NDIRECT + NINDIRECT + 4733)

int main() {
   0:	b9010113          	addi	sp,sp,-1136
   4:	46113423          	sd	ra,1128(sp)
   8:	46813023          	sd	s0,1120(sp)
   c:	44913c23          	sd	s1,1112(sp)
  10:	45213823          	sd	s2,1104(sp)
  14:	45313423          	sd	s3,1096(sp)
  18:	45413023          	sd	s4,1088(sp)
  1c:	43513c23          	sd	s5,1080(sp)
  20:	43613823          	sd	s6,1072(sp)
  24:	43713423          	sd	s7,1064(sp)
  28:	43813023          	sd	s8,1056(sp)
  2c:	47010413          	addi	s0,sp,1136

  int fd;
  char buf[BSIZE]; // BSIZE is 1KB
  long int i,j;
  
  printf("\nTesting big file creation...\n");
  30:	00001517          	auipc	a0,0x1
  34:	ae050513          	addi	a0,a0,-1312 # b10 <malloc+0xf8>
  38:	12d000ef          	jal	964 <printf>
  

  for(i=0; i<BSIZE; i++) {
  3c:	bb040a93          	addi	s5,s0,-1104
  printf("\nTesting big file creation...\n");
  40:	8756                	mv	a4,s5
  for(i=0; i<BSIZE; i++) {
  42:	4781                	li	a5,0
  44:	40000693          	li	a3,1024
    buf[i]=(i%256);
  48:	00f70023          	sb	a5,0(a4)
  for(i=0; i<BSIZE; i++) {
  4c:	0785                	addi	a5,a5,1
  4e:	0705                	addi	a4,a4,1
  50:	fed79ce3          	bne	a5,a3,48 <main+0x48>
  }
  
  // Creating file
  fd=open("bigfile", O_CREATE | O_RDWR);
  54:	20200593          	li	a1,514
  58:	00001517          	auipc	a0,0x1
  5c:	ae050513          	addi	a0,a0,-1312 # b38 <malloc+0x120>
  60:	508000ef          	jal	568 <open>
  64:	8a2a                	mv	s4,a0
  if(fd<0) {
  66:	02054c63          	bltz	a0,9e <main+0x9e>
    printf("Error: cannot create bigfile\n");
    exit(1);
  }
  
  // Writing data blocks
  printf("Writing %ld blocks to bigfile...\n",BIGFILE_SIZE);
  6a:	6585                	lui	a1,0x1
  6c:	38858593          	addi	a1,a1,904 # 1388 <base+0x378>
  70:	00001517          	auipc	a0,0x1
  74:	af050513          	addi	a0,a0,-1296 # b60 <malloc+0x148>
  78:	0ed000ef          	jal	964 <printf>
  for(i=0; i<BIGFILE_SIZE; i++){
  7c:	415004b3          	neg	s1,s5
  80:	6b05                	lui	s6,0x1
  82:	388b0b13          	addi	s6,s6,904 # 1388 <base+0x378>
  86:	415b0b33          	sub	s6,s6,s5
  8a:	4981                	li	s3,0
  8c:	400a8913          	addi	s2,s5,1024
      printf("Error: write failed at block %ld\n",i);
      close(fd);
      exit(1);
    }
    
    if(i%1000==0 && i!=0){
  90:	3e800b93          	li	s7,1000
      printf("Written %ld blocks...\n", i);
  94:	00001c17          	auipc	s8,0x1
  98:	b1cc0c13          	addi	s8,s8,-1252 # bb0 <malloc+0x198>
  9c:	a81d                	j	d2 <main+0xd2>
    printf("Error: cannot create bigfile\n");
  9e:	00001517          	auipc	a0,0x1
  a2:	aa250513          	addi	a0,a0,-1374 # b40 <malloc+0x128>
  a6:	0bf000ef          	jal	964 <printf>
    exit(1);
  aa:	4505                	li	a0,1
  ac:	47c000ef          	jal	528 <exit>
      printf("Error: write failed at block %ld\n",i);
  b0:	85ce                	mv	a1,s3
  b2:	00001517          	auipc	a0,0x1
  b6:	ad650513          	addi	a0,a0,-1322 # b88 <malloc+0x170>
  ba:	0ab000ef          	jal	964 <printf>
      close(fd);
  be:	8552                	mv	a0,s4
  c0:	490000ef          	jal	550 <close>
      exit(1);
  c4:	4505                	li	a0,1
  c6:	462000ef          	jal	528 <exit>
  for(i=0; i<BIGFILE_SIZE; i++){
  ca:	0985                	addi	s3,s3,1
  cc:	0485                	addi	s1,s1,1
  ce:	03648f63          	beq	s1,s6,10c <main+0x10c>
  for(i=0; i<BSIZE; i++) {
  d2:	87d6                	mv	a5,s5
      buf[j]=(i+j)% 256;
  d4:	00978733          	add	a4,a5,s1
  d8:	00e78023          	sb	a4,0(a5)
    for(j=0;j<BSIZE;j++){
  dc:	0785                	addi	a5,a5,1
  de:	ff279be3          	bne	a5,s2,d4 <main+0xd4>
    if(write(fd,buf,BSIZE)!=BSIZE) {
  e2:	40000613          	li	a2,1024
  e6:	bb040593          	addi	a1,s0,-1104
  ea:	8552                	mv	a0,s4
  ec:	45c000ef          	jal	548 <write>
  f0:	40000793          	li	a5,1024
  f4:	faf51ee3          	bne	a0,a5,b0 <main+0xb0>
    if(i%1000==0 && i!=0){
  f8:	0379e7b3          	rem	a5,s3,s7
  fc:	f7f9                	bnez	a5,ca <main+0xca>
  fe:	fc0986e3          	beqz	s3,ca <main+0xca>
      printf("Written %ld blocks...\n", i);
 102:	85ce                	mv	a1,s3
 104:	8562                	mv	a0,s8
 106:	05f000ef          	jal	964 <printf>
 10a:	b7c1                	j	ca <main+0xca>
    }

  }
  
  printf("Write completed. Total blocks: %ld\n",BIGFILE_SIZE);
 10c:	6585                	lui	a1,0x1
 10e:	38858593          	addi	a1,a1,904 # 1388 <base+0x378>
 112:	00001517          	auipc	a0,0x1
 116:	ab650513          	addi	a0,a0,-1354 # bc8 <malloc+0x1b0>
 11a:	04b000ef          	jal	964 <printf>
  
  // Verifying file size
  struct stat st;
  if(fstat(fd,&st) < 0) {
 11e:	b9840593          	addi	a1,s0,-1128
 122:	8552                	mv	a0,s4
 124:	45c000ef          	jal	580 <fstat>
 128:	04054063          	bltz	a0,168 <main+0x168>
    printf("Error: cannot stat file\n");
    close(fd);
    exit(1);
  }
  
  printf("File size: %ld KB (expected: %ld KB)\n", st.size/1024 , BIGFILE_SIZE);
 12c:	6605                	lui	a2,0x1
 12e:	38860613          	addi	a2,a2,904 # 1388 <base+0x378>
 132:	ba843583          	ld	a1,-1112(s0)
 136:	81a9                	srli	a1,a1,0xa
 138:	00001517          	auipc	a0,0x1
 13c:	ad850513          	addi	a0,a0,-1320 # c10 <malloc+0x1f8>
 140:	025000ef          	jal	964 <printf>
  
  if(st.size!=BIGFILE_SIZE*BSIZE) {
 144:	ba843703          	ld	a4,-1112(s0)
 148:	004e27b7          	lui	a5,0x4e2
 14c:	02f70a63          	beq	a4,a5,180 <main+0x180>
    printf("Error: file size mismatch!\n");
 150:	00001517          	auipc	a0,0x1
 154:	ae850513          	addi	a0,a0,-1304 # c38 <malloc+0x220>
 158:	00d000ef          	jal	964 <printf>
    close(fd);
 15c:	8552                	mv	a0,s4
 15e:	3f2000ef          	jal	550 <close>
    exit(1);
 162:	4505                	li	a0,1
 164:	3c4000ef          	jal	528 <exit>
    printf("Error: cannot stat file\n");
 168:	00001517          	auipc	a0,0x1
 16c:	a8850513          	addi	a0,a0,-1400 # bf0 <malloc+0x1d8>
 170:	7f4000ef          	jal	964 <printf>
    close(fd);
 174:	8552                	mv	a0,s4
 176:	3da000ef          	jal	550 <close>
    exit(1);
 17a:	4505                	li	a0,1
 17c:	3ac000ef          	jal	528 <exit>
  }

  close(fd);
 180:	8552                	mv	a0,s4
 182:	3ce000ef          	jal	550 <close>

  fd=open("bigfile", O_RDONLY);
 186:	4581                	li	a1,0
 188:	00001517          	auipc	a0,0x1
 18c:	9b050513          	addi	a0,a0,-1616 # b38 <malloc+0x120>
 190:	3d8000ef          	jal	568 <open>
 194:	89aa                	mv	s3,a0
  if(fd<0) {
 196:	04054e63          	bltz	a0,1f2 <main+0x1f2>
    printf("Error: cannot reopen bigfile\n");
    exit(1);
  }
  
  printf("Reading back data for verification...\n");
 19a:	00001517          	auipc	a0,0x1
 19e:	ade50513          	addi	a0,a0,-1314 # c78 <malloc+0x260>
 1a2:	7c2000ef          	jal	964 <printf>
  
  for(i=0; i<BIGFILE_SIZE; i++) {
 1a6:	4481                	li	s1,0
    if(read(fd,buf,BSIZE)!= BSIZE){
 1a8:	40000a93          	li	s5,1024
      exit(1);
    }
    
    // Verifying pattern
    for(j=0; j<BSIZE; j++) {
      if(buf[j]!= (char)((i+j)%256)) {
 1ac:	10000b13          	li	s6,256
    if(read(fd,buf,BSIZE)!= BSIZE){
 1b0:	8656                	mv	a2,s5
 1b2:	bb040593          	addi	a1,s0,-1104
 1b6:	854e                	mv	a0,s3
 1b8:	388000ef          	jal	540 <read>
 1bc:	05551463          	bne	a0,s5,204 <main+0x204>
    for(j=0; j<BSIZE; j++) {
 1c0:	4901                	li	s2,0
      if(buf[j]!= (char)((i+j)%256)) {
 1c2:	01248a33          	add	s4,s1,s2
 1c6:	036a6a33          	rem	s4,s4,s6
 1ca:	bb040793          	addi	a5,s0,-1104
 1ce:	97ca                	add	a5,a5,s2
 1d0:	0007c703          	lbu	a4,0(a5) # 4e2000 <base+0x4e0ff0>
 1d4:	0ffa7793          	zext.b	a5,s4
 1d8:	04f71363          	bne	a4,a5,21e <main+0x21e>
    for(j=0; j<BSIZE; j++) {
 1dc:	0905                	addi	s2,s2,1
 1de:	ff5912e3          	bne	s2,s5,1c2 <main+0x1c2>
        close(fd);
        exit(1);
      }
    }
  
    if(i%1000==0 && i!=0) {
 1e2:	3e800793          	li	a5,1000
 1e6:	02f4e7b3          	rem	a5,s1,a5
 1ea:	efa5                	bnez	a5,262 <main+0x262>
 1ec:	e4a5                	bnez	s1,254 <main+0x254>
  for(i=0; i<BIGFILE_SIZE; i++) {
 1ee:	0485                	addi	s1,s1,1
 1f0:	b7c1                	j	1b0 <main+0x1b0>
    printf("Error: cannot reopen bigfile\n");
 1f2:	00001517          	auipc	a0,0x1
 1f6:	a6650513          	addi	a0,a0,-1434 # c58 <malloc+0x240>
 1fa:	76a000ef          	jal	964 <printf>
    exit(1);
 1fe:	4505                	li	a0,1
 200:	328000ef          	jal	528 <exit>
      printf("Error: read failed at block %ld\n", i);
 204:	85a6                	mv	a1,s1
 206:	00001517          	auipc	a0,0x1
 20a:	a9a50513          	addi	a0,a0,-1382 # ca0 <malloc+0x288>
 20e:	756000ef          	jal	964 <printf>
      close(fd);
 212:	854e                	mv	a0,s3
 214:	33c000ef          	jal	550 <close>
      exit(1);
 218:	4505                	li	a0,1
 21a:	30e000ef          	jal	528 <exit>
        printf("Error: data mismatch at block %ld, byte %ld\n",i,j);
 21e:	864a                	mv	a2,s2
 220:	85a6                	mv	a1,s1
 222:	00001517          	auipc	a0,0x1
 226:	aa650513          	addi	a0,a0,-1370 # cc8 <malloc+0x2b0>
 22a:	73a000ef          	jal	964 <printf>
        printf("Expected: %ld, Got: %d\n", (i+j)%256, buf[j]&0xFF);
 22e:	fb090793          	addi	a5,s2,-80
 232:	00878933          	add	s2,a5,s0
 236:	c0094603          	lbu	a2,-1024(s2)
 23a:	85d2                	mv	a1,s4
 23c:	00001517          	auipc	a0,0x1
 240:	abc50513          	addi	a0,a0,-1348 # cf8 <malloc+0x2e0>
 244:	720000ef          	jal	964 <printf>
        close(fd);
 248:	854e                	mv	a0,s3
 24a:	306000ef          	jal	550 <close>
        exit(1);
 24e:	4505                	li	a0,1
 250:	2d8000ef          	jal	528 <exit>
      printf("Verified %ld blocks...\n", i);
 254:	85a6                	mv	a1,s1
 256:	00001517          	auipc	a0,0x1
 25a:	aba50513          	addi	a0,a0,-1350 # d10 <malloc+0x2f8>
 25e:	706000ef          	jal	964 <printf>
  for(i=0; i<BIGFILE_SIZE; i++) {
 262:	0485                	addi	s1,s1,1
 264:	6785                	lui	a5,0x1
 266:	38878793          	addi	a5,a5,904 # 1388 <base+0x378>
 26a:	f4f493e3          	bne	s1,a5,1b0 <main+0x1b0>
    }
  }
  
  printf("Data verification successful!\n");
 26e:	00001517          	auipc	a0,0x1
 272:	aba50513          	addi	a0,a0,-1350 # d28 <malloc+0x310>
 276:	6ee000ef          	jal	964 <printf>
  close(fd);
 27a:	854e                	mv	a0,s3
 27c:	2d4000ef          	jal	550 <close>
  
  printf("Big file test completed successfully!\n\n");
 280:	00001517          	auipc	a0,0x1
 284:	ac850513          	addi	a0,a0,-1336 # d48 <malloc+0x330>
 288:	6dc000ef          	jal	964 <printf>
  

  exit(0);
 28c:	4501                	li	a0,0
 28e:	29a000ef          	jal	528 <exit>

0000000000000292 <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start()
{
 292:	1141                	addi	sp,sp,-16
 294:	e406                	sd	ra,8(sp)
 296:	e022                	sd	s0,0(sp)
 298:	0800                	addi	s0,sp,16
  extern int main();
  main();
 29a:	d67ff0ef          	jal	0 <main>
  exit(0);
 29e:	4501                	li	a0,0
 2a0:	288000ef          	jal	528 <exit>

00000000000002a4 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 2a4:	1141                	addi	sp,sp,-16
 2a6:	e422                	sd	s0,8(sp)
 2a8:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2aa:	87aa                	mv	a5,a0
 2ac:	0585                	addi	a1,a1,1
 2ae:	0785                	addi	a5,a5,1
 2b0:	fff5c703          	lbu	a4,-1(a1)
 2b4:	fee78fa3          	sb	a4,-1(a5)
 2b8:	fb75                	bnez	a4,2ac <strcpy+0x8>
    ;
  return os;
}
 2ba:	6422                	ld	s0,8(sp)
 2bc:	0141                	addi	sp,sp,16
 2be:	8082                	ret

00000000000002c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2c0:	1141                	addi	sp,sp,-16
 2c2:	e422                	sd	s0,8(sp)
 2c4:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 2c6:	00054783          	lbu	a5,0(a0)
 2ca:	cb91                	beqz	a5,2de <strcmp+0x1e>
 2cc:	0005c703          	lbu	a4,0(a1)
 2d0:	00f71763          	bne	a4,a5,2de <strcmp+0x1e>
    p++, q++;
 2d4:	0505                	addi	a0,a0,1
 2d6:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 2d8:	00054783          	lbu	a5,0(a0)
 2dc:	fbe5                	bnez	a5,2cc <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 2de:	0005c503          	lbu	a0,0(a1)
}
 2e2:	40a7853b          	subw	a0,a5,a0
 2e6:	6422                	ld	s0,8(sp)
 2e8:	0141                	addi	sp,sp,16
 2ea:	8082                	ret

00000000000002ec <strlen>:

uint
strlen(const char *s)
{
 2ec:	1141                	addi	sp,sp,-16
 2ee:	e422                	sd	s0,8(sp)
 2f0:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 2f2:	00054783          	lbu	a5,0(a0)
 2f6:	cf91                	beqz	a5,312 <strlen+0x26>
 2f8:	0505                	addi	a0,a0,1
 2fa:	87aa                	mv	a5,a0
 2fc:	86be                	mv	a3,a5
 2fe:	0785                	addi	a5,a5,1
 300:	fff7c703          	lbu	a4,-1(a5)
 304:	ff65                	bnez	a4,2fc <strlen+0x10>
 306:	40a6853b          	subw	a0,a3,a0
 30a:	2505                	addiw	a0,a0,1
    ;
  return n;
}
 30c:	6422                	ld	s0,8(sp)
 30e:	0141                	addi	sp,sp,16
 310:	8082                	ret
  for(n = 0; s[n]; n++)
 312:	4501                	li	a0,0
 314:	bfe5                	j	30c <strlen+0x20>

0000000000000316 <memset>:

void*
memset(void *dst, int c, uint n)
{
 316:	1141                	addi	sp,sp,-16
 318:	e422                	sd	s0,8(sp)
 31a:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 31c:	ca19                	beqz	a2,332 <memset+0x1c>
 31e:	87aa                	mv	a5,a0
 320:	1602                	slli	a2,a2,0x20
 322:	9201                	srli	a2,a2,0x20
 324:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 328:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 32c:	0785                	addi	a5,a5,1
 32e:	fee79de3          	bne	a5,a4,328 <memset+0x12>
  }
  return dst;
}
 332:	6422                	ld	s0,8(sp)
 334:	0141                	addi	sp,sp,16
 336:	8082                	ret

0000000000000338 <strchr>:

char*
strchr(const char *s, char c)
{
 338:	1141                	addi	sp,sp,-16
 33a:	e422                	sd	s0,8(sp)
 33c:	0800                	addi	s0,sp,16
  for(; *s; s++)
 33e:	00054783          	lbu	a5,0(a0)
 342:	cb99                	beqz	a5,358 <strchr+0x20>
    if(*s == c)
 344:	00f58763          	beq	a1,a5,352 <strchr+0x1a>
  for(; *s; s++)
 348:	0505                	addi	a0,a0,1
 34a:	00054783          	lbu	a5,0(a0)
 34e:	fbfd                	bnez	a5,344 <strchr+0xc>
      return (char*)s;
  return 0;
 350:	4501                	li	a0,0
}
 352:	6422                	ld	s0,8(sp)
 354:	0141                	addi	sp,sp,16
 356:	8082                	ret
  return 0;
 358:	4501                	li	a0,0
 35a:	bfe5                	j	352 <strchr+0x1a>

000000000000035c <gets>:

char*
gets(char *buf, int max)
{
 35c:	711d                	addi	sp,sp,-96
 35e:	ec86                	sd	ra,88(sp)
 360:	e8a2                	sd	s0,80(sp)
 362:	e4a6                	sd	s1,72(sp)
 364:	e0ca                	sd	s2,64(sp)
 366:	fc4e                	sd	s3,56(sp)
 368:	f852                	sd	s4,48(sp)
 36a:	f456                	sd	s5,40(sp)
 36c:	f05a                	sd	s6,32(sp)
 36e:	ec5e                	sd	s7,24(sp)
 370:	1080                	addi	s0,sp,96
 372:	8baa                	mv	s7,a0
 374:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 376:	892a                	mv	s2,a0
 378:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 37a:	4aa9                	li	s5,10
 37c:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 37e:	89a6                	mv	s3,s1
 380:	2485                	addiw	s1,s1,1
 382:	0344d663          	bge	s1,s4,3ae <gets+0x52>
    cc = read(0, &c, 1);
 386:	4605                	li	a2,1
 388:	faf40593          	addi	a1,s0,-81
 38c:	4501                	li	a0,0
 38e:	1b2000ef          	jal	540 <read>
    if(cc < 1)
 392:	00a05e63          	blez	a0,3ae <gets+0x52>
    buf[i++] = c;
 396:	faf44783          	lbu	a5,-81(s0)
 39a:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 39e:	01578763          	beq	a5,s5,3ac <gets+0x50>
 3a2:	0905                	addi	s2,s2,1
 3a4:	fd679de3          	bne	a5,s6,37e <gets+0x22>
    buf[i++] = c;
 3a8:	89a6                	mv	s3,s1
 3aa:	a011                	j	3ae <gets+0x52>
 3ac:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 3ae:	99de                	add	s3,s3,s7
 3b0:	00098023          	sb	zero,0(s3)
  return buf;
}
 3b4:	855e                	mv	a0,s7
 3b6:	60e6                	ld	ra,88(sp)
 3b8:	6446                	ld	s0,80(sp)
 3ba:	64a6                	ld	s1,72(sp)
 3bc:	6906                	ld	s2,64(sp)
 3be:	79e2                	ld	s3,56(sp)
 3c0:	7a42                	ld	s4,48(sp)
 3c2:	7aa2                	ld	s5,40(sp)
 3c4:	7b02                	ld	s6,32(sp)
 3c6:	6be2                	ld	s7,24(sp)
 3c8:	6125                	addi	sp,sp,96
 3ca:	8082                	ret

00000000000003cc <stat>:

int
stat(const char *n, struct stat *st)
{
 3cc:	1101                	addi	sp,sp,-32
 3ce:	ec06                	sd	ra,24(sp)
 3d0:	e822                	sd	s0,16(sp)
 3d2:	e04a                	sd	s2,0(sp)
 3d4:	1000                	addi	s0,sp,32
 3d6:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3d8:	4581                	li	a1,0
 3da:	18e000ef          	jal	568 <open>
  if(fd < 0)
 3de:	02054263          	bltz	a0,402 <stat+0x36>
 3e2:	e426                	sd	s1,8(sp)
 3e4:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 3e6:	85ca                	mv	a1,s2
 3e8:	198000ef          	jal	580 <fstat>
 3ec:	892a                	mv	s2,a0
  close(fd);
 3ee:	8526                	mv	a0,s1
 3f0:	160000ef          	jal	550 <close>
  return r;
 3f4:	64a2                	ld	s1,8(sp)
}
 3f6:	854a                	mv	a0,s2
 3f8:	60e2                	ld	ra,24(sp)
 3fa:	6442                	ld	s0,16(sp)
 3fc:	6902                	ld	s2,0(sp)
 3fe:	6105                	addi	sp,sp,32
 400:	8082                	ret
    return -1;
 402:	597d                	li	s2,-1
 404:	bfcd                	j	3f6 <stat+0x2a>

0000000000000406 <atoi>:

int
atoi(const char *s)
{
 406:	1141                	addi	sp,sp,-16
 408:	e422                	sd	s0,8(sp)
 40a:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 40c:	00054683          	lbu	a3,0(a0)
 410:	fd06879b          	addiw	a5,a3,-48
 414:	0ff7f793          	zext.b	a5,a5
 418:	4625                	li	a2,9
 41a:	02f66863          	bltu	a2,a5,44a <atoi+0x44>
 41e:	872a                	mv	a4,a0
  n = 0;
 420:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 422:	0705                	addi	a4,a4,1
 424:	0025179b          	slliw	a5,a0,0x2
 428:	9fa9                	addw	a5,a5,a0
 42a:	0017979b          	slliw	a5,a5,0x1
 42e:	9fb5                	addw	a5,a5,a3
 430:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 434:	00074683          	lbu	a3,0(a4)
 438:	fd06879b          	addiw	a5,a3,-48
 43c:	0ff7f793          	zext.b	a5,a5
 440:	fef671e3          	bgeu	a2,a5,422 <atoi+0x1c>
  return n;
}
 444:	6422                	ld	s0,8(sp)
 446:	0141                	addi	sp,sp,16
 448:	8082                	ret
  n = 0;
 44a:	4501                	li	a0,0
 44c:	bfe5                	j	444 <atoi+0x3e>

000000000000044e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 44e:	1141                	addi	sp,sp,-16
 450:	e422                	sd	s0,8(sp)
 452:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 454:	02b57463          	bgeu	a0,a1,47c <memmove+0x2e>
    while(n-- > 0)
 458:	00c05f63          	blez	a2,476 <memmove+0x28>
 45c:	1602                	slli	a2,a2,0x20
 45e:	9201                	srli	a2,a2,0x20
 460:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 464:	872a                	mv	a4,a0
      *dst++ = *src++;
 466:	0585                	addi	a1,a1,1
 468:	0705                	addi	a4,a4,1
 46a:	fff5c683          	lbu	a3,-1(a1)
 46e:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 472:	fef71ae3          	bne	a4,a5,466 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 476:	6422                	ld	s0,8(sp)
 478:	0141                	addi	sp,sp,16
 47a:	8082                	ret
    dst += n;
 47c:	00c50733          	add	a4,a0,a2
    src += n;
 480:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 482:	fec05ae3          	blez	a2,476 <memmove+0x28>
 486:	fff6079b          	addiw	a5,a2,-1
 48a:	1782                	slli	a5,a5,0x20
 48c:	9381                	srli	a5,a5,0x20
 48e:	fff7c793          	not	a5,a5
 492:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 494:	15fd                	addi	a1,a1,-1
 496:	177d                	addi	a4,a4,-1
 498:	0005c683          	lbu	a3,0(a1)
 49c:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 4a0:	fee79ae3          	bne	a5,a4,494 <memmove+0x46>
 4a4:	bfc9                	j	476 <memmove+0x28>

00000000000004a6 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 4a6:	1141                	addi	sp,sp,-16
 4a8:	e422                	sd	s0,8(sp)
 4aa:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 4ac:	ca05                	beqz	a2,4dc <memcmp+0x36>
 4ae:	fff6069b          	addiw	a3,a2,-1
 4b2:	1682                	slli	a3,a3,0x20
 4b4:	9281                	srli	a3,a3,0x20
 4b6:	0685                	addi	a3,a3,1
 4b8:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 4ba:	00054783          	lbu	a5,0(a0)
 4be:	0005c703          	lbu	a4,0(a1)
 4c2:	00e79863          	bne	a5,a4,4d2 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 4c6:	0505                	addi	a0,a0,1
    p2++;
 4c8:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 4ca:	fed518e3          	bne	a0,a3,4ba <memcmp+0x14>
  }
  return 0;
 4ce:	4501                	li	a0,0
 4d0:	a019                	j	4d6 <memcmp+0x30>
      return *p1 - *p2;
 4d2:	40e7853b          	subw	a0,a5,a4
}
 4d6:	6422                	ld	s0,8(sp)
 4d8:	0141                	addi	sp,sp,16
 4da:	8082                	ret
  return 0;
 4dc:	4501                	li	a0,0
 4de:	bfe5                	j	4d6 <memcmp+0x30>

00000000000004e0 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4e0:	1141                	addi	sp,sp,-16
 4e2:	e406                	sd	ra,8(sp)
 4e4:	e022                	sd	s0,0(sp)
 4e6:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 4e8:	f67ff0ef          	jal	44e <memmove>
}
 4ec:	60a2                	ld	ra,8(sp)
 4ee:	6402                	ld	s0,0(sp)
 4f0:	0141                	addi	sp,sp,16
 4f2:	8082                	ret

00000000000004f4 <sbrk>:

char *
sbrk(int n) {
 4f4:	1141                	addi	sp,sp,-16
 4f6:	e406                	sd	ra,8(sp)
 4f8:	e022                	sd	s0,0(sp)
 4fa:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_EAGER);
 4fc:	4585                	li	a1,1
 4fe:	0b2000ef          	jal	5b0 <sys_sbrk>
}
 502:	60a2                	ld	ra,8(sp)
 504:	6402                	ld	s0,0(sp)
 506:	0141                	addi	sp,sp,16
 508:	8082                	ret

000000000000050a <sbrklazy>:

char *
sbrklazy(int n) {
 50a:	1141                	addi	sp,sp,-16
 50c:	e406                	sd	ra,8(sp)
 50e:	e022                	sd	s0,0(sp)
 510:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_LAZY);
 512:	4589                	li	a1,2
 514:	09c000ef          	jal	5b0 <sys_sbrk>
}
 518:	60a2                	ld	ra,8(sp)
 51a:	6402                	ld	s0,0(sp)
 51c:	0141                	addi	sp,sp,16
 51e:	8082                	ret

0000000000000520 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 520:	4885                	li	a7,1
 ecall
 522:	00000073          	ecall
 ret
 526:	8082                	ret

0000000000000528 <exit>:
.global exit
exit:
 li a7, SYS_exit
 528:	4889                	li	a7,2
 ecall
 52a:	00000073          	ecall
 ret
 52e:	8082                	ret

0000000000000530 <wait>:
.global wait
wait:
 li a7, SYS_wait
 530:	488d                	li	a7,3
 ecall
 532:	00000073          	ecall
 ret
 536:	8082                	ret

0000000000000538 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 538:	4891                	li	a7,4
 ecall
 53a:	00000073          	ecall
 ret
 53e:	8082                	ret

0000000000000540 <read>:
.global read
read:
 li a7, SYS_read
 540:	4895                	li	a7,5
 ecall
 542:	00000073          	ecall
 ret
 546:	8082                	ret

0000000000000548 <write>:
.global write
write:
 li a7, SYS_write
 548:	48c1                	li	a7,16
 ecall
 54a:	00000073          	ecall
 ret
 54e:	8082                	ret

0000000000000550 <close>:
.global close
close:
 li a7, SYS_close
 550:	48d5                	li	a7,21
 ecall
 552:	00000073          	ecall
 ret
 556:	8082                	ret

0000000000000558 <kill>:
.global kill
kill:
 li a7, SYS_kill
 558:	4899                	li	a7,6
 ecall
 55a:	00000073          	ecall
 ret
 55e:	8082                	ret

0000000000000560 <exec>:
.global exec
exec:
 li a7, SYS_exec
 560:	489d                	li	a7,7
 ecall
 562:	00000073          	ecall
 ret
 566:	8082                	ret

0000000000000568 <open>:
.global open
open:
 li a7, SYS_open
 568:	48bd                	li	a7,15
 ecall
 56a:	00000073          	ecall
 ret
 56e:	8082                	ret

0000000000000570 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 570:	48c5                	li	a7,17
 ecall
 572:	00000073          	ecall
 ret
 576:	8082                	ret

0000000000000578 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 578:	48c9                	li	a7,18
 ecall
 57a:	00000073          	ecall
 ret
 57e:	8082                	ret

0000000000000580 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 580:	48a1                	li	a7,8
 ecall
 582:	00000073          	ecall
 ret
 586:	8082                	ret

0000000000000588 <link>:
.global link
link:
 li a7, SYS_link
 588:	48cd                	li	a7,19
 ecall
 58a:	00000073          	ecall
 ret
 58e:	8082                	ret

0000000000000590 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 590:	48d1                	li	a7,20
 ecall
 592:	00000073          	ecall
 ret
 596:	8082                	ret

0000000000000598 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 598:	48a5                	li	a7,9
 ecall
 59a:	00000073          	ecall
 ret
 59e:	8082                	ret

00000000000005a0 <dup>:
.global dup
dup:
 li a7, SYS_dup
 5a0:	48a9                	li	a7,10
 ecall
 5a2:	00000073          	ecall
 ret
 5a6:	8082                	ret

00000000000005a8 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 5a8:	48ad                	li	a7,11
 ecall
 5aa:	00000073          	ecall
 ret
 5ae:	8082                	ret

00000000000005b0 <sys_sbrk>:
.global sys_sbrk
sys_sbrk:
 li a7, SYS_sbrk
 5b0:	48b1                	li	a7,12
 ecall
 5b2:	00000073          	ecall
 ret
 5b6:	8082                	ret

00000000000005b8 <pause>:
.global pause
pause:
 li a7, SYS_pause
 5b8:	48b5                	li	a7,13
 ecall
 5ba:	00000073          	ecall
 ret
 5be:	8082                	ret

00000000000005c0 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 5c0:	48b9                	li	a7,14
 ecall
 5c2:	00000073          	ecall
 ret
 5c6:	8082                	ret

00000000000005c8 <symlink>:
.global symlink
symlink:
 li a7, SYS_symlink
 5c8:	48d9                	li	a7,22
 ecall
 5ca:	00000073          	ecall
 ret
 5ce:	8082                	ret

00000000000005d0 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 5d0:	1101                	addi	sp,sp,-32
 5d2:	ec06                	sd	ra,24(sp)
 5d4:	e822                	sd	s0,16(sp)
 5d6:	1000                	addi	s0,sp,32
 5d8:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 5dc:	4605                	li	a2,1
 5de:	fef40593          	addi	a1,s0,-17
 5e2:	f67ff0ef          	jal	548 <write>
}
 5e6:	60e2                	ld	ra,24(sp)
 5e8:	6442                	ld	s0,16(sp)
 5ea:	6105                	addi	sp,sp,32
 5ec:	8082                	ret

00000000000005ee <printint>:

static void
printint(int fd, long long xx, int base, int sgn)
{
 5ee:	715d                	addi	sp,sp,-80
 5f0:	e486                	sd	ra,72(sp)
 5f2:	e0a2                	sd	s0,64(sp)
 5f4:	fc26                	sd	s1,56(sp)
 5f6:	0880                	addi	s0,sp,80
 5f8:	84aa                	mv	s1,a0
  char buf[20];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5fa:	c299                	beqz	a3,600 <printint+0x12>
 5fc:	0805c963          	bltz	a1,68e <printint+0xa0>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 600:	2581                	sext.w	a1,a1
  neg = 0;
 602:	4881                	li	a7,0
 604:	fb840693          	addi	a3,s0,-72
  }

  i = 0;
 608:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 60a:	2601                	sext.w	a2,a2
 60c:	00000517          	auipc	a0,0x0
 610:	76c50513          	addi	a0,a0,1900 # d78 <digits>
 614:	883a                	mv	a6,a4
 616:	2705                	addiw	a4,a4,1
 618:	02c5f7bb          	remuw	a5,a1,a2
 61c:	1782                	slli	a5,a5,0x20
 61e:	9381                	srli	a5,a5,0x20
 620:	97aa                	add	a5,a5,a0
 622:	0007c783          	lbu	a5,0(a5)
 626:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 62a:	0005879b          	sext.w	a5,a1
 62e:	02c5d5bb          	divuw	a1,a1,a2
 632:	0685                	addi	a3,a3,1
 634:	fec7f0e3          	bgeu	a5,a2,614 <printint+0x26>
  if(neg)
 638:	00088c63          	beqz	a7,650 <printint+0x62>
    buf[i++] = '-';
 63c:	fd070793          	addi	a5,a4,-48
 640:	00878733          	add	a4,a5,s0
 644:	02d00793          	li	a5,45
 648:	fef70423          	sb	a5,-24(a4)
 64c:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 650:	02e05a63          	blez	a4,684 <printint+0x96>
 654:	f84a                	sd	s2,48(sp)
 656:	f44e                	sd	s3,40(sp)
 658:	fb840793          	addi	a5,s0,-72
 65c:	00e78933          	add	s2,a5,a4
 660:	fff78993          	addi	s3,a5,-1
 664:	99ba                	add	s3,s3,a4
 666:	377d                	addiw	a4,a4,-1
 668:	1702                	slli	a4,a4,0x20
 66a:	9301                	srli	a4,a4,0x20
 66c:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 670:	fff94583          	lbu	a1,-1(s2)
 674:	8526                	mv	a0,s1
 676:	f5bff0ef          	jal	5d0 <putc>
  while(--i >= 0)
 67a:	197d                	addi	s2,s2,-1
 67c:	ff391ae3          	bne	s2,s3,670 <printint+0x82>
 680:	7942                	ld	s2,48(sp)
 682:	79a2                	ld	s3,40(sp)
}
 684:	60a6                	ld	ra,72(sp)
 686:	6406                	ld	s0,64(sp)
 688:	74e2                	ld	s1,56(sp)
 68a:	6161                	addi	sp,sp,80
 68c:	8082                	ret
    x = -xx;
 68e:	40b005bb          	negw	a1,a1
    neg = 1;
 692:	4885                	li	a7,1
    x = -xx;
 694:	bf85                	j	604 <printint+0x16>

0000000000000696 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %c, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 696:	711d                	addi	sp,sp,-96
 698:	ec86                	sd	ra,88(sp)
 69a:	e8a2                	sd	s0,80(sp)
 69c:	e0ca                	sd	s2,64(sp)
 69e:	1080                	addi	s0,sp,96
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 6a0:	0005c903          	lbu	s2,0(a1)
 6a4:	28090663          	beqz	s2,930 <vprintf+0x29a>
 6a8:	e4a6                	sd	s1,72(sp)
 6aa:	fc4e                	sd	s3,56(sp)
 6ac:	f852                	sd	s4,48(sp)
 6ae:	f456                	sd	s5,40(sp)
 6b0:	f05a                	sd	s6,32(sp)
 6b2:	ec5e                	sd	s7,24(sp)
 6b4:	e862                	sd	s8,16(sp)
 6b6:	e466                	sd	s9,8(sp)
 6b8:	8b2a                	mv	s6,a0
 6ba:	8a2e                	mv	s4,a1
 6bc:	8bb2                	mv	s7,a2
  state = 0;
 6be:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
 6c0:	4481                	li	s1,0
 6c2:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
 6c4:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
 6c8:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
 6cc:	06c00c93          	li	s9,108
 6d0:	a005                	j	6f0 <vprintf+0x5a>
        putc(fd, c0);
 6d2:	85ca                	mv	a1,s2
 6d4:	855a                	mv	a0,s6
 6d6:	efbff0ef          	jal	5d0 <putc>
 6da:	a019                	j	6e0 <vprintf+0x4a>
    } else if(state == '%'){
 6dc:	03598263          	beq	s3,s5,700 <vprintf+0x6a>
  for(i = 0; fmt[i]; i++){
 6e0:	2485                	addiw	s1,s1,1
 6e2:	8726                	mv	a4,s1
 6e4:	009a07b3          	add	a5,s4,s1
 6e8:	0007c903          	lbu	s2,0(a5)
 6ec:	22090a63          	beqz	s2,920 <vprintf+0x28a>
    c0 = fmt[i] & 0xff;
 6f0:	0009079b          	sext.w	a5,s2
    if(state == 0){
 6f4:	fe0994e3          	bnez	s3,6dc <vprintf+0x46>
      if(c0 == '%'){
 6f8:	fd579de3          	bne	a5,s5,6d2 <vprintf+0x3c>
        state = '%';
 6fc:	89be                	mv	s3,a5
 6fe:	b7cd                	j	6e0 <vprintf+0x4a>
      if(c0) c1 = fmt[i+1] & 0xff;
 700:	00ea06b3          	add	a3,s4,a4
 704:	0016c683          	lbu	a3,1(a3)
      c1 = c2 = 0;
 708:	8636                	mv	a2,a3
      if(c1) c2 = fmt[i+2] & 0xff;
 70a:	c681                	beqz	a3,712 <vprintf+0x7c>
 70c:	9752                	add	a4,a4,s4
 70e:	00274603          	lbu	a2,2(a4)
      if(c0 == 'd'){
 712:	05878363          	beq	a5,s8,758 <vprintf+0xc2>
      } else if(c0 == 'l' && c1 == 'd'){
 716:	05978d63          	beq	a5,s9,770 <vprintf+0xda>
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 2;
      } else if(c0 == 'u'){
 71a:	07500713          	li	a4,117
 71e:	0ee78763          	beq	a5,a4,80c <vprintf+0x176>
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 2;
      } else if(c0 == 'x'){
 722:	07800713          	li	a4,120
 726:	12e78963          	beq	a5,a4,858 <vprintf+0x1c2>
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 2;
      } else if(c0 == 'p'){
 72a:	07000713          	li	a4,112
 72e:	14e78e63          	beq	a5,a4,88a <vprintf+0x1f4>
        printptr(fd, va_arg(ap, uint64));
      } else if(c0 == 'c'){
 732:	06300713          	li	a4,99
 736:	18e78e63          	beq	a5,a4,8d2 <vprintf+0x23c>
        putc(fd, va_arg(ap, uint32));
      } else if(c0 == 's'){
 73a:	07300713          	li	a4,115
 73e:	1ae78463          	beq	a5,a4,8e6 <vprintf+0x250>
        if((s = va_arg(ap, char*)) == 0)
          s = "(null)";
        for(; *s; s++)
          putc(fd, *s);
      } else if(c0 == '%'){
 742:	02500713          	li	a4,37
 746:	04e79563          	bne	a5,a4,790 <vprintf+0xfa>
        putc(fd, '%');
 74a:	02500593          	li	a1,37
 74e:	855a                	mv	a0,s6
 750:	e81ff0ef          	jal	5d0 <putc>
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c0);
      }

      state = 0;
 754:	4981                	li	s3,0
 756:	b769                	j	6e0 <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 10, 1);
 758:	008b8913          	addi	s2,s7,8
 75c:	4685                	li	a3,1
 75e:	4629                	li	a2,10
 760:	000ba583          	lw	a1,0(s7)
 764:	855a                	mv	a0,s6
 766:	e89ff0ef          	jal	5ee <printint>
 76a:	8bca                	mv	s7,s2
      state = 0;
 76c:	4981                	li	s3,0
 76e:	bf8d                	j	6e0 <vprintf+0x4a>
      } else if(c0 == 'l' && c1 == 'd'){
 770:	06400793          	li	a5,100
 774:	02f68963          	beq	a3,a5,7a6 <vprintf+0x110>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 778:	06c00793          	li	a5,108
 77c:	04f68263          	beq	a3,a5,7c0 <vprintf+0x12a>
      } else if(c0 == 'l' && c1 == 'u'){
 780:	07500793          	li	a5,117
 784:	0af68063          	beq	a3,a5,824 <vprintf+0x18e>
      } else if(c0 == 'l' && c1 == 'x'){
 788:	07800793          	li	a5,120
 78c:	0ef68263          	beq	a3,a5,870 <vprintf+0x1da>
        putc(fd, '%');
 790:	02500593          	li	a1,37
 794:	855a                	mv	a0,s6
 796:	e3bff0ef          	jal	5d0 <putc>
        putc(fd, c0);
 79a:	85ca                	mv	a1,s2
 79c:	855a                	mv	a0,s6
 79e:	e33ff0ef          	jal	5d0 <putc>
      state = 0;
 7a2:	4981                	li	s3,0
 7a4:	bf35                	j	6e0 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 7a6:	008b8913          	addi	s2,s7,8
 7aa:	4685                	li	a3,1
 7ac:	4629                	li	a2,10
 7ae:	000bb583          	ld	a1,0(s7)
 7b2:	855a                	mv	a0,s6
 7b4:	e3bff0ef          	jal	5ee <printint>
        i += 1;
 7b8:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 1);
 7ba:	8bca                	mv	s7,s2
      state = 0;
 7bc:	4981                	li	s3,0
        i += 1;
 7be:	b70d                	j	6e0 <vprintf+0x4a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 7c0:	06400793          	li	a5,100
 7c4:	02f60763          	beq	a2,a5,7f2 <vprintf+0x15c>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 7c8:	07500793          	li	a5,117
 7cc:	06f60963          	beq	a2,a5,83e <vprintf+0x1a8>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
 7d0:	07800793          	li	a5,120
 7d4:	faf61ee3          	bne	a2,a5,790 <vprintf+0xfa>
        printint(fd, va_arg(ap, uint64), 16, 0);
 7d8:	008b8913          	addi	s2,s7,8
 7dc:	4681                	li	a3,0
 7de:	4641                	li	a2,16
 7e0:	000bb583          	ld	a1,0(s7)
 7e4:	855a                	mv	a0,s6
 7e6:	e09ff0ef          	jal	5ee <printint>
        i += 2;
 7ea:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 16, 0);
 7ec:	8bca                	mv	s7,s2
      state = 0;
 7ee:	4981                	li	s3,0
        i += 2;
 7f0:	bdc5                	j	6e0 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 7f2:	008b8913          	addi	s2,s7,8
 7f6:	4685                	li	a3,1
 7f8:	4629                	li	a2,10
 7fa:	000bb583          	ld	a1,0(s7)
 7fe:	855a                	mv	a0,s6
 800:	defff0ef          	jal	5ee <printint>
        i += 2;
 804:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 1);
 806:	8bca                	mv	s7,s2
      state = 0;
 808:	4981                	li	s3,0
        i += 2;
 80a:	bdd9                	j	6e0 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint32), 10, 0);
 80c:	008b8913          	addi	s2,s7,8
 810:	4681                	li	a3,0
 812:	4629                	li	a2,10
 814:	000be583          	lwu	a1,0(s7)
 818:	855a                	mv	a0,s6
 81a:	dd5ff0ef          	jal	5ee <printint>
 81e:	8bca                	mv	s7,s2
      state = 0;
 820:	4981                	li	s3,0
 822:	bd7d                	j	6e0 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 824:	008b8913          	addi	s2,s7,8
 828:	4681                	li	a3,0
 82a:	4629                	li	a2,10
 82c:	000bb583          	ld	a1,0(s7)
 830:	855a                	mv	a0,s6
 832:	dbdff0ef          	jal	5ee <printint>
        i += 1;
 836:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 0);
 838:	8bca                	mv	s7,s2
      state = 0;
 83a:	4981                	li	s3,0
        i += 1;
 83c:	b555                	j	6e0 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 83e:	008b8913          	addi	s2,s7,8
 842:	4681                	li	a3,0
 844:	4629                	li	a2,10
 846:	000bb583          	ld	a1,0(s7)
 84a:	855a                	mv	a0,s6
 84c:	da3ff0ef          	jal	5ee <printint>
        i += 2;
 850:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 0);
 852:	8bca                	mv	s7,s2
      state = 0;
 854:	4981                	li	s3,0
        i += 2;
 856:	b569                	j	6e0 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint32), 16, 0);
 858:	008b8913          	addi	s2,s7,8
 85c:	4681                	li	a3,0
 85e:	4641                	li	a2,16
 860:	000be583          	lwu	a1,0(s7)
 864:	855a                	mv	a0,s6
 866:	d89ff0ef          	jal	5ee <printint>
 86a:	8bca                	mv	s7,s2
      state = 0;
 86c:	4981                	li	s3,0
 86e:	bd8d                	j	6e0 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 16, 0);
 870:	008b8913          	addi	s2,s7,8
 874:	4681                	li	a3,0
 876:	4641                	li	a2,16
 878:	000bb583          	ld	a1,0(s7)
 87c:	855a                	mv	a0,s6
 87e:	d71ff0ef          	jal	5ee <printint>
        i += 1;
 882:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 16, 0);
 884:	8bca                	mv	s7,s2
      state = 0;
 886:	4981                	li	s3,0
        i += 1;
 888:	bda1                	j	6e0 <vprintf+0x4a>
 88a:	e06a                	sd	s10,0(sp)
        printptr(fd, va_arg(ap, uint64));
 88c:	008b8d13          	addi	s10,s7,8
 890:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
 894:	03000593          	li	a1,48
 898:	855a                	mv	a0,s6
 89a:	d37ff0ef          	jal	5d0 <putc>
  putc(fd, 'x');
 89e:	07800593          	li	a1,120
 8a2:	855a                	mv	a0,s6
 8a4:	d2dff0ef          	jal	5d0 <putc>
 8a8:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 8aa:	00000b97          	auipc	s7,0x0
 8ae:	4ceb8b93          	addi	s7,s7,1230 # d78 <digits>
 8b2:	03c9d793          	srli	a5,s3,0x3c
 8b6:	97de                	add	a5,a5,s7
 8b8:	0007c583          	lbu	a1,0(a5)
 8bc:	855a                	mv	a0,s6
 8be:	d13ff0ef          	jal	5d0 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 8c2:	0992                	slli	s3,s3,0x4
 8c4:	397d                	addiw	s2,s2,-1
 8c6:	fe0916e3          	bnez	s2,8b2 <vprintf+0x21c>
        printptr(fd, va_arg(ap, uint64));
 8ca:	8bea                	mv	s7,s10
      state = 0;
 8cc:	4981                	li	s3,0
 8ce:	6d02                	ld	s10,0(sp)
 8d0:	bd01                	j	6e0 <vprintf+0x4a>
        putc(fd, va_arg(ap, uint32));
 8d2:	008b8913          	addi	s2,s7,8
 8d6:	000bc583          	lbu	a1,0(s7)
 8da:	855a                	mv	a0,s6
 8dc:	cf5ff0ef          	jal	5d0 <putc>
 8e0:	8bca                	mv	s7,s2
      state = 0;
 8e2:	4981                	li	s3,0
 8e4:	bbf5                	j	6e0 <vprintf+0x4a>
        if((s = va_arg(ap, char*)) == 0)
 8e6:	008b8993          	addi	s3,s7,8
 8ea:	000bb903          	ld	s2,0(s7)
 8ee:	00090f63          	beqz	s2,90c <vprintf+0x276>
        for(; *s; s++)
 8f2:	00094583          	lbu	a1,0(s2)
 8f6:	c195                	beqz	a1,91a <vprintf+0x284>
          putc(fd, *s);
 8f8:	855a                	mv	a0,s6
 8fa:	cd7ff0ef          	jal	5d0 <putc>
        for(; *s; s++)
 8fe:	0905                	addi	s2,s2,1
 900:	00094583          	lbu	a1,0(s2)
 904:	f9f5                	bnez	a1,8f8 <vprintf+0x262>
        if((s = va_arg(ap, char*)) == 0)
 906:	8bce                	mv	s7,s3
      state = 0;
 908:	4981                	li	s3,0
 90a:	bbd9                	j	6e0 <vprintf+0x4a>
          s = "(null)";
 90c:	00000917          	auipc	s2,0x0
 910:	46490913          	addi	s2,s2,1124 # d70 <malloc+0x358>
        for(; *s; s++)
 914:	02800593          	li	a1,40
 918:	b7c5                	j	8f8 <vprintf+0x262>
        if((s = va_arg(ap, char*)) == 0)
 91a:	8bce                	mv	s7,s3
      state = 0;
 91c:	4981                	li	s3,0
 91e:	b3c9                	j	6e0 <vprintf+0x4a>
 920:	64a6                	ld	s1,72(sp)
 922:	79e2                	ld	s3,56(sp)
 924:	7a42                	ld	s4,48(sp)
 926:	7aa2                	ld	s5,40(sp)
 928:	7b02                	ld	s6,32(sp)
 92a:	6be2                	ld	s7,24(sp)
 92c:	6c42                	ld	s8,16(sp)
 92e:	6ca2                	ld	s9,8(sp)
    }
  }
}
 930:	60e6                	ld	ra,88(sp)
 932:	6446                	ld	s0,80(sp)
 934:	6906                	ld	s2,64(sp)
 936:	6125                	addi	sp,sp,96
 938:	8082                	ret

000000000000093a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 93a:	715d                	addi	sp,sp,-80
 93c:	ec06                	sd	ra,24(sp)
 93e:	e822                	sd	s0,16(sp)
 940:	1000                	addi	s0,sp,32
 942:	e010                	sd	a2,0(s0)
 944:	e414                	sd	a3,8(s0)
 946:	e818                	sd	a4,16(s0)
 948:	ec1c                	sd	a5,24(s0)
 94a:	03043023          	sd	a6,32(s0)
 94e:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 952:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 956:	8622                	mv	a2,s0
 958:	d3fff0ef          	jal	696 <vprintf>
}
 95c:	60e2                	ld	ra,24(sp)
 95e:	6442                	ld	s0,16(sp)
 960:	6161                	addi	sp,sp,80
 962:	8082                	ret

0000000000000964 <printf>:

void
printf(const char *fmt, ...)
{
 964:	711d                	addi	sp,sp,-96
 966:	ec06                	sd	ra,24(sp)
 968:	e822                	sd	s0,16(sp)
 96a:	1000                	addi	s0,sp,32
 96c:	e40c                	sd	a1,8(s0)
 96e:	e810                	sd	a2,16(s0)
 970:	ec14                	sd	a3,24(s0)
 972:	f018                	sd	a4,32(s0)
 974:	f41c                	sd	a5,40(s0)
 976:	03043823          	sd	a6,48(s0)
 97a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 97e:	00840613          	addi	a2,s0,8
 982:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 986:	85aa                	mv	a1,a0
 988:	4505                	li	a0,1
 98a:	d0dff0ef          	jal	696 <vprintf>
}
 98e:	60e2                	ld	ra,24(sp)
 990:	6442                	ld	s0,16(sp)
 992:	6125                	addi	sp,sp,96
 994:	8082                	ret

0000000000000996 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 996:	1141                	addi	sp,sp,-16
 998:	e422                	sd	s0,8(sp)
 99a:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 99c:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9a0:	00000797          	auipc	a5,0x0
 9a4:	6607b783          	ld	a5,1632(a5) # 1000 <freep>
 9a8:	a02d                	j	9d2 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 9aa:	4618                	lw	a4,8(a2)
 9ac:	9f2d                	addw	a4,a4,a1
 9ae:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 9b2:	6398                	ld	a4,0(a5)
 9b4:	6310                	ld	a2,0(a4)
 9b6:	a83d                	j	9f4 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 9b8:	ff852703          	lw	a4,-8(a0)
 9bc:	9f31                	addw	a4,a4,a2
 9be:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 9c0:	ff053683          	ld	a3,-16(a0)
 9c4:	a091                	j	a08 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9c6:	6398                	ld	a4,0(a5)
 9c8:	00e7e463          	bltu	a5,a4,9d0 <free+0x3a>
 9cc:	00e6ea63          	bltu	a3,a4,9e0 <free+0x4a>
{
 9d0:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d2:	fed7fae3          	bgeu	a5,a3,9c6 <free+0x30>
 9d6:	6398                	ld	a4,0(a5)
 9d8:	00e6e463          	bltu	a3,a4,9e0 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9dc:	fee7eae3          	bltu	a5,a4,9d0 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 9e0:	ff852583          	lw	a1,-8(a0)
 9e4:	6390                	ld	a2,0(a5)
 9e6:	02059813          	slli	a6,a1,0x20
 9ea:	01c85713          	srli	a4,a6,0x1c
 9ee:	9736                	add	a4,a4,a3
 9f0:	fae60de3          	beq	a2,a4,9aa <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 9f4:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 9f8:	4790                	lw	a2,8(a5)
 9fa:	02061593          	slli	a1,a2,0x20
 9fe:	01c5d713          	srli	a4,a1,0x1c
 a02:	973e                	add	a4,a4,a5
 a04:	fae68ae3          	beq	a3,a4,9b8 <free+0x22>
    p->s.ptr = bp->s.ptr;
 a08:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 a0a:	00000717          	auipc	a4,0x0
 a0e:	5ef73b23          	sd	a5,1526(a4) # 1000 <freep>
}
 a12:	6422                	ld	s0,8(sp)
 a14:	0141                	addi	sp,sp,16
 a16:	8082                	ret

0000000000000a18 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a18:	7139                	addi	sp,sp,-64
 a1a:	fc06                	sd	ra,56(sp)
 a1c:	f822                	sd	s0,48(sp)
 a1e:	f426                	sd	s1,40(sp)
 a20:	ec4e                	sd	s3,24(sp)
 a22:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a24:	02051493          	slli	s1,a0,0x20
 a28:	9081                	srli	s1,s1,0x20
 a2a:	04bd                	addi	s1,s1,15
 a2c:	8091                	srli	s1,s1,0x4
 a2e:	0014899b          	addiw	s3,s1,1
 a32:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 a34:	00000517          	auipc	a0,0x0
 a38:	5cc53503          	ld	a0,1484(a0) # 1000 <freep>
 a3c:	c915                	beqz	a0,a70 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a3e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a40:	4798                	lw	a4,8(a5)
 a42:	08977a63          	bgeu	a4,s1,ad6 <malloc+0xbe>
 a46:	f04a                	sd	s2,32(sp)
 a48:	e852                	sd	s4,16(sp)
 a4a:	e456                	sd	s5,8(sp)
 a4c:	e05a                	sd	s6,0(sp)
  if(nu < 4096)
 a4e:	8a4e                	mv	s4,s3
 a50:	0009871b          	sext.w	a4,s3
 a54:	6685                	lui	a3,0x1
 a56:	00d77363          	bgeu	a4,a3,a5c <malloc+0x44>
 a5a:	6a05                	lui	s4,0x1
 a5c:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 a60:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a64:	00000917          	auipc	s2,0x0
 a68:	59c90913          	addi	s2,s2,1436 # 1000 <freep>
  if(p == SBRK_ERROR)
 a6c:	5afd                	li	s5,-1
 a6e:	a081                	j	aae <malloc+0x96>
 a70:	f04a                	sd	s2,32(sp)
 a72:	e852                	sd	s4,16(sp)
 a74:	e456                	sd	s5,8(sp)
 a76:	e05a                	sd	s6,0(sp)
    base.s.ptr = freep = prevp = &base;
 a78:	00000797          	auipc	a5,0x0
 a7c:	59878793          	addi	a5,a5,1432 # 1010 <base>
 a80:	00000717          	auipc	a4,0x0
 a84:	58f73023          	sd	a5,1408(a4) # 1000 <freep>
 a88:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 a8a:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 a8e:	b7c1                	j	a4e <malloc+0x36>
        prevp->s.ptr = p->s.ptr;
 a90:	6398                	ld	a4,0(a5)
 a92:	e118                	sd	a4,0(a0)
 a94:	a8a9                	j	aee <malloc+0xd6>
  hp->s.size = nu;
 a96:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a9a:	0541                	addi	a0,a0,16
 a9c:	efbff0ef          	jal	996 <free>
  return freep;
 aa0:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 aa4:	c12d                	beqz	a0,b06 <malloc+0xee>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa6:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 aa8:	4798                	lw	a4,8(a5)
 aaa:	02977263          	bgeu	a4,s1,ace <malloc+0xb6>
    if(p == freep)
 aae:	00093703          	ld	a4,0(s2)
 ab2:	853e                	mv	a0,a5
 ab4:	fef719e3          	bne	a4,a5,aa6 <malloc+0x8e>
  p = sbrk(nu * sizeof(Header));
 ab8:	8552                	mv	a0,s4
 aba:	a3bff0ef          	jal	4f4 <sbrk>
  if(p == SBRK_ERROR)
 abe:	fd551ce3          	bne	a0,s5,a96 <malloc+0x7e>
        return 0;
 ac2:	4501                	li	a0,0
 ac4:	7902                	ld	s2,32(sp)
 ac6:	6a42                	ld	s4,16(sp)
 ac8:	6aa2                	ld	s5,8(sp)
 aca:	6b02                	ld	s6,0(sp)
 acc:	a03d                	j	afa <malloc+0xe2>
 ace:	7902                	ld	s2,32(sp)
 ad0:	6a42                	ld	s4,16(sp)
 ad2:	6aa2                	ld	s5,8(sp)
 ad4:	6b02                	ld	s6,0(sp)
      if(p->s.size == nunits)
 ad6:	fae48de3          	beq	s1,a4,a90 <malloc+0x78>
        p->s.size -= nunits;
 ada:	4137073b          	subw	a4,a4,s3
 ade:	c798                	sw	a4,8(a5)
        p += p->s.size;
 ae0:	02071693          	slli	a3,a4,0x20
 ae4:	01c6d713          	srli	a4,a3,0x1c
 ae8:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 aea:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 aee:	00000717          	auipc	a4,0x0
 af2:	50a73923          	sd	a0,1298(a4) # 1000 <freep>
      return (void*)(p + 1);
 af6:	01078513          	addi	a0,a5,16
  }
}
 afa:	70e2                	ld	ra,56(sp)
 afc:	7442                	ld	s0,48(sp)
 afe:	74a2                	ld	s1,40(sp)
 b00:	69e2                	ld	s3,24(sp)
 b02:	6121                	addi	sp,sp,64
 b04:	8082                	ret
 b06:	7902                	ld	s2,32(sp)
 b08:	6a42                	ld	s4,16(sp)
 b0a:	6aa2                	ld	s5,8(sp)
 b0c:	6b02                	ld	s6,0(sp)
 b0e:	b7f5                	j	afa <malloc+0xe2>
