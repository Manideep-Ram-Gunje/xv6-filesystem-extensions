
user/_grep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	e052                	sd	s4,0(sp)
   e:	1800                	addi	s0,sp,48
  10:	892a                	mv	s2,a0
  12:	89ae                	mv	s3,a1
  14:	84b2                	mv	s1,a2
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  16:	02e00a13          	li	s4,46
    if(matchhere(re, text))
  1a:	85a6                	mv	a1,s1
  1c:	854e                	mv	a0,s3
  1e:	02c000ef          	jal	4a <matchhere>
  22:	e919                	bnez	a0,38 <matchstar+0x38>
  }while(*text!='\0' && (*text++==c || c=='.'));
  24:	0004c783          	lbu	a5,0(s1)
  28:	cb89                	beqz	a5,3a <matchstar+0x3a>
  2a:	0485                	addi	s1,s1,1
  2c:	2781                	sext.w	a5,a5
  2e:	ff2786e3          	beq	a5,s2,1a <matchstar+0x1a>
  32:	ff4904e3          	beq	s2,s4,1a <matchstar+0x1a>
  36:	a011                	j	3a <matchstar+0x3a>
      return 1;
  38:	4505                	li	a0,1
  return 0;
}
  3a:	70a2                	ld	ra,40(sp)
  3c:	7402                	ld	s0,32(sp)
  3e:	64e2                	ld	s1,24(sp)
  40:	6942                	ld	s2,16(sp)
  42:	69a2                	ld	s3,8(sp)
  44:	6a02                	ld	s4,0(sp)
  46:	6145                	addi	sp,sp,48
  48:	8082                	ret

000000000000004a <matchhere>:
  if(re[0] == '\0')
  4a:	00054703          	lbu	a4,0(a0)
  4e:	c73d                	beqz	a4,bc <matchhere+0x72>
{
  50:	1141                	addi	sp,sp,-16
  52:	e406                	sd	ra,8(sp)
  54:	e022                	sd	s0,0(sp)
  56:	0800                	addi	s0,sp,16
  58:	87aa                	mv	a5,a0
  if(re[1] == '*')
  5a:	00154683          	lbu	a3,1(a0)
  5e:	02a00613          	li	a2,42
  62:	02c68563          	beq	a3,a2,8c <matchhere+0x42>
  if(re[0] == '$' && re[1] == '\0')
  66:	02400613          	li	a2,36
  6a:	02c70863          	beq	a4,a2,9a <matchhere+0x50>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  6e:	0005c683          	lbu	a3,0(a1)
  return 0;
  72:	4501                	li	a0,0
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  74:	ca81                	beqz	a3,84 <matchhere+0x3a>
  76:	02e00613          	li	a2,46
  7a:	02c70b63          	beq	a4,a2,b0 <matchhere+0x66>
  return 0;
  7e:	4501                	li	a0,0
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  80:	02d70863          	beq	a4,a3,b0 <matchhere+0x66>
}
  84:	60a2                	ld	ra,8(sp)
  86:	6402                	ld	s0,0(sp)
  88:	0141                	addi	sp,sp,16
  8a:	8082                	ret
    return matchstar(re[0], re+2, text);
  8c:	862e                	mv	a2,a1
  8e:	00250593          	addi	a1,a0,2
  92:	853a                	mv	a0,a4
  94:	f6dff0ef          	jal	0 <matchstar>
  98:	b7f5                	j	84 <matchhere+0x3a>
  if(re[0] == '$' && re[1] == '\0')
  9a:	c691                	beqz	a3,a6 <matchhere+0x5c>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  9c:	0005c683          	lbu	a3,0(a1)
  a0:	fef9                	bnez	a3,7e <matchhere+0x34>
  return 0;
  a2:	4501                	li	a0,0
  a4:	b7c5                	j	84 <matchhere+0x3a>
    return *text == '\0';
  a6:	0005c503          	lbu	a0,0(a1)
  aa:	00153513          	seqz	a0,a0
  ae:	bfd9                	j	84 <matchhere+0x3a>
    return matchhere(re+1, text+1);
  b0:	0585                	addi	a1,a1,1
  b2:	00178513          	addi	a0,a5,1
  b6:	f95ff0ef          	jal	4a <matchhere>
  ba:	b7e9                	j	84 <matchhere+0x3a>
    return 1;
  bc:	4505                	li	a0,1
}
  be:	8082                	ret

00000000000000c0 <match>:
{
  c0:	1101                	addi	sp,sp,-32
  c2:	ec06                	sd	ra,24(sp)
  c4:	e822                	sd	s0,16(sp)
  c6:	e426                	sd	s1,8(sp)
  c8:	e04a                	sd	s2,0(sp)
  ca:	1000                	addi	s0,sp,32
  cc:	892a                	mv	s2,a0
  ce:	84ae                	mv	s1,a1
  if(re[0] == '^')
  d0:	00054703          	lbu	a4,0(a0)
  d4:	05e00793          	li	a5,94
  d8:	00f70c63          	beq	a4,a5,f0 <match+0x30>
    if(matchhere(re, text))
  dc:	85a6                	mv	a1,s1
  de:	854a                	mv	a0,s2
  e0:	f6bff0ef          	jal	4a <matchhere>
  e4:	e911                	bnez	a0,f8 <match+0x38>
  }while(*text++ != '\0');
  e6:	0485                	addi	s1,s1,1
  e8:	fff4c783          	lbu	a5,-1(s1)
  ec:	fbe5                	bnez	a5,dc <match+0x1c>
  ee:	a031                	j	fa <match+0x3a>
    return matchhere(re+1, text);
  f0:	0505                	addi	a0,a0,1
  f2:	f59ff0ef          	jal	4a <matchhere>
  f6:	a011                	j	fa <match+0x3a>
      return 1;
  f8:	4505                	li	a0,1
}
  fa:	60e2                	ld	ra,24(sp)
  fc:	6442                	ld	s0,16(sp)
  fe:	64a2                	ld	s1,8(sp)
 100:	6902                	ld	s2,0(sp)
 102:	6105                	addi	sp,sp,32
 104:	8082                	ret

0000000000000106 <grep>:
{
 106:	715d                	addi	sp,sp,-80
 108:	e486                	sd	ra,72(sp)
 10a:	e0a2                	sd	s0,64(sp)
 10c:	fc26                	sd	s1,56(sp)
 10e:	f84a                	sd	s2,48(sp)
 110:	f44e                	sd	s3,40(sp)
 112:	f052                	sd	s4,32(sp)
 114:	ec56                	sd	s5,24(sp)
 116:	e85a                	sd	s6,16(sp)
 118:	e45e                	sd	s7,8(sp)
 11a:	e062                	sd	s8,0(sp)
 11c:	0880                	addi	s0,sp,80
 11e:	89aa                	mv	s3,a0
 120:	8b2e                	mv	s6,a1
  m = 0;
 122:	4a01                	li	s4,0
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 124:	3ff00b93          	li	s7,1023
 128:	00001a97          	auipc	s5,0x1
 12c:	ee8a8a93          	addi	s5,s5,-280 # 1010 <buf>
 130:	a835                	j	16c <grep+0x66>
      p = q+1;
 132:	00148913          	addi	s2,s1,1
    while((q = strchr(p, '\n')) != 0){
 136:	45a9                	li	a1,10
 138:	854a                	mv	a0,s2
 13a:	1c6000ef          	jal	300 <strchr>
 13e:	84aa                	mv	s1,a0
 140:	c505                	beqz	a0,168 <grep+0x62>
      *q = 0;
 142:	00048023          	sb	zero,0(s1)
      if(match(pattern, p)){
 146:	85ca                	mv	a1,s2
 148:	854e                	mv	a0,s3
 14a:	f77ff0ef          	jal	c0 <match>
 14e:	d175                	beqz	a0,132 <grep+0x2c>
        *q = '\n';
 150:	47a9                	li	a5,10
 152:	00f48023          	sb	a5,0(s1)
        write(1, p, q+1 - p);
 156:	00148613          	addi	a2,s1,1
 15a:	4126063b          	subw	a2,a2,s2
 15e:	85ca                	mv	a1,s2
 160:	4505                	li	a0,1
 162:	3ae000ef          	jal	510 <write>
 166:	b7f1                	j	132 <grep+0x2c>
    if(m > 0){
 168:	03404563          	bgtz	s4,192 <grep+0x8c>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 16c:	414b863b          	subw	a2,s7,s4
 170:	014a85b3          	add	a1,s5,s4
 174:	855a                	mv	a0,s6
 176:	392000ef          	jal	508 <read>
 17a:	02a05963          	blez	a0,1ac <grep+0xa6>
    m += n;
 17e:	00aa0c3b          	addw	s8,s4,a0
 182:	000c0a1b          	sext.w	s4,s8
    buf[m] = '\0';
 186:	014a87b3          	add	a5,s5,s4
 18a:	00078023          	sb	zero,0(a5)
    p = buf;
 18e:	8956                	mv	s2,s5
    while((q = strchr(p, '\n')) != 0){
 190:	b75d                	j	136 <grep+0x30>
      m -= p - buf;
 192:	00001517          	auipc	a0,0x1
 196:	e7e50513          	addi	a0,a0,-386 # 1010 <buf>
 19a:	40a90a33          	sub	s4,s2,a0
 19e:	414c0a3b          	subw	s4,s8,s4
      memmove(buf, p, m);
 1a2:	8652                	mv	a2,s4
 1a4:	85ca                	mv	a1,s2
 1a6:	270000ef          	jal	416 <memmove>
 1aa:	b7c9                	j	16c <grep+0x66>
}
 1ac:	60a6                	ld	ra,72(sp)
 1ae:	6406                	ld	s0,64(sp)
 1b0:	74e2                	ld	s1,56(sp)
 1b2:	7942                	ld	s2,48(sp)
 1b4:	79a2                	ld	s3,40(sp)
 1b6:	7a02                	ld	s4,32(sp)
 1b8:	6ae2                	ld	s5,24(sp)
 1ba:	6b42                	ld	s6,16(sp)
 1bc:	6ba2                	ld	s7,8(sp)
 1be:	6c02                	ld	s8,0(sp)
 1c0:	6161                	addi	sp,sp,80
 1c2:	8082                	ret

00000000000001c4 <main>:
{
 1c4:	7179                	addi	sp,sp,-48
 1c6:	f406                	sd	ra,40(sp)
 1c8:	f022                	sd	s0,32(sp)
 1ca:	ec26                	sd	s1,24(sp)
 1cc:	e84a                	sd	s2,16(sp)
 1ce:	e44e                	sd	s3,8(sp)
 1d0:	e052                	sd	s4,0(sp)
 1d2:	1800                	addi	s0,sp,48
  if(argc <= 1){
 1d4:	4785                	li	a5,1
 1d6:	04a7d663          	bge	a5,a0,222 <main+0x5e>
  pattern = argv[1];
 1da:	0085ba03          	ld	s4,8(a1)
  if(argc <= 2){
 1de:	4789                	li	a5,2
 1e0:	04a7db63          	bge	a5,a0,236 <main+0x72>
 1e4:	01058913          	addi	s2,a1,16
 1e8:	ffd5099b          	addiw	s3,a0,-3
 1ec:	02099793          	slli	a5,s3,0x20
 1f0:	01d7d993          	srli	s3,a5,0x1d
 1f4:	05e1                	addi	a1,a1,24
 1f6:	99ae                	add	s3,s3,a1
    if((fd = open(argv[i], O_RDONLY)) < 0){
 1f8:	4581                	li	a1,0
 1fa:	00093503          	ld	a0,0(s2)
 1fe:	332000ef          	jal	530 <open>
 202:	84aa                	mv	s1,a0
 204:	04054063          	bltz	a0,244 <main+0x80>
    grep(pattern, fd);
 208:	85aa                	mv	a1,a0
 20a:	8552                	mv	a0,s4
 20c:	efbff0ef          	jal	106 <grep>
    close(fd);
 210:	8526                	mv	a0,s1
 212:	306000ef          	jal	518 <close>
  for(i = 2; i < argc; i++){
 216:	0921                	addi	s2,s2,8
 218:	ff3910e3          	bne	s2,s3,1f8 <main+0x34>
  exit(0);
 21c:	4501                	li	a0,0
 21e:	2d2000ef          	jal	4f0 <exit>
    fprintf(2, "usage: grep pattern [file ...]\n");
 222:	00001597          	auipc	a1,0x1
 226:	8be58593          	addi	a1,a1,-1858 # ae0 <malloc+0x100>
 22a:	4509                	li	a0,2
 22c:	6d6000ef          	jal	902 <fprintf>
    exit(1);
 230:	4505                	li	a0,1
 232:	2be000ef          	jal	4f0 <exit>
    grep(pattern, 0);
 236:	4581                	li	a1,0
 238:	8552                	mv	a0,s4
 23a:	ecdff0ef          	jal	106 <grep>
    exit(0);
 23e:	4501                	li	a0,0
 240:	2b0000ef          	jal	4f0 <exit>
      printf("grep: cannot open %s\n", argv[i]);
 244:	00093583          	ld	a1,0(s2)
 248:	00001517          	auipc	a0,0x1
 24c:	8b850513          	addi	a0,a0,-1864 # b00 <malloc+0x120>
 250:	6dc000ef          	jal	92c <printf>
      exit(1);
 254:	4505                	li	a0,1
 256:	29a000ef          	jal	4f0 <exit>

000000000000025a <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start()
{
 25a:	1141                	addi	sp,sp,-16
 25c:	e406                	sd	ra,8(sp)
 25e:	e022                	sd	s0,0(sp)
 260:	0800                	addi	s0,sp,16
  extern int main();
  main();
 262:	f63ff0ef          	jal	1c4 <main>
  exit(0);
 266:	4501                	li	a0,0
 268:	288000ef          	jal	4f0 <exit>

000000000000026c <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 26c:	1141                	addi	sp,sp,-16
 26e:	e422                	sd	s0,8(sp)
 270:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 272:	87aa                	mv	a5,a0
 274:	0585                	addi	a1,a1,1
 276:	0785                	addi	a5,a5,1
 278:	fff5c703          	lbu	a4,-1(a1)
 27c:	fee78fa3          	sb	a4,-1(a5)
 280:	fb75                	bnez	a4,274 <strcpy+0x8>
    ;
  return os;
}
 282:	6422                	ld	s0,8(sp)
 284:	0141                	addi	sp,sp,16
 286:	8082                	ret

0000000000000288 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 288:	1141                	addi	sp,sp,-16
 28a:	e422                	sd	s0,8(sp)
 28c:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 28e:	00054783          	lbu	a5,0(a0)
 292:	cb91                	beqz	a5,2a6 <strcmp+0x1e>
 294:	0005c703          	lbu	a4,0(a1)
 298:	00f71763          	bne	a4,a5,2a6 <strcmp+0x1e>
    p++, q++;
 29c:	0505                	addi	a0,a0,1
 29e:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 2a0:	00054783          	lbu	a5,0(a0)
 2a4:	fbe5                	bnez	a5,294 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 2a6:	0005c503          	lbu	a0,0(a1)
}
 2aa:	40a7853b          	subw	a0,a5,a0
 2ae:	6422                	ld	s0,8(sp)
 2b0:	0141                	addi	sp,sp,16
 2b2:	8082                	ret

00000000000002b4 <strlen>:

uint
strlen(const char *s)
{
 2b4:	1141                	addi	sp,sp,-16
 2b6:	e422                	sd	s0,8(sp)
 2b8:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 2ba:	00054783          	lbu	a5,0(a0)
 2be:	cf91                	beqz	a5,2da <strlen+0x26>
 2c0:	0505                	addi	a0,a0,1
 2c2:	87aa                	mv	a5,a0
 2c4:	86be                	mv	a3,a5
 2c6:	0785                	addi	a5,a5,1
 2c8:	fff7c703          	lbu	a4,-1(a5)
 2cc:	ff65                	bnez	a4,2c4 <strlen+0x10>
 2ce:	40a6853b          	subw	a0,a3,a0
 2d2:	2505                	addiw	a0,a0,1
    ;
  return n;
}
 2d4:	6422                	ld	s0,8(sp)
 2d6:	0141                	addi	sp,sp,16
 2d8:	8082                	ret
  for(n = 0; s[n]; n++)
 2da:	4501                	li	a0,0
 2dc:	bfe5                	j	2d4 <strlen+0x20>

00000000000002de <memset>:

void*
memset(void *dst, int c, uint n)
{
 2de:	1141                	addi	sp,sp,-16
 2e0:	e422                	sd	s0,8(sp)
 2e2:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 2e4:	ca19                	beqz	a2,2fa <memset+0x1c>
 2e6:	87aa                	mv	a5,a0
 2e8:	1602                	slli	a2,a2,0x20
 2ea:	9201                	srli	a2,a2,0x20
 2ec:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 2f0:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 2f4:	0785                	addi	a5,a5,1
 2f6:	fee79de3          	bne	a5,a4,2f0 <memset+0x12>
  }
  return dst;
}
 2fa:	6422                	ld	s0,8(sp)
 2fc:	0141                	addi	sp,sp,16
 2fe:	8082                	ret

0000000000000300 <strchr>:

char*
strchr(const char *s, char c)
{
 300:	1141                	addi	sp,sp,-16
 302:	e422                	sd	s0,8(sp)
 304:	0800                	addi	s0,sp,16
  for(; *s; s++)
 306:	00054783          	lbu	a5,0(a0)
 30a:	cb99                	beqz	a5,320 <strchr+0x20>
    if(*s == c)
 30c:	00f58763          	beq	a1,a5,31a <strchr+0x1a>
  for(; *s; s++)
 310:	0505                	addi	a0,a0,1
 312:	00054783          	lbu	a5,0(a0)
 316:	fbfd                	bnez	a5,30c <strchr+0xc>
      return (char*)s;
  return 0;
 318:	4501                	li	a0,0
}
 31a:	6422                	ld	s0,8(sp)
 31c:	0141                	addi	sp,sp,16
 31e:	8082                	ret
  return 0;
 320:	4501                	li	a0,0
 322:	bfe5                	j	31a <strchr+0x1a>

0000000000000324 <gets>:

char*
gets(char *buf, int max)
{
 324:	711d                	addi	sp,sp,-96
 326:	ec86                	sd	ra,88(sp)
 328:	e8a2                	sd	s0,80(sp)
 32a:	e4a6                	sd	s1,72(sp)
 32c:	e0ca                	sd	s2,64(sp)
 32e:	fc4e                	sd	s3,56(sp)
 330:	f852                	sd	s4,48(sp)
 332:	f456                	sd	s5,40(sp)
 334:	f05a                	sd	s6,32(sp)
 336:	ec5e                	sd	s7,24(sp)
 338:	1080                	addi	s0,sp,96
 33a:	8baa                	mv	s7,a0
 33c:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 33e:	892a                	mv	s2,a0
 340:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 342:	4aa9                	li	s5,10
 344:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 346:	89a6                	mv	s3,s1
 348:	2485                	addiw	s1,s1,1
 34a:	0344d663          	bge	s1,s4,376 <gets+0x52>
    cc = read(0, &c, 1);
 34e:	4605                	li	a2,1
 350:	faf40593          	addi	a1,s0,-81
 354:	4501                	li	a0,0
 356:	1b2000ef          	jal	508 <read>
    if(cc < 1)
 35a:	00a05e63          	blez	a0,376 <gets+0x52>
    buf[i++] = c;
 35e:	faf44783          	lbu	a5,-81(s0)
 362:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 366:	01578763          	beq	a5,s5,374 <gets+0x50>
 36a:	0905                	addi	s2,s2,1
 36c:	fd679de3          	bne	a5,s6,346 <gets+0x22>
    buf[i++] = c;
 370:	89a6                	mv	s3,s1
 372:	a011                	j	376 <gets+0x52>
 374:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 376:	99de                	add	s3,s3,s7
 378:	00098023          	sb	zero,0(s3)
  return buf;
}
 37c:	855e                	mv	a0,s7
 37e:	60e6                	ld	ra,88(sp)
 380:	6446                	ld	s0,80(sp)
 382:	64a6                	ld	s1,72(sp)
 384:	6906                	ld	s2,64(sp)
 386:	79e2                	ld	s3,56(sp)
 388:	7a42                	ld	s4,48(sp)
 38a:	7aa2                	ld	s5,40(sp)
 38c:	7b02                	ld	s6,32(sp)
 38e:	6be2                	ld	s7,24(sp)
 390:	6125                	addi	sp,sp,96
 392:	8082                	ret

0000000000000394 <stat>:

int
stat(const char *n, struct stat *st)
{
 394:	1101                	addi	sp,sp,-32
 396:	ec06                	sd	ra,24(sp)
 398:	e822                	sd	s0,16(sp)
 39a:	e04a                	sd	s2,0(sp)
 39c:	1000                	addi	s0,sp,32
 39e:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a0:	4581                	li	a1,0
 3a2:	18e000ef          	jal	530 <open>
  if(fd < 0)
 3a6:	02054263          	bltz	a0,3ca <stat+0x36>
 3aa:	e426                	sd	s1,8(sp)
 3ac:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 3ae:	85ca                	mv	a1,s2
 3b0:	198000ef          	jal	548 <fstat>
 3b4:	892a                	mv	s2,a0
  close(fd);
 3b6:	8526                	mv	a0,s1
 3b8:	160000ef          	jal	518 <close>
  return r;
 3bc:	64a2                	ld	s1,8(sp)
}
 3be:	854a                	mv	a0,s2
 3c0:	60e2                	ld	ra,24(sp)
 3c2:	6442                	ld	s0,16(sp)
 3c4:	6902                	ld	s2,0(sp)
 3c6:	6105                	addi	sp,sp,32
 3c8:	8082                	ret
    return -1;
 3ca:	597d                	li	s2,-1
 3cc:	bfcd                	j	3be <stat+0x2a>

00000000000003ce <atoi>:

int
atoi(const char *s)
{
 3ce:	1141                	addi	sp,sp,-16
 3d0:	e422                	sd	s0,8(sp)
 3d2:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3d4:	00054683          	lbu	a3,0(a0)
 3d8:	fd06879b          	addiw	a5,a3,-48
 3dc:	0ff7f793          	zext.b	a5,a5
 3e0:	4625                	li	a2,9
 3e2:	02f66863          	bltu	a2,a5,412 <atoi+0x44>
 3e6:	872a                	mv	a4,a0
  n = 0;
 3e8:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 3ea:	0705                	addi	a4,a4,1
 3ec:	0025179b          	slliw	a5,a0,0x2
 3f0:	9fa9                	addw	a5,a5,a0
 3f2:	0017979b          	slliw	a5,a5,0x1
 3f6:	9fb5                	addw	a5,a5,a3
 3f8:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 3fc:	00074683          	lbu	a3,0(a4)
 400:	fd06879b          	addiw	a5,a3,-48
 404:	0ff7f793          	zext.b	a5,a5
 408:	fef671e3          	bgeu	a2,a5,3ea <atoi+0x1c>
  return n;
}
 40c:	6422                	ld	s0,8(sp)
 40e:	0141                	addi	sp,sp,16
 410:	8082                	ret
  n = 0;
 412:	4501                	li	a0,0
 414:	bfe5                	j	40c <atoi+0x3e>

0000000000000416 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 416:	1141                	addi	sp,sp,-16
 418:	e422                	sd	s0,8(sp)
 41a:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 41c:	02b57463          	bgeu	a0,a1,444 <memmove+0x2e>
    while(n-- > 0)
 420:	00c05f63          	blez	a2,43e <memmove+0x28>
 424:	1602                	slli	a2,a2,0x20
 426:	9201                	srli	a2,a2,0x20
 428:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 42c:	872a                	mv	a4,a0
      *dst++ = *src++;
 42e:	0585                	addi	a1,a1,1
 430:	0705                	addi	a4,a4,1
 432:	fff5c683          	lbu	a3,-1(a1)
 436:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 43a:	fef71ae3          	bne	a4,a5,42e <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 43e:	6422                	ld	s0,8(sp)
 440:	0141                	addi	sp,sp,16
 442:	8082                	ret
    dst += n;
 444:	00c50733          	add	a4,a0,a2
    src += n;
 448:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 44a:	fec05ae3          	blez	a2,43e <memmove+0x28>
 44e:	fff6079b          	addiw	a5,a2,-1
 452:	1782                	slli	a5,a5,0x20
 454:	9381                	srli	a5,a5,0x20
 456:	fff7c793          	not	a5,a5
 45a:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 45c:	15fd                	addi	a1,a1,-1
 45e:	177d                	addi	a4,a4,-1
 460:	0005c683          	lbu	a3,0(a1)
 464:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 468:	fee79ae3          	bne	a5,a4,45c <memmove+0x46>
 46c:	bfc9                	j	43e <memmove+0x28>

000000000000046e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 46e:	1141                	addi	sp,sp,-16
 470:	e422                	sd	s0,8(sp)
 472:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 474:	ca05                	beqz	a2,4a4 <memcmp+0x36>
 476:	fff6069b          	addiw	a3,a2,-1
 47a:	1682                	slli	a3,a3,0x20
 47c:	9281                	srli	a3,a3,0x20
 47e:	0685                	addi	a3,a3,1
 480:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 482:	00054783          	lbu	a5,0(a0)
 486:	0005c703          	lbu	a4,0(a1)
 48a:	00e79863          	bne	a5,a4,49a <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 48e:	0505                	addi	a0,a0,1
    p2++;
 490:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 492:	fed518e3          	bne	a0,a3,482 <memcmp+0x14>
  }
  return 0;
 496:	4501                	li	a0,0
 498:	a019                	j	49e <memcmp+0x30>
      return *p1 - *p2;
 49a:	40e7853b          	subw	a0,a5,a4
}
 49e:	6422                	ld	s0,8(sp)
 4a0:	0141                	addi	sp,sp,16
 4a2:	8082                	ret
  return 0;
 4a4:	4501                	li	a0,0
 4a6:	bfe5                	j	49e <memcmp+0x30>

00000000000004a8 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4a8:	1141                	addi	sp,sp,-16
 4aa:	e406                	sd	ra,8(sp)
 4ac:	e022                	sd	s0,0(sp)
 4ae:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 4b0:	f67ff0ef          	jal	416 <memmove>
}
 4b4:	60a2                	ld	ra,8(sp)
 4b6:	6402                	ld	s0,0(sp)
 4b8:	0141                	addi	sp,sp,16
 4ba:	8082                	ret

00000000000004bc <sbrk>:

char *
sbrk(int n) {
 4bc:	1141                	addi	sp,sp,-16
 4be:	e406                	sd	ra,8(sp)
 4c0:	e022                	sd	s0,0(sp)
 4c2:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_EAGER);
 4c4:	4585                	li	a1,1
 4c6:	0b2000ef          	jal	578 <sys_sbrk>
}
 4ca:	60a2                	ld	ra,8(sp)
 4cc:	6402                	ld	s0,0(sp)
 4ce:	0141                	addi	sp,sp,16
 4d0:	8082                	ret

00000000000004d2 <sbrklazy>:

char *
sbrklazy(int n) {
 4d2:	1141                	addi	sp,sp,-16
 4d4:	e406                	sd	ra,8(sp)
 4d6:	e022                	sd	s0,0(sp)
 4d8:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_LAZY);
 4da:	4589                	li	a1,2
 4dc:	09c000ef          	jal	578 <sys_sbrk>
}
 4e0:	60a2                	ld	ra,8(sp)
 4e2:	6402                	ld	s0,0(sp)
 4e4:	0141                	addi	sp,sp,16
 4e6:	8082                	ret

00000000000004e8 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 4e8:	4885                	li	a7,1
 ecall
 4ea:	00000073          	ecall
 ret
 4ee:	8082                	ret

00000000000004f0 <exit>:
.global exit
exit:
 li a7, SYS_exit
 4f0:	4889                	li	a7,2
 ecall
 4f2:	00000073          	ecall
 ret
 4f6:	8082                	ret

00000000000004f8 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4f8:	488d                	li	a7,3
 ecall
 4fa:	00000073          	ecall
 ret
 4fe:	8082                	ret

0000000000000500 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 500:	4891                	li	a7,4
 ecall
 502:	00000073          	ecall
 ret
 506:	8082                	ret

0000000000000508 <read>:
.global read
read:
 li a7, SYS_read
 508:	4895                	li	a7,5
 ecall
 50a:	00000073          	ecall
 ret
 50e:	8082                	ret

0000000000000510 <write>:
.global write
write:
 li a7, SYS_write
 510:	48c1                	li	a7,16
 ecall
 512:	00000073          	ecall
 ret
 516:	8082                	ret

0000000000000518 <close>:
.global close
close:
 li a7, SYS_close
 518:	48d5                	li	a7,21
 ecall
 51a:	00000073          	ecall
 ret
 51e:	8082                	ret

0000000000000520 <kill>:
.global kill
kill:
 li a7, SYS_kill
 520:	4899                	li	a7,6
 ecall
 522:	00000073          	ecall
 ret
 526:	8082                	ret

0000000000000528 <exec>:
.global exec
exec:
 li a7, SYS_exec
 528:	489d                	li	a7,7
 ecall
 52a:	00000073          	ecall
 ret
 52e:	8082                	ret

0000000000000530 <open>:
.global open
open:
 li a7, SYS_open
 530:	48bd                	li	a7,15
 ecall
 532:	00000073          	ecall
 ret
 536:	8082                	ret

0000000000000538 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 538:	48c5                	li	a7,17
 ecall
 53a:	00000073          	ecall
 ret
 53e:	8082                	ret

0000000000000540 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 540:	48c9                	li	a7,18
 ecall
 542:	00000073          	ecall
 ret
 546:	8082                	ret

0000000000000548 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 548:	48a1                	li	a7,8
 ecall
 54a:	00000073          	ecall
 ret
 54e:	8082                	ret

0000000000000550 <link>:
.global link
link:
 li a7, SYS_link
 550:	48cd                	li	a7,19
 ecall
 552:	00000073          	ecall
 ret
 556:	8082                	ret

0000000000000558 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 558:	48d1                	li	a7,20
 ecall
 55a:	00000073          	ecall
 ret
 55e:	8082                	ret

0000000000000560 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 560:	48a5                	li	a7,9
 ecall
 562:	00000073          	ecall
 ret
 566:	8082                	ret

0000000000000568 <dup>:
.global dup
dup:
 li a7, SYS_dup
 568:	48a9                	li	a7,10
 ecall
 56a:	00000073          	ecall
 ret
 56e:	8082                	ret

0000000000000570 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 570:	48ad                	li	a7,11
 ecall
 572:	00000073          	ecall
 ret
 576:	8082                	ret

0000000000000578 <sys_sbrk>:
.global sys_sbrk
sys_sbrk:
 li a7, SYS_sbrk
 578:	48b1                	li	a7,12
 ecall
 57a:	00000073          	ecall
 ret
 57e:	8082                	ret

0000000000000580 <pause>:
.global pause
pause:
 li a7, SYS_pause
 580:	48b5                	li	a7,13
 ecall
 582:	00000073          	ecall
 ret
 586:	8082                	ret

0000000000000588 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 588:	48b9                	li	a7,14
 ecall
 58a:	00000073          	ecall
 ret
 58e:	8082                	ret

0000000000000590 <symlink>:
.global symlink
symlink:
 li a7, SYS_symlink
 590:	48d9                	li	a7,22
 ecall
 592:	00000073          	ecall
 ret
 596:	8082                	ret

0000000000000598 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 598:	1101                	addi	sp,sp,-32
 59a:	ec06                	sd	ra,24(sp)
 59c:	e822                	sd	s0,16(sp)
 59e:	1000                	addi	s0,sp,32
 5a0:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 5a4:	4605                	li	a2,1
 5a6:	fef40593          	addi	a1,s0,-17
 5aa:	f67ff0ef          	jal	510 <write>
}
 5ae:	60e2                	ld	ra,24(sp)
 5b0:	6442                	ld	s0,16(sp)
 5b2:	6105                	addi	sp,sp,32
 5b4:	8082                	ret

00000000000005b6 <printint>:

static void
printint(int fd, long long xx, int base, int sgn)
{
 5b6:	715d                	addi	sp,sp,-80
 5b8:	e486                	sd	ra,72(sp)
 5ba:	e0a2                	sd	s0,64(sp)
 5bc:	fc26                	sd	s1,56(sp)
 5be:	0880                	addi	s0,sp,80
 5c0:	84aa                	mv	s1,a0
  char buf[20];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5c2:	c299                	beqz	a3,5c8 <printint+0x12>
 5c4:	0805c963          	bltz	a1,656 <printint+0xa0>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5c8:	2581                	sext.w	a1,a1
  neg = 0;
 5ca:	4881                	li	a7,0
 5cc:	fb840693          	addi	a3,s0,-72
  }

  i = 0;
 5d0:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5d2:	2601                	sext.w	a2,a2
 5d4:	00000517          	auipc	a0,0x0
 5d8:	54c50513          	addi	a0,a0,1356 # b20 <digits>
 5dc:	883a                	mv	a6,a4
 5de:	2705                	addiw	a4,a4,1
 5e0:	02c5f7bb          	remuw	a5,a1,a2
 5e4:	1782                	slli	a5,a5,0x20
 5e6:	9381                	srli	a5,a5,0x20
 5e8:	97aa                	add	a5,a5,a0
 5ea:	0007c783          	lbu	a5,0(a5)
 5ee:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5f2:	0005879b          	sext.w	a5,a1
 5f6:	02c5d5bb          	divuw	a1,a1,a2
 5fa:	0685                	addi	a3,a3,1
 5fc:	fec7f0e3          	bgeu	a5,a2,5dc <printint+0x26>
  if(neg)
 600:	00088c63          	beqz	a7,618 <printint+0x62>
    buf[i++] = '-';
 604:	fd070793          	addi	a5,a4,-48
 608:	00878733          	add	a4,a5,s0
 60c:	02d00793          	li	a5,45
 610:	fef70423          	sb	a5,-24(a4)
 614:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 618:	02e05a63          	blez	a4,64c <printint+0x96>
 61c:	f84a                	sd	s2,48(sp)
 61e:	f44e                	sd	s3,40(sp)
 620:	fb840793          	addi	a5,s0,-72
 624:	00e78933          	add	s2,a5,a4
 628:	fff78993          	addi	s3,a5,-1
 62c:	99ba                	add	s3,s3,a4
 62e:	377d                	addiw	a4,a4,-1
 630:	1702                	slli	a4,a4,0x20
 632:	9301                	srli	a4,a4,0x20
 634:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 638:	fff94583          	lbu	a1,-1(s2)
 63c:	8526                	mv	a0,s1
 63e:	f5bff0ef          	jal	598 <putc>
  while(--i >= 0)
 642:	197d                	addi	s2,s2,-1
 644:	ff391ae3          	bne	s2,s3,638 <printint+0x82>
 648:	7942                	ld	s2,48(sp)
 64a:	79a2                	ld	s3,40(sp)
}
 64c:	60a6                	ld	ra,72(sp)
 64e:	6406                	ld	s0,64(sp)
 650:	74e2                	ld	s1,56(sp)
 652:	6161                	addi	sp,sp,80
 654:	8082                	ret
    x = -xx;
 656:	40b005bb          	negw	a1,a1
    neg = 1;
 65a:	4885                	li	a7,1
    x = -xx;
 65c:	bf85                	j	5cc <printint+0x16>

000000000000065e <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %c, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 65e:	711d                	addi	sp,sp,-96
 660:	ec86                	sd	ra,88(sp)
 662:	e8a2                	sd	s0,80(sp)
 664:	e0ca                	sd	s2,64(sp)
 666:	1080                	addi	s0,sp,96
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 668:	0005c903          	lbu	s2,0(a1)
 66c:	28090663          	beqz	s2,8f8 <vprintf+0x29a>
 670:	e4a6                	sd	s1,72(sp)
 672:	fc4e                	sd	s3,56(sp)
 674:	f852                	sd	s4,48(sp)
 676:	f456                	sd	s5,40(sp)
 678:	f05a                	sd	s6,32(sp)
 67a:	ec5e                	sd	s7,24(sp)
 67c:	e862                	sd	s8,16(sp)
 67e:	e466                	sd	s9,8(sp)
 680:	8b2a                	mv	s6,a0
 682:	8a2e                	mv	s4,a1
 684:	8bb2                	mv	s7,a2
  state = 0;
 686:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
 688:	4481                	li	s1,0
 68a:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
 68c:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
 690:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
 694:	06c00c93          	li	s9,108
 698:	a005                	j	6b8 <vprintf+0x5a>
        putc(fd, c0);
 69a:	85ca                	mv	a1,s2
 69c:	855a                	mv	a0,s6
 69e:	efbff0ef          	jal	598 <putc>
 6a2:	a019                	j	6a8 <vprintf+0x4a>
    } else if(state == '%'){
 6a4:	03598263          	beq	s3,s5,6c8 <vprintf+0x6a>
  for(i = 0; fmt[i]; i++){
 6a8:	2485                	addiw	s1,s1,1
 6aa:	8726                	mv	a4,s1
 6ac:	009a07b3          	add	a5,s4,s1
 6b0:	0007c903          	lbu	s2,0(a5)
 6b4:	22090a63          	beqz	s2,8e8 <vprintf+0x28a>
    c0 = fmt[i] & 0xff;
 6b8:	0009079b          	sext.w	a5,s2
    if(state == 0){
 6bc:	fe0994e3          	bnez	s3,6a4 <vprintf+0x46>
      if(c0 == '%'){
 6c0:	fd579de3          	bne	a5,s5,69a <vprintf+0x3c>
        state = '%';
 6c4:	89be                	mv	s3,a5
 6c6:	b7cd                	j	6a8 <vprintf+0x4a>
      if(c0) c1 = fmt[i+1] & 0xff;
 6c8:	00ea06b3          	add	a3,s4,a4
 6cc:	0016c683          	lbu	a3,1(a3)
      c1 = c2 = 0;
 6d0:	8636                	mv	a2,a3
      if(c1) c2 = fmt[i+2] & 0xff;
 6d2:	c681                	beqz	a3,6da <vprintf+0x7c>
 6d4:	9752                	add	a4,a4,s4
 6d6:	00274603          	lbu	a2,2(a4)
      if(c0 == 'd'){
 6da:	05878363          	beq	a5,s8,720 <vprintf+0xc2>
      } else if(c0 == 'l' && c1 == 'd'){
 6de:	05978d63          	beq	a5,s9,738 <vprintf+0xda>
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 2;
      } else if(c0 == 'u'){
 6e2:	07500713          	li	a4,117
 6e6:	0ee78763          	beq	a5,a4,7d4 <vprintf+0x176>
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 2;
      } else if(c0 == 'x'){
 6ea:	07800713          	li	a4,120
 6ee:	12e78963          	beq	a5,a4,820 <vprintf+0x1c2>
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 2;
      } else if(c0 == 'p'){
 6f2:	07000713          	li	a4,112
 6f6:	14e78e63          	beq	a5,a4,852 <vprintf+0x1f4>
        printptr(fd, va_arg(ap, uint64));
      } else if(c0 == 'c'){
 6fa:	06300713          	li	a4,99
 6fe:	18e78e63          	beq	a5,a4,89a <vprintf+0x23c>
        putc(fd, va_arg(ap, uint32));
      } else if(c0 == 's'){
 702:	07300713          	li	a4,115
 706:	1ae78463          	beq	a5,a4,8ae <vprintf+0x250>
        if((s = va_arg(ap, char*)) == 0)
          s = "(null)";
        for(; *s; s++)
          putc(fd, *s);
      } else if(c0 == '%'){
 70a:	02500713          	li	a4,37
 70e:	04e79563          	bne	a5,a4,758 <vprintf+0xfa>
        putc(fd, '%');
 712:	02500593          	li	a1,37
 716:	855a                	mv	a0,s6
 718:	e81ff0ef          	jal	598 <putc>
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c0);
      }

      state = 0;
 71c:	4981                	li	s3,0
 71e:	b769                	j	6a8 <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 10, 1);
 720:	008b8913          	addi	s2,s7,8
 724:	4685                	li	a3,1
 726:	4629                	li	a2,10
 728:	000ba583          	lw	a1,0(s7)
 72c:	855a                	mv	a0,s6
 72e:	e89ff0ef          	jal	5b6 <printint>
 732:	8bca                	mv	s7,s2
      state = 0;
 734:	4981                	li	s3,0
 736:	bf8d                	j	6a8 <vprintf+0x4a>
      } else if(c0 == 'l' && c1 == 'd'){
 738:	06400793          	li	a5,100
 73c:	02f68963          	beq	a3,a5,76e <vprintf+0x110>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 740:	06c00793          	li	a5,108
 744:	04f68263          	beq	a3,a5,788 <vprintf+0x12a>
      } else if(c0 == 'l' && c1 == 'u'){
 748:	07500793          	li	a5,117
 74c:	0af68063          	beq	a3,a5,7ec <vprintf+0x18e>
      } else if(c0 == 'l' && c1 == 'x'){
 750:	07800793          	li	a5,120
 754:	0ef68263          	beq	a3,a5,838 <vprintf+0x1da>
        putc(fd, '%');
 758:	02500593          	li	a1,37
 75c:	855a                	mv	a0,s6
 75e:	e3bff0ef          	jal	598 <putc>
        putc(fd, c0);
 762:	85ca                	mv	a1,s2
 764:	855a                	mv	a0,s6
 766:	e33ff0ef          	jal	598 <putc>
      state = 0;
 76a:	4981                	li	s3,0
 76c:	bf35                	j	6a8 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 76e:	008b8913          	addi	s2,s7,8
 772:	4685                	li	a3,1
 774:	4629                	li	a2,10
 776:	000bb583          	ld	a1,0(s7)
 77a:	855a                	mv	a0,s6
 77c:	e3bff0ef          	jal	5b6 <printint>
        i += 1;
 780:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 1);
 782:	8bca                	mv	s7,s2
      state = 0;
 784:	4981                	li	s3,0
        i += 1;
 786:	b70d                	j	6a8 <vprintf+0x4a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 788:	06400793          	li	a5,100
 78c:	02f60763          	beq	a2,a5,7ba <vprintf+0x15c>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 790:	07500793          	li	a5,117
 794:	06f60963          	beq	a2,a5,806 <vprintf+0x1a8>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
 798:	07800793          	li	a5,120
 79c:	faf61ee3          	bne	a2,a5,758 <vprintf+0xfa>
        printint(fd, va_arg(ap, uint64), 16, 0);
 7a0:	008b8913          	addi	s2,s7,8
 7a4:	4681                	li	a3,0
 7a6:	4641                	li	a2,16
 7a8:	000bb583          	ld	a1,0(s7)
 7ac:	855a                	mv	a0,s6
 7ae:	e09ff0ef          	jal	5b6 <printint>
        i += 2;
 7b2:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 16, 0);
 7b4:	8bca                	mv	s7,s2
      state = 0;
 7b6:	4981                	li	s3,0
        i += 2;
 7b8:	bdc5                	j	6a8 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 7ba:	008b8913          	addi	s2,s7,8
 7be:	4685                	li	a3,1
 7c0:	4629                	li	a2,10
 7c2:	000bb583          	ld	a1,0(s7)
 7c6:	855a                	mv	a0,s6
 7c8:	defff0ef          	jal	5b6 <printint>
        i += 2;
 7cc:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 1);
 7ce:	8bca                	mv	s7,s2
      state = 0;
 7d0:	4981                	li	s3,0
        i += 2;
 7d2:	bdd9                	j	6a8 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint32), 10, 0);
 7d4:	008b8913          	addi	s2,s7,8
 7d8:	4681                	li	a3,0
 7da:	4629                	li	a2,10
 7dc:	000be583          	lwu	a1,0(s7)
 7e0:	855a                	mv	a0,s6
 7e2:	dd5ff0ef          	jal	5b6 <printint>
 7e6:	8bca                	mv	s7,s2
      state = 0;
 7e8:	4981                	li	s3,0
 7ea:	bd7d                	j	6a8 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 7ec:	008b8913          	addi	s2,s7,8
 7f0:	4681                	li	a3,0
 7f2:	4629                	li	a2,10
 7f4:	000bb583          	ld	a1,0(s7)
 7f8:	855a                	mv	a0,s6
 7fa:	dbdff0ef          	jal	5b6 <printint>
        i += 1;
 7fe:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 0);
 800:	8bca                	mv	s7,s2
      state = 0;
 802:	4981                	li	s3,0
        i += 1;
 804:	b555                	j	6a8 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 806:	008b8913          	addi	s2,s7,8
 80a:	4681                	li	a3,0
 80c:	4629                	li	a2,10
 80e:	000bb583          	ld	a1,0(s7)
 812:	855a                	mv	a0,s6
 814:	da3ff0ef          	jal	5b6 <printint>
        i += 2;
 818:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 0);
 81a:	8bca                	mv	s7,s2
      state = 0;
 81c:	4981                	li	s3,0
        i += 2;
 81e:	b569                	j	6a8 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint32), 16, 0);
 820:	008b8913          	addi	s2,s7,8
 824:	4681                	li	a3,0
 826:	4641                	li	a2,16
 828:	000be583          	lwu	a1,0(s7)
 82c:	855a                	mv	a0,s6
 82e:	d89ff0ef          	jal	5b6 <printint>
 832:	8bca                	mv	s7,s2
      state = 0;
 834:	4981                	li	s3,0
 836:	bd8d                	j	6a8 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 16, 0);
 838:	008b8913          	addi	s2,s7,8
 83c:	4681                	li	a3,0
 83e:	4641                	li	a2,16
 840:	000bb583          	ld	a1,0(s7)
 844:	855a                	mv	a0,s6
 846:	d71ff0ef          	jal	5b6 <printint>
        i += 1;
 84a:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 16, 0);
 84c:	8bca                	mv	s7,s2
      state = 0;
 84e:	4981                	li	s3,0
        i += 1;
 850:	bda1                	j	6a8 <vprintf+0x4a>
 852:	e06a                	sd	s10,0(sp)
        printptr(fd, va_arg(ap, uint64));
 854:	008b8d13          	addi	s10,s7,8
 858:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
 85c:	03000593          	li	a1,48
 860:	855a                	mv	a0,s6
 862:	d37ff0ef          	jal	598 <putc>
  putc(fd, 'x');
 866:	07800593          	li	a1,120
 86a:	855a                	mv	a0,s6
 86c:	d2dff0ef          	jal	598 <putc>
 870:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 872:	00000b97          	auipc	s7,0x0
 876:	2aeb8b93          	addi	s7,s7,686 # b20 <digits>
 87a:	03c9d793          	srli	a5,s3,0x3c
 87e:	97de                	add	a5,a5,s7
 880:	0007c583          	lbu	a1,0(a5)
 884:	855a                	mv	a0,s6
 886:	d13ff0ef          	jal	598 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 88a:	0992                	slli	s3,s3,0x4
 88c:	397d                	addiw	s2,s2,-1
 88e:	fe0916e3          	bnez	s2,87a <vprintf+0x21c>
        printptr(fd, va_arg(ap, uint64));
 892:	8bea                	mv	s7,s10
      state = 0;
 894:	4981                	li	s3,0
 896:	6d02                	ld	s10,0(sp)
 898:	bd01                	j	6a8 <vprintf+0x4a>
        putc(fd, va_arg(ap, uint32));
 89a:	008b8913          	addi	s2,s7,8
 89e:	000bc583          	lbu	a1,0(s7)
 8a2:	855a                	mv	a0,s6
 8a4:	cf5ff0ef          	jal	598 <putc>
 8a8:	8bca                	mv	s7,s2
      state = 0;
 8aa:	4981                	li	s3,0
 8ac:	bbf5                	j	6a8 <vprintf+0x4a>
        if((s = va_arg(ap, char*)) == 0)
 8ae:	008b8993          	addi	s3,s7,8
 8b2:	000bb903          	ld	s2,0(s7)
 8b6:	00090f63          	beqz	s2,8d4 <vprintf+0x276>
        for(; *s; s++)
 8ba:	00094583          	lbu	a1,0(s2)
 8be:	c195                	beqz	a1,8e2 <vprintf+0x284>
          putc(fd, *s);
 8c0:	855a                	mv	a0,s6
 8c2:	cd7ff0ef          	jal	598 <putc>
        for(; *s; s++)
 8c6:	0905                	addi	s2,s2,1
 8c8:	00094583          	lbu	a1,0(s2)
 8cc:	f9f5                	bnez	a1,8c0 <vprintf+0x262>
        if((s = va_arg(ap, char*)) == 0)
 8ce:	8bce                	mv	s7,s3
      state = 0;
 8d0:	4981                	li	s3,0
 8d2:	bbd9                	j	6a8 <vprintf+0x4a>
          s = "(null)";
 8d4:	00000917          	auipc	s2,0x0
 8d8:	24490913          	addi	s2,s2,580 # b18 <malloc+0x138>
        for(; *s; s++)
 8dc:	02800593          	li	a1,40
 8e0:	b7c5                	j	8c0 <vprintf+0x262>
        if((s = va_arg(ap, char*)) == 0)
 8e2:	8bce                	mv	s7,s3
      state = 0;
 8e4:	4981                	li	s3,0
 8e6:	b3c9                	j	6a8 <vprintf+0x4a>
 8e8:	64a6                	ld	s1,72(sp)
 8ea:	79e2                	ld	s3,56(sp)
 8ec:	7a42                	ld	s4,48(sp)
 8ee:	7aa2                	ld	s5,40(sp)
 8f0:	7b02                	ld	s6,32(sp)
 8f2:	6be2                	ld	s7,24(sp)
 8f4:	6c42                	ld	s8,16(sp)
 8f6:	6ca2                	ld	s9,8(sp)
    }
  }
}
 8f8:	60e6                	ld	ra,88(sp)
 8fa:	6446                	ld	s0,80(sp)
 8fc:	6906                	ld	s2,64(sp)
 8fe:	6125                	addi	sp,sp,96
 900:	8082                	ret

0000000000000902 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 902:	715d                	addi	sp,sp,-80
 904:	ec06                	sd	ra,24(sp)
 906:	e822                	sd	s0,16(sp)
 908:	1000                	addi	s0,sp,32
 90a:	e010                	sd	a2,0(s0)
 90c:	e414                	sd	a3,8(s0)
 90e:	e818                	sd	a4,16(s0)
 910:	ec1c                	sd	a5,24(s0)
 912:	03043023          	sd	a6,32(s0)
 916:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 91a:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 91e:	8622                	mv	a2,s0
 920:	d3fff0ef          	jal	65e <vprintf>
}
 924:	60e2                	ld	ra,24(sp)
 926:	6442                	ld	s0,16(sp)
 928:	6161                	addi	sp,sp,80
 92a:	8082                	ret

000000000000092c <printf>:

void
printf(const char *fmt, ...)
{
 92c:	711d                	addi	sp,sp,-96
 92e:	ec06                	sd	ra,24(sp)
 930:	e822                	sd	s0,16(sp)
 932:	1000                	addi	s0,sp,32
 934:	e40c                	sd	a1,8(s0)
 936:	e810                	sd	a2,16(s0)
 938:	ec14                	sd	a3,24(s0)
 93a:	f018                	sd	a4,32(s0)
 93c:	f41c                	sd	a5,40(s0)
 93e:	03043823          	sd	a6,48(s0)
 942:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 946:	00840613          	addi	a2,s0,8
 94a:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 94e:	85aa                	mv	a1,a0
 950:	4505                	li	a0,1
 952:	d0dff0ef          	jal	65e <vprintf>
}
 956:	60e2                	ld	ra,24(sp)
 958:	6442                	ld	s0,16(sp)
 95a:	6125                	addi	sp,sp,96
 95c:	8082                	ret

000000000000095e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 95e:	1141                	addi	sp,sp,-16
 960:	e422                	sd	s0,8(sp)
 962:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 964:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 968:	00000797          	auipc	a5,0x0
 96c:	6987b783          	ld	a5,1688(a5) # 1000 <freep>
 970:	a02d                	j	99a <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 972:	4618                	lw	a4,8(a2)
 974:	9f2d                	addw	a4,a4,a1
 976:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 97a:	6398                	ld	a4,0(a5)
 97c:	6310                	ld	a2,0(a4)
 97e:	a83d                	j	9bc <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 980:	ff852703          	lw	a4,-8(a0)
 984:	9f31                	addw	a4,a4,a2
 986:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 988:	ff053683          	ld	a3,-16(a0)
 98c:	a091                	j	9d0 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 98e:	6398                	ld	a4,0(a5)
 990:	00e7e463          	bltu	a5,a4,998 <free+0x3a>
 994:	00e6ea63          	bltu	a3,a4,9a8 <free+0x4a>
{
 998:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 99a:	fed7fae3          	bgeu	a5,a3,98e <free+0x30>
 99e:	6398                	ld	a4,0(a5)
 9a0:	00e6e463          	bltu	a3,a4,9a8 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a4:	fee7eae3          	bltu	a5,a4,998 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 9a8:	ff852583          	lw	a1,-8(a0)
 9ac:	6390                	ld	a2,0(a5)
 9ae:	02059813          	slli	a6,a1,0x20
 9b2:	01c85713          	srli	a4,a6,0x1c
 9b6:	9736                	add	a4,a4,a3
 9b8:	fae60de3          	beq	a2,a4,972 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 9bc:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 9c0:	4790                	lw	a2,8(a5)
 9c2:	02061593          	slli	a1,a2,0x20
 9c6:	01c5d713          	srli	a4,a1,0x1c
 9ca:	973e                	add	a4,a4,a5
 9cc:	fae68ae3          	beq	a3,a4,980 <free+0x22>
    p->s.ptr = bp->s.ptr;
 9d0:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 9d2:	00000717          	auipc	a4,0x0
 9d6:	62f73723          	sd	a5,1582(a4) # 1000 <freep>
}
 9da:	6422                	ld	s0,8(sp)
 9dc:	0141                	addi	sp,sp,16
 9de:	8082                	ret

00000000000009e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9e0:	7139                	addi	sp,sp,-64
 9e2:	fc06                	sd	ra,56(sp)
 9e4:	f822                	sd	s0,48(sp)
 9e6:	f426                	sd	s1,40(sp)
 9e8:	ec4e                	sd	s3,24(sp)
 9ea:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9ec:	02051493          	slli	s1,a0,0x20
 9f0:	9081                	srli	s1,s1,0x20
 9f2:	04bd                	addi	s1,s1,15
 9f4:	8091                	srli	s1,s1,0x4
 9f6:	0014899b          	addiw	s3,s1,1
 9fa:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 9fc:	00000517          	auipc	a0,0x0
 a00:	60453503          	ld	a0,1540(a0) # 1000 <freep>
 a04:	c915                	beqz	a0,a38 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a06:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a08:	4798                	lw	a4,8(a5)
 a0a:	08977a63          	bgeu	a4,s1,a9e <malloc+0xbe>
 a0e:	f04a                	sd	s2,32(sp)
 a10:	e852                	sd	s4,16(sp)
 a12:	e456                	sd	s5,8(sp)
 a14:	e05a                	sd	s6,0(sp)
  if(nu < 4096)
 a16:	8a4e                	mv	s4,s3
 a18:	0009871b          	sext.w	a4,s3
 a1c:	6685                	lui	a3,0x1
 a1e:	00d77363          	bgeu	a4,a3,a24 <malloc+0x44>
 a22:	6a05                	lui	s4,0x1
 a24:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 a28:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a2c:	00000917          	auipc	s2,0x0
 a30:	5d490913          	addi	s2,s2,1492 # 1000 <freep>
  if(p == SBRK_ERROR)
 a34:	5afd                	li	s5,-1
 a36:	a081                	j	a76 <malloc+0x96>
 a38:	f04a                	sd	s2,32(sp)
 a3a:	e852                	sd	s4,16(sp)
 a3c:	e456                	sd	s5,8(sp)
 a3e:	e05a                	sd	s6,0(sp)
    base.s.ptr = freep = prevp = &base;
 a40:	00001797          	auipc	a5,0x1
 a44:	9d078793          	addi	a5,a5,-1584 # 1410 <base>
 a48:	00000717          	auipc	a4,0x0
 a4c:	5af73c23          	sd	a5,1464(a4) # 1000 <freep>
 a50:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 a52:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 a56:	b7c1                	j	a16 <malloc+0x36>
        prevp->s.ptr = p->s.ptr;
 a58:	6398                	ld	a4,0(a5)
 a5a:	e118                	sd	a4,0(a0)
 a5c:	a8a9                	j	ab6 <malloc+0xd6>
  hp->s.size = nu;
 a5e:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a62:	0541                	addi	a0,a0,16
 a64:	efbff0ef          	jal	95e <free>
  return freep;
 a68:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 a6c:	c12d                	beqz	a0,ace <malloc+0xee>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a6e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a70:	4798                	lw	a4,8(a5)
 a72:	02977263          	bgeu	a4,s1,a96 <malloc+0xb6>
    if(p == freep)
 a76:	00093703          	ld	a4,0(s2)
 a7a:	853e                	mv	a0,a5
 a7c:	fef719e3          	bne	a4,a5,a6e <malloc+0x8e>
  p = sbrk(nu * sizeof(Header));
 a80:	8552                	mv	a0,s4
 a82:	a3bff0ef          	jal	4bc <sbrk>
  if(p == SBRK_ERROR)
 a86:	fd551ce3          	bne	a0,s5,a5e <malloc+0x7e>
        return 0;
 a8a:	4501                	li	a0,0
 a8c:	7902                	ld	s2,32(sp)
 a8e:	6a42                	ld	s4,16(sp)
 a90:	6aa2                	ld	s5,8(sp)
 a92:	6b02                	ld	s6,0(sp)
 a94:	a03d                	j	ac2 <malloc+0xe2>
 a96:	7902                	ld	s2,32(sp)
 a98:	6a42                	ld	s4,16(sp)
 a9a:	6aa2                	ld	s5,8(sp)
 a9c:	6b02                	ld	s6,0(sp)
      if(p->s.size == nunits)
 a9e:	fae48de3          	beq	s1,a4,a58 <malloc+0x78>
        p->s.size -= nunits;
 aa2:	4137073b          	subw	a4,a4,s3
 aa6:	c798                	sw	a4,8(a5)
        p += p->s.size;
 aa8:	02071693          	slli	a3,a4,0x20
 aac:	01c6d713          	srli	a4,a3,0x1c
 ab0:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 ab2:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 ab6:	00000717          	auipc	a4,0x0
 aba:	54a73523          	sd	a0,1354(a4) # 1000 <freep>
      return (void*)(p + 1);
 abe:	01078513          	addi	a0,a5,16
  }
}
 ac2:	70e2                	ld	ra,56(sp)
 ac4:	7442                	ld	s0,48(sp)
 ac6:	74a2                	ld	s1,40(sp)
 ac8:	69e2                	ld	s3,24(sp)
 aca:	6121                	addi	sp,sp,64
 acc:	8082                	ret
 ace:	7902                	ld	s2,32(sp)
 ad0:	6a42                	ld	s4,16(sp)
 ad2:	6aa2                	ld	s5,8(sp)
 ad4:	6b02                	ld	s6,0(sp)
 ad6:	b7f5                	j	ac2 <malloc+0xe2>
