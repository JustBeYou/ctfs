
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
		return -1;
	return 0;
}

int main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
	static char buf[100];
	int fd;

	// Ensure that three file descriptors are open.
	while ((fd = open("console", O_RDWR)) >= 0) {
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	90                   	nop
      14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if (fd >= 3) {
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f b7 00 00 00    	jg     d8 <main+0xd8>
	while ((fd = open("console", O_RDWR)) >= 0) {
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 c4 12 00 00       	push   $0x12c4
      2b:	e8 51 0d 00 00       	call   d81 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 32                	jmp    6b <main+0x6b>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		}
	}

	// Read and run input commands.
	while (getcmd(buf, sizeof(buf)) >= 0) {
		if (buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' ') {
      40:	80 3d 02 19 00 00 20 	cmpb   $0x20,0x1902
      47:	74 51                	je     9a <main+0x9a>
      49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

int fork1(void)
{
	int pid;

	pid = fork();
      50:	e8 e4 0c 00 00       	call   d39 <fork>
	if (pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 9d 00 00 00    	je     fb <main+0xfb>
		if (fork1() == 0)
      5e:	85 c0                	test   %eax,%eax
      60:	0f 84 80 00 00 00    	je     e6 <main+0xe6>
		wait();
      66:	e8 de 0c 00 00       	call   d49 <wait>
	while (getcmd(buf, sizeof(buf)) >= 0) {
      6b:	83 ec 08             	sub    $0x8,%esp
      6e:	6a 64                	push   $0x64
      70:	68 00 19 00 00       	push   $0x1900
      75:	e8 96 00 00 00       	call   110 <getcmd>
      7a:	83 c4 10             	add    $0x10,%esp
      7d:	85 c0                	test   %eax,%eax
      7f:	78 14                	js     95 <main+0x95>
		if (buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' ') {
      81:	80 3d 00 19 00 00 63 	cmpb   $0x63,0x1900
      88:	75 c6                	jne    50 <main+0x50>
      8a:	80 3d 01 19 00 00 64 	cmpb   $0x64,0x1901
      91:	75 bd                	jne    50 <main+0x50>
      93:	eb ab                	jmp    40 <main+0x40>
	exit();
      95:	e8 a7 0c 00 00       	call   d41 <exit>
			buf[strlen(buf) - 1] = 0; // chop \n
      9a:	83 ec 0c             	sub    $0xc,%esp
      9d:	68 00 19 00 00       	push   $0x1900
      a2:	e8 c9 0a 00 00       	call   b70 <strlen>
			if (chdir(buf + 3) < 0)
      a7:	c7 04 24 03 19 00 00 	movl   $0x1903,(%esp)
			buf[strlen(buf) - 1] = 0; // chop \n
      ae:	c6 80 ff 18 00 00 00 	movb   $0x0,0x18ff(%eax)
			if (chdir(buf + 3) < 0)
      b5:	e8 f7 0c 00 00       	call   db1 <chdir>
      ba:	83 c4 10             	add    $0x10,%esp
      bd:	85 c0                	test   %eax,%eax
      bf:	79 aa                	jns    6b <main+0x6b>
				printf(2, "cannot cd %s\n", buf + 3);
      c1:	50                   	push   %eax
      c2:	68 03 19 00 00       	push   $0x1903
      c7:	68 cc 12 00 00       	push   $0x12cc
      cc:	6a 02                	push   $0x2
      ce:	e8 dd 0d 00 00       	call   eb0 <printf>
      d3:	83 c4 10             	add    $0x10,%esp
      d6:	eb 93                	jmp    6b <main+0x6b>
			close(fd);
      d8:	83 ec 0c             	sub    $0xc,%esp
      db:	50                   	push   %eax
      dc:	e8 88 0c 00 00       	call   d69 <close>
			break;
      e1:	83 c4 10             	add    $0x10,%esp
      e4:	eb 85                	jmp    6b <main+0x6b>
			runcmd(parsecmd(buf));
      e6:	83 ec 0c             	sub    $0xc,%esp
      e9:	68 00 19 00 00       	push   $0x1900
      ee:	e8 8d 09 00 00       	call   a80 <parsecmd>
      f3:	89 04 24             	mov    %eax,(%esp)
      f6:	e8 85 00 00 00       	call   180 <runcmd>
		panic("fork");
      fb:	83 ec 0c             	sub    $0xc,%esp
      fe:	68 42 12 00 00       	push   $0x1242
     103:	e8 58 00 00 00       	call   160 <panic>
     108:	66 90                	xchg   %ax,%ax
     10a:	66 90                	xchg   %ax,%ax
     10c:	66 90                	xchg   %ax,%ax
     10e:	66 90                	xchg   %ax,%ax

00000110 <getcmd>:
{
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	56                   	push   %esi
     114:	53                   	push   %ebx
     115:	8b 75 0c             	mov    0xc(%ebp),%esi
     118:	8b 5d 08             	mov    0x8(%ebp),%ebx
	printf(2, "$ ");
     11b:	83 ec 08             	sub    $0x8,%esp
     11e:	68 18 12 00 00       	push   $0x1218
     123:	6a 02                	push   $0x2
     125:	e8 86 0d 00 00       	call   eb0 <printf>
	memset(buf, 0, nbuf);
     12a:	83 c4 0c             	add    $0xc,%esp
     12d:	56                   	push   %esi
     12e:	6a 00                	push   $0x0
     130:	53                   	push   %ebx
     131:	e8 6a 0a 00 00       	call   ba0 <memset>
	gets(buf, nbuf);
     136:	58                   	pop    %eax
     137:	5a                   	pop    %edx
     138:	56                   	push   %esi
     139:	53                   	push   %ebx
     13a:	e8 c1 0a 00 00       	call   c00 <gets>
	if (buf[0] == 0) // EOF
     13f:	83 c4 10             	add    $0x10,%esp
     142:	31 c0                	xor    %eax,%eax
     144:	80 3b 00             	cmpb   $0x0,(%ebx)
     147:	0f 94 c0             	sete   %al
}
     14a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     14d:	5b                   	pop    %ebx
	if (buf[0] == 0) // EOF
     14e:	f7 d8                	neg    %eax
}
     150:	5e                   	pop    %esi
     151:	5d                   	pop    %ebp
     152:	c3                   	ret    
     153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000160 <panic>:
{
     160:	55                   	push   %ebp
     161:	89 e5                	mov    %esp,%ebp
     163:	83 ec 0c             	sub    $0xc,%esp
	printf(2, "%s\n", s);
     166:	ff 75 08             	pushl  0x8(%ebp)
     169:	68 c0 12 00 00       	push   $0x12c0
     16e:	6a 02                	push   $0x2
     170:	e8 3b 0d 00 00       	call   eb0 <printf>
	exit();
     175:	e8 c7 0b 00 00       	call   d41 <exit>
     17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000180 <runcmd>:
{
     180:	55                   	push   %ebp
     181:	89 e5                	mov    %esp,%ebp
     183:	53                   	push   %ebx
     184:	83 ec 14             	sub    $0x14,%esp
     187:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if (cmd == 0)
     18a:	85 db                	test   %ebx,%ebx
     18c:	74 7a                	je     208 <runcmd+0x88>
	switch (cmd->type) {
     18e:	83 3b 05             	cmpl   $0x5,(%ebx)
     191:	0f 87 00 01 00 00    	ja     297 <runcmd+0x117>
     197:	8b 03                	mov    (%ebx),%eax
     199:	ff 24 85 dc 12 00 00 	jmp    *0x12dc(,%eax,4)
		if (pipe(p) < 0)
     1a0:	83 ec 0c             	sub    $0xc,%esp
     1a3:	8d 45 f0             	lea    -0x10(%ebp),%eax
     1a6:	50                   	push   %eax
     1a7:	e8 a5 0b 00 00       	call   d51 <pipe>
     1ac:	83 c4 10             	add    $0x10,%esp
     1af:	85 c0                	test   %eax,%eax
     1b1:	0f 88 02 01 00 00    	js     2b9 <runcmd+0x139>
	pid = fork();
     1b7:	e8 7d 0b 00 00       	call   d39 <fork>
	if (pid == -1)
     1bc:	83 f8 ff             	cmp    $0xffffffff,%eax
     1bf:	0f 84 5d 01 00 00    	je     322 <runcmd+0x1a2>
		if (fork1() == 0) {
     1c5:	85 c0                	test   %eax,%eax
     1c7:	0f 84 f9 00 00 00    	je     2c6 <runcmd+0x146>
	pid = fork();
     1cd:	e8 67 0b 00 00       	call   d39 <fork>
	if (pid == -1)
     1d2:	83 f8 ff             	cmp    $0xffffffff,%eax
     1d5:	0f 84 47 01 00 00    	je     322 <runcmd+0x1a2>
		if (fork1() == 0) {
     1db:	85 c0                	test   %eax,%eax
     1dd:	0f 84 11 01 00 00    	je     2f4 <runcmd+0x174>
		close(p[0]);
     1e3:	83 ec 0c             	sub    $0xc,%esp
     1e6:	ff 75 f0             	pushl  -0x10(%ebp)
     1e9:	e8 7b 0b 00 00       	call   d69 <close>
		close(p[1]);
     1ee:	58                   	pop    %eax
     1ef:	ff 75 f4             	pushl  -0xc(%ebp)
     1f2:	e8 72 0b 00 00       	call   d69 <close>
		wait();
     1f7:	e8 4d 0b 00 00       	call   d49 <wait>
		wait();
     1fc:	e8 48 0b 00 00       	call   d49 <wait>
		break;
     201:	83 c4 10             	add    $0x10,%esp
     204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		exit();
     208:	e8 34 0b 00 00       	call   d41 <exit>
	pid = fork();
     20d:	e8 27 0b 00 00       	call   d39 <fork>
	if (pid == -1)
     212:	83 f8 ff             	cmp    $0xffffffff,%eax
     215:	0f 84 07 01 00 00    	je     322 <runcmd+0x1a2>
		if (fork1() == 0)
     21b:	85 c0                	test   %eax,%eax
     21d:	75 e9                	jne    208 <runcmd+0x88>
     21f:	eb 6b                	jmp    28c <runcmd+0x10c>
		if (ecmd->argv[0] == 0)
     221:	8b 43 04             	mov    0x4(%ebx),%eax
     224:	85 c0                	test   %eax,%eax
     226:	74 e0                	je     208 <runcmd+0x88>
		exec(ecmd->argv[0], ecmd->argv);
     228:	52                   	push   %edx
     229:	52                   	push   %edx
     22a:	8d 53 04             	lea    0x4(%ebx),%edx
     22d:	52                   	push   %edx
     22e:	50                   	push   %eax
     22f:	e8 45 0b 00 00       	call   d79 <exec>
		printf(2, "exec %s failed\n", ecmd->argv[0]);
     234:	83 c4 0c             	add    $0xc,%esp
     237:	ff 73 04             	pushl  0x4(%ebx)
     23a:	68 22 12 00 00       	push   $0x1222
     23f:	6a 02                	push   $0x2
     241:	e8 6a 0c 00 00       	call   eb0 <printf>
		break;
     246:	83 c4 10             	add    $0x10,%esp
     249:	eb bd                	jmp    208 <runcmd+0x88>
	pid = fork();
     24b:	e8 e9 0a 00 00       	call   d39 <fork>
	if (pid == -1)
     250:	83 f8 ff             	cmp    $0xffffffff,%eax
     253:	0f 84 c9 00 00 00    	je     322 <runcmd+0x1a2>
		if (fork1() == 0)
     259:	85 c0                	test   %eax,%eax
     25b:	74 2f                	je     28c <runcmd+0x10c>
		wait();
     25d:	e8 e7 0a 00 00       	call   d49 <wait>
		runcmd(lcmd->right);
     262:	83 ec 0c             	sub    $0xc,%esp
     265:	ff 73 08             	pushl  0x8(%ebx)
     268:	e8 13 ff ff ff       	call   180 <runcmd>
		close(rcmd->fd);
     26d:	83 ec 0c             	sub    $0xc,%esp
     270:	ff 73 14             	pushl  0x14(%ebx)
     273:	e8 f1 0a 00 00       	call   d69 <close>
		if (open(rcmd->file, rcmd->mode) < 0) {
     278:	59                   	pop    %ecx
     279:	58                   	pop    %eax
     27a:	ff 73 10             	pushl  0x10(%ebx)
     27d:	ff 73 08             	pushl  0x8(%ebx)
     280:	e8 fc 0a 00 00       	call   d81 <open>
     285:	83 c4 10             	add    $0x10,%esp
     288:	85 c0                	test   %eax,%eax
     28a:	78 18                	js     2a4 <runcmd+0x124>
			runcmd(bcmd->cmd);
     28c:	83 ec 0c             	sub    $0xc,%esp
     28f:	ff 73 04             	pushl  0x4(%ebx)
     292:	e8 e9 fe ff ff       	call   180 <runcmd>
		panic("runcmd");
     297:	83 ec 0c             	sub    $0xc,%esp
     29a:	68 1b 12 00 00       	push   $0x121b
     29f:	e8 bc fe ff ff       	call   160 <panic>
			printf(2, "open %s failed\n", rcmd->file);
     2a4:	52                   	push   %edx
     2a5:	ff 73 08             	pushl  0x8(%ebx)
     2a8:	68 32 12 00 00       	push   $0x1232
     2ad:	6a 02                	push   $0x2
     2af:	e8 fc 0b 00 00       	call   eb0 <printf>
			exit();
     2b4:	e8 88 0a 00 00       	call   d41 <exit>
			panic("pipe");
     2b9:	83 ec 0c             	sub    $0xc,%esp
     2bc:	68 47 12 00 00       	push   $0x1247
     2c1:	e8 9a fe ff ff       	call   160 <panic>
			close(1);
     2c6:	83 ec 0c             	sub    $0xc,%esp
     2c9:	6a 01                	push   $0x1
     2cb:	e8 99 0a 00 00       	call   d69 <close>
			dup(p[1]);
     2d0:	58                   	pop    %eax
     2d1:	ff 75 f4             	pushl  -0xc(%ebp)
     2d4:	e8 e0 0a 00 00       	call   db9 <dup>
			close(p[0]);
     2d9:	58                   	pop    %eax
     2da:	ff 75 f0             	pushl  -0x10(%ebp)
     2dd:	e8 87 0a 00 00       	call   d69 <close>
			close(p[1]);
     2e2:	58                   	pop    %eax
     2e3:	ff 75 f4             	pushl  -0xc(%ebp)
     2e6:	e8 7e 0a 00 00       	call   d69 <close>
			runcmd(pcmd->left);
     2eb:	58                   	pop    %eax
     2ec:	ff 73 04             	pushl  0x4(%ebx)
     2ef:	e8 8c fe ff ff       	call   180 <runcmd>
			close(0);
     2f4:	83 ec 0c             	sub    $0xc,%esp
     2f7:	6a 00                	push   $0x0
     2f9:	e8 6b 0a 00 00       	call   d69 <close>
			dup(p[0]);
     2fe:	5a                   	pop    %edx
     2ff:	ff 75 f0             	pushl  -0x10(%ebp)
     302:	e8 b2 0a 00 00       	call   db9 <dup>
			close(p[0]);
     307:	59                   	pop    %ecx
     308:	ff 75 f0             	pushl  -0x10(%ebp)
     30b:	e8 59 0a 00 00       	call   d69 <close>
			close(p[1]);
     310:	58                   	pop    %eax
     311:	ff 75 f4             	pushl  -0xc(%ebp)
     314:	e8 50 0a 00 00       	call   d69 <close>
			runcmd(pcmd->right);
     319:	58                   	pop    %eax
     31a:	ff 73 08             	pushl  0x8(%ebx)
     31d:	e8 5e fe ff ff       	call   180 <runcmd>
		panic("fork");
     322:	83 ec 0c             	sub    $0xc,%esp
     325:	68 42 12 00 00       	push   $0x1242
     32a:	e8 31 fe ff ff       	call   160 <panic>
     32f:	90                   	nop

00000330 <fork1>:
{
     330:	55                   	push   %ebp
     331:	89 e5                	mov    %esp,%ebp
     333:	83 ec 08             	sub    $0x8,%esp
	pid = fork();
     336:	e8 fe 09 00 00       	call   d39 <fork>
	if (pid == -1)
     33b:	83 f8 ff             	cmp    $0xffffffff,%eax
     33e:	74 02                	je     342 <fork1+0x12>
	return pid;
}
     340:	c9                   	leave  
     341:	c3                   	ret    
		panic("fork");
     342:	83 ec 0c             	sub    $0xc,%esp
     345:	68 42 12 00 00       	push   $0x1242
     34a:	e8 11 fe ff ff       	call   160 <panic>
     34f:	90                   	nop

00000350 <execcmd>:

// Constructors

struct cmd *execcmd(void)
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	53                   	push   %ebx
     354:	83 ec 10             	sub    $0x10,%esp
	struct execcmd *cmd;

	cmd = malloc(sizeof(*cmd));
     357:	6a 54                	push   $0x54
     359:	e8 b2 0d 00 00       	call   1110 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     35e:	83 c4 0c             	add    $0xc,%esp
     361:	6a 54                	push   $0x54
	cmd = malloc(sizeof(*cmd));
     363:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     365:	6a 00                	push   $0x0
     367:	50                   	push   %eax
     368:	e8 33 08 00 00       	call   ba0 <memset>
	cmd->type = EXEC;
     36d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
	return (struct cmd *)cmd;
}
     373:	89 d8                	mov    %ebx,%eax
     375:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     378:	c9                   	leave  
     379:	c3                   	ret    
     37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000380 <redircmd>:

struct cmd *redircmd(struct cmd *subcmd, char *file, char *efile, int mode,
		     int fd)
{
     380:	55                   	push   %ebp
     381:	89 e5                	mov    %esp,%ebp
     383:	53                   	push   %ebx
     384:	83 ec 10             	sub    $0x10,%esp
	struct redircmd *cmd;

	cmd = malloc(sizeof(*cmd));
     387:	6a 18                	push   $0x18
     389:	e8 82 0d 00 00       	call   1110 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     38e:	83 c4 0c             	add    $0xc,%esp
     391:	6a 18                	push   $0x18
	cmd = malloc(sizeof(*cmd));
     393:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     395:	6a 00                	push   $0x0
     397:	50                   	push   %eax
     398:	e8 03 08 00 00       	call   ba0 <memset>
	cmd->type = REDIR;
	cmd->cmd = subcmd;
     39d:	8b 45 08             	mov    0x8(%ebp),%eax
	cmd->type = REDIR;
     3a0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
	cmd->cmd = subcmd;
     3a6:	89 43 04             	mov    %eax,0x4(%ebx)
	cmd->file = file;
     3a9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ac:	89 43 08             	mov    %eax,0x8(%ebx)
	cmd->efile = efile;
     3af:	8b 45 10             	mov    0x10(%ebp),%eax
     3b2:	89 43 0c             	mov    %eax,0xc(%ebx)
	cmd->mode = mode;
     3b5:	8b 45 14             	mov    0x14(%ebp),%eax
     3b8:	89 43 10             	mov    %eax,0x10(%ebx)
	cmd->fd = fd;
     3bb:	8b 45 18             	mov    0x18(%ebp),%eax
     3be:	89 43 14             	mov    %eax,0x14(%ebx)
	return (struct cmd *)cmd;
}
     3c1:	89 d8                	mov    %ebx,%eax
     3c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3c6:	c9                   	leave  
     3c7:	c3                   	ret    
     3c8:	90                   	nop
     3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003d0 <pipecmd>:

struct cmd *pipecmd(struct cmd *left, struct cmd *right)
{
     3d0:	55                   	push   %ebp
     3d1:	89 e5                	mov    %esp,%ebp
     3d3:	53                   	push   %ebx
     3d4:	83 ec 10             	sub    $0x10,%esp
	struct pipecmd *cmd;

	cmd = malloc(sizeof(*cmd));
     3d7:	6a 0c                	push   $0xc
     3d9:	e8 32 0d 00 00       	call   1110 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     3de:	83 c4 0c             	add    $0xc,%esp
     3e1:	6a 0c                	push   $0xc
	cmd = malloc(sizeof(*cmd));
     3e3:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     3e5:	6a 00                	push   $0x0
     3e7:	50                   	push   %eax
     3e8:	e8 b3 07 00 00       	call   ba0 <memset>
	cmd->type = PIPE;
	cmd->left = left;
     3ed:	8b 45 08             	mov    0x8(%ebp),%eax
	cmd->type = PIPE;
     3f0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
	cmd->left = left;
     3f6:	89 43 04             	mov    %eax,0x4(%ebx)
	cmd->right = right;
     3f9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3fc:	89 43 08             	mov    %eax,0x8(%ebx)
	return (struct cmd *)cmd;
}
     3ff:	89 d8                	mov    %ebx,%eax
     401:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     404:	c9                   	leave  
     405:	c3                   	ret    
     406:	8d 76 00             	lea    0x0(%esi),%esi
     409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <listcmd>:

struct cmd *listcmd(struct cmd *left, struct cmd *right)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	53                   	push   %ebx
     414:	83 ec 10             	sub    $0x10,%esp
	struct listcmd *cmd;

	cmd = malloc(sizeof(*cmd));
     417:	6a 0c                	push   $0xc
     419:	e8 f2 0c 00 00       	call   1110 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     41e:	83 c4 0c             	add    $0xc,%esp
     421:	6a 0c                	push   $0xc
	cmd = malloc(sizeof(*cmd));
     423:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     425:	6a 00                	push   $0x0
     427:	50                   	push   %eax
     428:	e8 73 07 00 00       	call   ba0 <memset>
	cmd->type = LIST;
	cmd->left = left;
     42d:	8b 45 08             	mov    0x8(%ebp),%eax
	cmd->type = LIST;
     430:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
	cmd->left = left;
     436:	89 43 04             	mov    %eax,0x4(%ebx)
	cmd->right = right;
     439:	8b 45 0c             	mov    0xc(%ebp),%eax
     43c:	89 43 08             	mov    %eax,0x8(%ebx)
	return (struct cmd *)cmd;
}
     43f:	89 d8                	mov    %ebx,%eax
     441:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     444:	c9                   	leave  
     445:	c3                   	ret    
     446:	8d 76 00             	lea    0x0(%esi),%esi
     449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000450 <backcmd>:

struct cmd *backcmd(struct cmd *subcmd)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	53                   	push   %ebx
     454:	83 ec 10             	sub    $0x10,%esp
	struct backcmd *cmd;

	cmd = malloc(sizeof(*cmd));
     457:	6a 08                	push   $0x8
     459:	e8 b2 0c 00 00       	call   1110 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     45e:	83 c4 0c             	add    $0xc,%esp
     461:	6a 08                	push   $0x8
	cmd = malloc(sizeof(*cmd));
     463:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     465:	6a 00                	push   $0x0
     467:	50                   	push   %eax
     468:	e8 33 07 00 00       	call   ba0 <memset>
	cmd->type = BACK;
	cmd->cmd = subcmd;
     46d:	8b 45 08             	mov    0x8(%ebp),%eax
	cmd->type = BACK;
     470:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
	cmd->cmd = subcmd;
     476:	89 43 04             	mov    %eax,0x4(%ebx)
	return (struct cmd *)cmd;
}
     479:	89 d8                	mov    %ebx,%eax
     47b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     47e:	c9                   	leave  
     47f:	c3                   	ret    

00000480 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	57                   	push   %edi
     484:	56                   	push   %esi
     485:	53                   	push   %ebx
     486:	83 ec 0c             	sub    $0xc,%esp
	char *s;
	int ret;

	s = *ps;
     489:	8b 45 08             	mov    0x8(%ebp),%eax
{
     48c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     48f:	8b 7d 10             	mov    0x10(%ebp),%edi
	s = *ps;
     492:	8b 30                	mov    (%eax),%esi
	while (s < es && strchr(whitespace, *s))
     494:	39 de                	cmp    %ebx,%esi
     496:	72 0f                	jb     4a7 <gettoken+0x27>
     498:	eb 25                	jmp    4bf <gettoken+0x3f>
     49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		s++;
     4a0:	83 c6 01             	add    $0x1,%esi
	while (s < es && strchr(whitespace, *s))
     4a3:	39 f3                	cmp    %esi,%ebx
     4a5:	74 18                	je     4bf <gettoken+0x3f>
     4a7:	0f be 06             	movsbl (%esi),%eax
     4aa:	83 ec 08             	sub    $0x8,%esp
     4ad:	50                   	push   %eax
     4ae:	68 ec 18 00 00       	push   $0x18ec
     4b3:	e8 08 07 00 00       	call   bc0 <strchr>
     4b8:	83 c4 10             	add    $0x10,%esp
     4bb:	85 c0                	test   %eax,%eax
     4bd:	75 e1                	jne    4a0 <gettoken+0x20>
	if (q)
     4bf:	85 ff                	test   %edi,%edi
     4c1:	74 02                	je     4c5 <gettoken+0x45>
		*q = s;
     4c3:	89 37                	mov    %esi,(%edi)
	ret = *s;
     4c5:	0f be 06             	movsbl (%esi),%eax
	switch (*s) {
     4c8:	3c 29                	cmp    $0x29,%al
     4ca:	0f 8f b8 00 00 00    	jg     588 <gettoken+0x108>
     4d0:	3c 28                	cmp    $0x28,%al
     4d2:	0f 8d de 00 00 00    	jge    5b6 <gettoken+0x136>
	ret = *s;
     4d8:	31 ff                	xor    %edi,%edi
     4da:	84 c0                	test   %al,%al
     4dc:	75 42                	jne    520 <gettoken+0xa0>
		while (s < es && !strchr(whitespace, *s)
		       && !strchr(symbols, *s))
			s++;
		break;
	}
	if (eq)
     4de:	8b 55 14             	mov    0x14(%ebp),%edx
     4e1:	85 d2                	test   %edx,%edx
     4e3:	74 05                	je     4ea <gettoken+0x6a>
		*eq = s;
     4e5:	8b 45 14             	mov    0x14(%ebp),%eax
     4e8:	89 30                	mov    %esi,(%eax)

	while (s < es && strchr(whitespace, *s))
     4ea:	39 de                	cmp    %ebx,%esi
     4ec:	72 09                	jb     4f7 <gettoken+0x77>
     4ee:	eb 1f                	jmp    50f <gettoken+0x8f>
		s++;
     4f0:	83 c6 01             	add    $0x1,%esi
	while (s < es && strchr(whitespace, *s))
     4f3:	39 f3                	cmp    %esi,%ebx
     4f5:	74 18                	je     50f <gettoken+0x8f>
     4f7:	0f be 06             	movsbl (%esi),%eax
     4fa:	83 ec 08             	sub    $0x8,%esp
     4fd:	50                   	push   %eax
     4fe:	68 ec 18 00 00       	push   $0x18ec
     503:	e8 b8 06 00 00       	call   bc0 <strchr>
     508:	83 c4 10             	add    $0x10,%esp
     50b:	85 c0                	test   %eax,%eax
     50d:	75 e1                	jne    4f0 <gettoken+0x70>
	*ps = s;
     50f:	8b 45 08             	mov    0x8(%ebp),%eax
     512:	89 30                	mov    %esi,(%eax)
	return ret;
}
     514:	8d 65 f4             	lea    -0xc(%ebp),%esp
     517:	89 f8                	mov    %edi,%eax
     519:	5b                   	pop    %ebx
     51a:	5e                   	pop    %esi
     51b:	5f                   	pop    %edi
     51c:	5d                   	pop    %ebp
     51d:	c3                   	ret    
     51e:	66 90                	xchg   %ax,%ax
     520:	3c 26                	cmp    $0x26,%al
     522:	0f 84 8e 00 00 00    	je     5b6 <gettoken+0x136>
		while (s < es && !strchr(whitespace, *s)
     528:	39 f3                	cmp    %esi,%ebx
     52a:	77 36                	ja     562 <gettoken+0xe2>
	if (eq)
     52c:	8b 45 14             	mov    0x14(%ebp),%eax
     52f:	bf 61 00 00 00       	mov    $0x61,%edi
     534:	85 c0                	test   %eax,%eax
     536:	75 ad                	jne    4e5 <gettoken+0x65>
     538:	eb d5                	jmp    50f <gettoken+0x8f>
     53a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		       && !strchr(symbols, *s))
     540:	0f be 06             	movsbl (%esi),%eax
     543:	83 ec 08             	sub    $0x8,%esp
     546:	50                   	push   %eax
     547:	68 e4 18 00 00       	push   $0x18e4
     54c:	e8 6f 06 00 00       	call   bc0 <strchr>
     551:	83 c4 10             	add    $0x10,%esp
     554:	85 c0                	test   %eax,%eax
     556:	75 1f                	jne    577 <gettoken+0xf7>
			s++;
     558:	83 c6 01             	add    $0x1,%esi
		while (s < es && !strchr(whitespace, *s)
     55b:	39 f3                	cmp    %esi,%ebx
     55d:	74 cd                	je     52c <gettoken+0xac>
     55f:	0f be 06             	movsbl (%esi),%eax
     562:	83 ec 08             	sub    $0x8,%esp
     565:	50                   	push   %eax
     566:	68 ec 18 00 00       	push   $0x18ec
     56b:	e8 50 06 00 00       	call   bc0 <strchr>
     570:	83 c4 10             	add    $0x10,%esp
     573:	85 c0                	test   %eax,%eax
     575:	74 c9                	je     540 <gettoken+0xc0>
		ret = 'a';
     577:	bf 61 00 00 00       	mov    $0x61,%edi
     57c:	e9 5d ff ff ff       	jmp    4de <gettoken+0x5e>
     581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     588:	3c 3e                	cmp    $0x3e,%al
     58a:	75 1c                	jne    5a8 <gettoken+0x128>
		if (*s == '>') {
     58c:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
		s++;
     590:	8d 46 01             	lea    0x1(%esi),%eax
		if (*s == '>') {
     593:	74 3c                	je     5d1 <gettoken+0x151>
		s++;
     595:	89 c6                	mov    %eax,%esi
     597:	bf 3e 00 00 00       	mov    $0x3e,%edi
     59c:	e9 3d ff ff ff       	jmp    4de <gettoken+0x5e>
     5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5a8:	7f 1e                	jg     5c8 <gettoken+0x148>
     5aa:	8d 48 c5             	lea    -0x3b(%eax),%ecx
     5ad:	80 f9 01             	cmp    $0x1,%cl
     5b0:	0f 87 72 ff ff ff    	ja     528 <gettoken+0xa8>
	ret = *s;
     5b6:	0f be f8             	movsbl %al,%edi
		s++;
     5b9:	83 c6 01             	add    $0x1,%esi
		break;
     5bc:	e9 1d ff ff ff       	jmp    4de <gettoken+0x5e>
     5c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5c8:	3c 7c                	cmp    $0x7c,%al
     5ca:	74 ea                	je     5b6 <gettoken+0x136>
     5cc:	e9 57 ff ff ff       	jmp    528 <gettoken+0xa8>
			s++;
     5d1:	83 c6 02             	add    $0x2,%esi
			ret = '+';
     5d4:	bf 2b 00 00 00       	mov    $0x2b,%edi
     5d9:	e9 00 ff ff ff       	jmp    4de <gettoken+0x5e>
     5de:	66 90                	xchg   %ax,%ax

000005e0 <peek>:

int peek(char **ps, char *es, char *toks)
{
     5e0:	55                   	push   %ebp
     5e1:	89 e5                	mov    %esp,%ebp
     5e3:	57                   	push   %edi
     5e4:	56                   	push   %esi
     5e5:	53                   	push   %ebx
     5e6:	83 ec 0c             	sub    $0xc,%esp
     5e9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5ec:	8b 75 0c             	mov    0xc(%ebp),%esi
	char *s;

	s = *ps;
     5ef:	8b 1f                	mov    (%edi),%ebx
	while (s < es && strchr(whitespace, *s))
     5f1:	39 f3                	cmp    %esi,%ebx
     5f3:	72 12                	jb     607 <peek+0x27>
     5f5:	eb 28                	jmp    61f <peek+0x3f>
     5f7:	89 f6                	mov    %esi,%esi
     5f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		s++;
     600:	83 c3 01             	add    $0x1,%ebx
	while (s < es && strchr(whitespace, *s))
     603:	39 de                	cmp    %ebx,%esi
     605:	74 18                	je     61f <peek+0x3f>
     607:	0f be 03             	movsbl (%ebx),%eax
     60a:	83 ec 08             	sub    $0x8,%esp
     60d:	50                   	push   %eax
     60e:	68 ec 18 00 00       	push   $0x18ec
     613:	e8 a8 05 00 00       	call   bc0 <strchr>
     618:	83 c4 10             	add    $0x10,%esp
     61b:	85 c0                	test   %eax,%eax
     61d:	75 e1                	jne    600 <peek+0x20>
	*ps = s;
     61f:	89 1f                	mov    %ebx,(%edi)
	return *s && strchr(toks, *s);
     621:	0f be 13             	movsbl (%ebx),%edx
     624:	31 c0                	xor    %eax,%eax
     626:	84 d2                	test   %dl,%dl
     628:	75 0e                	jne    638 <peek+0x58>
}
     62a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     62d:	5b                   	pop    %ebx
     62e:	5e                   	pop    %esi
     62f:	5f                   	pop    %edi
     630:	5d                   	pop    %ebp
     631:	c3                   	ret    
     632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	return *s && strchr(toks, *s);
     638:	83 ec 08             	sub    $0x8,%esp
     63b:	52                   	push   %edx
     63c:	ff 75 10             	pushl  0x10(%ebp)
     63f:	e8 7c 05 00 00       	call   bc0 <strchr>
     644:	83 c4 10             	add    $0x10,%esp
     647:	85 c0                	test   %eax,%eax
     649:	0f 95 c0             	setne  %al
}
     64c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     64f:	5b                   	pop    %ebx
	return *s && strchr(toks, *s);
     650:	0f b6 c0             	movzbl %al,%eax
}
     653:	5e                   	pop    %esi
     654:	5f                   	pop    %edi
     655:	5d                   	pop    %ebp
     656:	c3                   	ret    
     657:	89 f6                	mov    %esi,%esi
     659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <parseredirs>:
	}
	return cmd;
}

struct cmd *parseredirs(struct cmd *cmd, char **ps, char *es)
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	57                   	push   %edi
     664:	56                   	push   %esi
     665:	53                   	push   %ebx
     666:	83 ec 1c             	sub    $0x1c,%esp
     669:	8b 75 0c             	mov    0xc(%ebp),%esi
     66c:	8b 5d 10             	mov    0x10(%ebp),%ebx
	int tok;
	char *q, *eq;
     66f:	90                   	nop

	while (peek(ps, es, "<>")) {
     670:	83 ec 04             	sub    $0x4,%esp
     673:	68 74 12 00 00       	push   $0x1274
     678:	53                   	push   %ebx
     679:	56                   	push   %esi
     67a:	e8 61 ff ff ff       	call   5e0 <peek>
     67f:	83 c4 10             	add    $0x10,%esp
     682:	85 c0                	test   %eax,%eax
     684:	74 7a                	je     700 <parseredirs+0xa0>
		tok = gettoken(ps, es, 0, 0);
     686:	6a 00                	push   $0x0
     688:	6a 00                	push   $0x0
     68a:	53                   	push   %ebx
     68b:	56                   	push   %esi
     68c:	e8 ef fd ff ff       	call   480 <gettoken>
     691:	89 c7                	mov    %eax,%edi
		if (gettoken(ps, es, &q, &eq) != 'a')
     693:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     696:	50                   	push   %eax
     697:	8d 45 e0             	lea    -0x20(%ebp),%eax
     69a:	50                   	push   %eax
     69b:	53                   	push   %ebx
     69c:	56                   	push   %esi
     69d:	e8 de fd ff ff       	call   480 <gettoken>
     6a2:	83 c4 20             	add    $0x20,%esp
     6a5:	83 f8 61             	cmp    $0x61,%eax
     6a8:	75 61                	jne    70b <parseredirs+0xab>
			panic("missing file for redirection");
        printf(1, "token: %c\n", tok);
     6aa:	83 ec 04             	sub    $0x4,%esp
     6ad:	57                   	push   %edi
     6ae:	68 69 12 00 00       	push   $0x1269
     6b3:	6a 01                	push   $0x1
     6b5:	e8 f6 07 00 00       	call   eb0 <printf>
        switch (tok) {
     6ba:	83 c4 10             	add    $0x10,%esp
     6bd:	83 ff 3c             	cmp    $0x3c,%edi
     6c0:	74 2e                	je     6f0 <parseredirs+0x90>
     6c2:	83 ff 3e             	cmp    $0x3e,%edi
     6c5:	74 05                	je     6cc <parseredirs+0x6c>
     6c7:	83 ff 2b             	cmp    $0x2b,%edi
     6ca:	75 a4                	jne    670 <parseredirs+0x10>
			break;
		case '>':
			cmd = redircmd(cmd, q, eq, O_WRONLY | O_CREATE, 1);
			break;
		case '+': // >>
			cmd = redircmd(cmd, q, eq, O_WRONLY | O_CREATE, 1);
     6cc:	83 ec 0c             	sub    $0xc,%esp
     6cf:	6a 01                	push   $0x1
     6d1:	68 01 02 00 00       	push   $0x201
     6d6:	ff 75 e4             	pushl  -0x1c(%ebp)
     6d9:	ff 75 e0             	pushl  -0x20(%ebp)
     6dc:	ff 75 08             	pushl  0x8(%ebp)
     6df:	e8 9c fc ff ff       	call   380 <redircmd>
			break;
     6e4:	83 c4 20             	add    $0x20,%esp
			cmd = redircmd(cmd, q, eq, O_WRONLY | O_CREATE, 1);
     6e7:	89 45 08             	mov    %eax,0x8(%ebp)
			break;
     6ea:	eb 84                	jmp    670 <parseredirs+0x10>
     6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6f0:	83 ec 0c             	sub    $0xc,%esp
     6f3:	6a 00                	push   $0x0
     6f5:	6a 00                	push   $0x0
     6f7:	eb dd                	jmp    6d6 <parseredirs+0x76>
     6f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		}
	}
	return cmd;
}
     700:	8b 45 08             	mov    0x8(%ebp),%eax
     703:	8d 65 f4             	lea    -0xc(%ebp),%esp
     706:	5b                   	pop    %ebx
     707:	5e                   	pop    %esi
     708:	5f                   	pop    %edi
     709:	5d                   	pop    %ebp
     70a:	c3                   	ret    
			panic("missing file for redirection");
     70b:	83 ec 0c             	sub    $0xc,%esp
     70e:	68 4c 12 00 00       	push   $0x124c
     713:	e8 48 fa ff ff       	call   160 <panic>
     718:	90                   	nop
     719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000720 <parseexec>:
	cmd = parseredirs(cmd, ps, es);
	return cmd;
}

struct cmd *parseexec(char **ps, char *es)
{
     720:	55                   	push   %ebp
     721:	89 e5                	mov    %esp,%ebp
     723:	57                   	push   %edi
     724:	56                   	push   %esi
     725:	53                   	push   %ebx
     726:	83 ec 30             	sub    $0x30,%esp
     729:	8b 75 08             	mov    0x8(%ebp),%esi
     72c:	8b 7d 0c             	mov    0xc(%ebp),%edi
	char *q, *eq;
	int tok, argc;
	struct execcmd *cmd;
	struct cmd *ret;

	if (peek(ps, es, "("))
     72f:	68 77 12 00 00       	push   $0x1277
     734:	57                   	push   %edi
     735:	56                   	push   %esi
     736:	e8 a5 fe ff ff       	call   5e0 <peek>
     73b:	83 c4 10             	add    $0x10,%esp
     73e:	85 c0                	test   %eax,%eax
     740:	0f 85 92 00 00 00    	jne    7d8 <parseexec+0xb8>
     746:	89 c3                	mov    %eax,%ebx
		return parseblock(ps, es);

	ret = execcmd();
     748:	e8 03 fc ff ff       	call   350 <execcmd>
	cmd = (struct execcmd *)ret;

	argc = 0;
	ret = parseredirs(ret, ps, es);
     74d:	83 ec 04             	sub    $0x4,%esp
     750:	57                   	push   %edi
     751:	56                   	push   %esi
     752:	50                   	push   %eax
	ret = execcmd();
     753:	89 45 d0             	mov    %eax,-0x30(%ebp)
	ret = parseredirs(ret, ps, es);
     756:	e8 05 ff ff ff       	call   660 <parseredirs>
     75b:	83 c4 10             	add    $0x10,%esp
     75e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	while (!peek(ps, es, "|)&;")) {
     761:	eb 18                	jmp    77b <parseexec+0x5b>
     763:	90                   	nop
     764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		cmd->argv[argc] = q;
		cmd->eargv[argc] = eq;
		argc++;
		if (argc >= MAXARGS)
			panic("too many args");
		ret = parseredirs(ret, ps, es);
     768:	83 ec 04             	sub    $0x4,%esp
     76b:	57                   	push   %edi
     76c:	56                   	push   %esi
     76d:	ff 75 d4             	pushl  -0x2c(%ebp)
     770:	e8 eb fe ff ff       	call   660 <parseredirs>
     775:	83 c4 10             	add    $0x10,%esp
     778:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	while (!peek(ps, es, "|)&;")) {
     77b:	83 ec 04             	sub    $0x4,%esp
     77e:	68 8e 12 00 00       	push   $0x128e
     783:	57                   	push   %edi
     784:	56                   	push   %esi
     785:	e8 56 fe ff ff       	call   5e0 <peek>
     78a:	83 c4 10             	add    $0x10,%esp
     78d:	85 c0                	test   %eax,%eax
     78f:	75 67                	jne    7f8 <parseexec+0xd8>
		if ((tok = gettoken(ps, es, &q, &eq)) == 0)
     791:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     794:	50                   	push   %eax
     795:	8d 45 e0             	lea    -0x20(%ebp),%eax
     798:	50                   	push   %eax
     799:	57                   	push   %edi
     79a:	56                   	push   %esi
     79b:	e8 e0 fc ff ff       	call   480 <gettoken>
     7a0:	83 c4 10             	add    $0x10,%esp
     7a3:	85 c0                	test   %eax,%eax
     7a5:	74 51                	je     7f8 <parseexec+0xd8>
		if (tok != 'a')
     7a7:	83 f8 61             	cmp    $0x61,%eax
     7aa:	75 6b                	jne    817 <parseexec+0xf7>
		cmd->argv[argc] = q;
     7ac:	8b 45 e0             	mov    -0x20(%ebp),%eax
     7af:	8b 55 d0             	mov    -0x30(%ebp),%edx
     7b2:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
		cmd->eargv[argc] = eq;
     7b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7b9:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
		argc++;
     7bd:	83 c3 01             	add    $0x1,%ebx
		if (argc >= MAXARGS)
     7c0:	83 fb 0a             	cmp    $0xa,%ebx
     7c3:	75 a3                	jne    768 <parseexec+0x48>
			panic("too many args");
     7c5:	83 ec 0c             	sub    $0xc,%esp
     7c8:	68 80 12 00 00       	push   $0x1280
     7cd:	e8 8e f9 ff ff       	call   160 <panic>
     7d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		return parseblock(ps, es);
     7d8:	83 ec 08             	sub    $0x8,%esp
     7db:	57                   	push   %edi
     7dc:	56                   	push   %esi
     7dd:	e8 5e 01 00 00       	call   940 <parseblock>
     7e2:	83 c4 10             	add    $0x10,%esp
     7e5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	}
	cmd->argv[argc] = 0;
	cmd->eargv[argc] = 0;
	return ret;
}
     7e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     7eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7ee:	5b                   	pop    %ebx
     7ef:	5e                   	pop    %esi
     7f0:	5f                   	pop    %edi
     7f1:	5d                   	pop    %ebp
     7f2:	c3                   	ret    
     7f3:	90                   	nop
     7f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	cmd->argv[argc] = 0;
     7f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     7fb:	8d 04 98             	lea    (%eax,%ebx,4),%eax
     7fe:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	cmd->eargv[argc] = 0;
     805:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     80c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     80f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     812:	5b                   	pop    %ebx
     813:	5e                   	pop    %esi
     814:	5f                   	pop    %edi
     815:	5d                   	pop    %ebp
     816:	c3                   	ret    
			panic("syntax");
     817:	83 ec 0c             	sub    $0xc,%esp
     81a:	68 79 12 00 00       	push   $0x1279
     81f:	e8 3c f9 ff ff       	call   160 <panic>
     824:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     82a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000830 <parsepipe>:
{
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	57                   	push   %edi
     834:	56                   	push   %esi
     835:	53                   	push   %ebx
     836:	83 ec 14             	sub    $0x14,%esp
     839:	8b 5d 08             	mov    0x8(%ebp),%ebx
     83c:	8b 75 0c             	mov    0xc(%ebp),%esi
	cmd = parseexec(ps, es);
     83f:	56                   	push   %esi
     840:	53                   	push   %ebx
     841:	e8 da fe ff ff       	call   720 <parseexec>
	if (peek(ps, es, "|")) {
     846:	83 c4 0c             	add    $0xc,%esp
     849:	68 93 12 00 00       	push   $0x1293
	cmd = parseexec(ps, es);
     84e:	89 c7                	mov    %eax,%edi
	if (peek(ps, es, "|")) {
     850:	56                   	push   %esi
     851:	53                   	push   %ebx
     852:	e8 89 fd ff ff       	call   5e0 <peek>
     857:	83 c4 10             	add    $0x10,%esp
     85a:	85 c0                	test   %eax,%eax
     85c:	75 12                	jne    870 <parsepipe+0x40>
}
     85e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     861:	89 f8                	mov    %edi,%eax
     863:	5b                   	pop    %ebx
     864:	5e                   	pop    %esi
     865:	5f                   	pop    %edi
     866:	5d                   	pop    %ebp
     867:	c3                   	ret    
     868:	90                   	nop
     869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		gettoken(ps, es, 0, 0);
     870:	6a 00                	push   $0x0
     872:	6a 00                	push   $0x0
     874:	56                   	push   %esi
     875:	53                   	push   %ebx
     876:	e8 05 fc ff ff       	call   480 <gettoken>
		cmd = pipecmd(cmd, parsepipe(ps, es));
     87b:	58                   	pop    %eax
     87c:	5a                   	pop    %edx
     87d:	56                   	push   %esi
     87e:	53                   	push   %ebx
     87f:	e8 ac ff ff ff       	call   830 <parsepipe>
     884:	89 7d 08             	mov    %edi,0x8(%ebp)
     887:	83 c4 10             	add    $0x10,%esp
     88a:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     88d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     890:	5b                   	pop    %ebx
     891:	5e                   	pop    %esi
     892:	5f                   	pop    %edi
     893:	5d                   	pop    %ebp
		cmd = pipecmd(cmd, parsepipe(ps, es));
     894:	e9 37 fb ff ff       	jmp    3d0 <pipecmd>
     899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008a0 <parseline>:
{
     8a0:	55                   	push   %ebp
     8a1:	89 e5                	mov    %esp,%ebp
     8a3:	57                   	push   %edi
     8a4:	56                   	push   %esi
     8a5:	53                   	push   %ebx
     8a6:	83 ec 14             	sub    $0x14,%esp
     8a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     8ac:	8b 75 0c             	mov    0xc(%ebp),%esi
	cmd = parsepipe(ps, es);
     8af:	56                   	push   %esi
     8b0:	53                   	push   %ebx
     8b1:	e8 7a ff ff ff       	call   830 <parsepipe>
	while (peek(ps, es, "&")) {
     8b6:	83 c4 10             	add    $0x10,%esp
	cmd = parsepipe(ps, es);
     8b9:	89 c7                	mov    %eax,%edi
	while (peek(ps, es, "&")) {
     8bb:	eb 1b                	jmp    8d8 <parseline+0x38>
     8bd:	8d 76 00             	lea    0x0(%esi),%esi
		gettoken(ps, es, 0, 0);
     8c0:	6a 00                	push   $0x0
     8c2:	6a 00                	push   $0x0
     8c4:	56                   	push   %esi
     8c5:	53                   	push   %ebx
     8c6:	e8 b5 fb ff ff       	call   480 <gettoken>
		cmd = backcmd(cmd);
     8cb:	89 3c 24             	mov    %edi,(%esp)
     8ce:	e8 7d fb ff ff       	call   450 <backcmd>
     8d3:	83 c4 10             	add    $0x10,%esp
     8d6:	89 c7                	mov    %eax,%edi
	while (peek(ps, es, "&")) {
     8d8:	83 ec 04             	sub    $0x4,%esp
     8db:	68 95 12 00 00       	push   $0x1295
     8e0:	56                   	push   %esi
     8e1:	53                   	push   %ebx
     8e2:	e8 f9 fc ff ff       	call   5e0 <peek>
     8e7:	83 c4 10             	add    $0x10,%esp
     8ea:	85 c0                	test   %eax,%eax
     8ec:	75 d2                	jne    8c0 <parseline+0x20>
	if (peek(ps, es, ";")) {
     8ee:	83 ec 04             	sub    $0x4,%esp
     8f1:	68 91 12 00 00       	push   $0x1291
     8f6:	56                   	push   %esi
     8f7:	53                   	push   %ebx
     8f8:	e8 e3 fc ff ff       	call   5e0 <peek>
     8fd:	83 c4 10             	add    $0x10,%esp
     900:	85 c0                	test   %eax,%eax
     902:	75 0c                	jne    910 <parseline+0x70>
}
     904:	8d 65 f4             	lea    -0xc(%ebp),%esp
     907:	89 f8                	mov    %edi,%eax
     909:	5b                   	pop    %ebx
     90a:	5e                   	pop    %esi
     90b:	5f                   	pop    %edi
     90c:	5d                   	pop    %ebp
     90d:	c3                   	ret    
     90e:	66 90                	xchg   %ax,%ax
		gettoken(ps, es, 0, 0);
     910:	6a 00                	push   $0x0
     912:	6a 00                	push   $0x0
     914:	56                   	push   %esi
     915:	53                   	push   %ebx
     916:	e8 65 fb ff ff       	call   480 <gettoken>
		cmd = listcmd(cmd, parseline(ps, es));
     91b:	58                   	pop    %eax
     91c:	5a                   	pop    %edx
     91d:	56                   	push   %esi
     91e:	53                   	push   %ebx
     91f:	e8 7c ff ff ff       	call   8a0 <parseline>
     924:	89 7d 08             	mov    %edi,0x8(%ebp)
     927:	83 c4 10             	add    $0x10,%esp
     92a:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     92d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     930:	5b                   	pop    %ebx
     931:	5e                   	pop    %esi
     932:	5f                   	pop    %edi
     933:	5d                   	pop    %ebp
		cmd = listcmd(cmd, parseline(ps, es));
     934:	e9 d7 fa ff ff       	jmp    410 <listcmd>
     939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000940 <parseblock>:
{
     940:	55                   	push   %ebp
     941:	89 e5                	mov    %esp,%ebp
     943:	57                   	push   %edi
     944:	56                   	push   %esi
     945:	53                   	push   %ebx
     946:	83 ec 10             	sub    $0x10,%esp
     949:	8b 5d 08             	mov    0x8(%ebp),%ebx
     94c:	8b 75 0c             	mov    0xc(%ebp),%esi
	if (!peek(ps, es, "("))
     94f:	68 77 12 00 00       	push   $0x1277
     954:	56                   	push   %esi
     955:	53                   	push   %ebx
     956:	e8 85 fc ff ff       	call   5e0 <peek>
     95b:	83 c4 10             	add    $0x10,%esp
     95e:	85 c0                	test   %eax,%eax
     960:	74 4a                	je     9ac <parseblock+0x6c>
	gettoken(ps, es, 0, 0);
     962:	6a 00                	push   $0x0
     964:	6a 00                	push   $0x0
     966:	56                   	push   %esi
     967:	53                   	push   %ebx
     968:	e8 13 fb ff ff       	call   480 <gettoken>
	cmd = parseline(ps, es);
     96d:	58                   	pop    %eax
     96e:	5a                   	pop    %edx
     96f:	56                   	push   %esi
     970:	53                   	push   %ebx
     971:	e8 2a ff ff ff       	call   8a0 <parseline>
	if (!peek(ps, es, ")"))
     976:	83 c4 0c             	add    $0xc,%esp
     979:	68 b3 12 00 00       	push   $0x12b3
	cmd = parseline(ps, es);
     97e:	89 c7                	mov    %eax,%edi
	if (!peek(ps, es, ")"))
     980:	56                   	push   %esi
     981:	53                   	push   %ebx
     982:	e8 59 fc ff ff       	call   5e0 <peek>
     987:	83 c4 10             	add    $0x10,%esp
     98a:	85 c0                	test   %eax,%eax
     98c:	74 2b                	je     9b9 <parseblock+0x79>
	gettoken(ps, es, 0, 0);
     98e:	6a 00                	push   $0x0
     990:	6a 00                	push   $0x0
     992:	56                   	push   %esi
     993:	53                   	push   %ebx
     994:	e8 e7 fa ff ff       	call   480 <gettoken>
	cmd = parseredirs(cmd, ps, es);
     999:	83 c4 0c             	add    $0xc,%esp
     99c:	56                   	push   %esi
     99d:	53                   	push   %ebx
     99e:	57                   	push   %edi
     99f:	e8 bc fc ff ff       	call   660 <parseredirs>
}
     9a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9a7:	5b                   	pop    %ebx
     9a8:	5e                   	pop    %esi
     9a9:	5f                   	pop    %edi
     9aa:	5d                   	pop    %ebp
     9ab:	c3                   	ret    
		panic("parseblock");
     9ac:	83 ec 0c             	sub    $0xc,%esp
     9af:	68 97 12 00 00       	push   $0x1297
     9b4:	e8 a7 f7 ff ff       	call   160 <panic>
		panic("syntax - missing )");
     9b9:	83 ec 0c             	sub    $0xc,%esp
     9bc:	68 a2 12 00 00       	push   $0x12a2
     9c1:	e8 9a f7 ff ff       	call   160 <panic>
     9c6:	8d 76 00             	lea    0x0(%esi),%esi
     9c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009d0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd *nulterminate(struct cmd *cmd)
{
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	53                   	push   %ebx
     9d4:	83 ec 04             	sub    $0x4,%esp
     9d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	struct execcmd *ecmd;
	struct listcmd *lcmd;
	struct pipecmd *pcmd;
	struct redircmd *rcmd;

	if (cmd == 0)
     9da:	85 db                	test   %ebx,%ebx
     9dc:	74 20                	je     9fe <nulterminate+0x2e>
		return 0;

	switch (cmd->type) {
     9de:	83 3b 05             	cmpl   $0x5,(%ebx)
     9e1:	77 1b                	ja     9fe <nulterminate+0x2e>
     9e3:	8b 03                	mov    (%ebx),%eax
     9e5:	ff 24 85 f4 12 00 00 	jmp    *0x12f4(,%eax,4)
     9ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		nulterminate(lcmd->right);
		break;

	case BACK:
		bcmd = (struct backcmd *)cmd;
		nulterminate(bcmd->cmd);
     9f0:	83 ec 0c             	sub    $0xc,%esp
     9f3:	ff 73 04             	pushl  0x4(%ebx)
     9f6:	e8 d5 ff ff ff       	call   9d0 <nulterminate>
		break;
     9fb:	83 c4 10             	add    $0x10,%esp
	}
	return cmd;
}
     9fe:	89 d8                	mov    %ebx,%eax
     a00:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a03:	c9                   	leave  
     a04:	c3                   	ret    
     a05:	8d 76 00             	lea    0x0(%esi),%esi
		nulterminate(lcmd->left);
     a08:	83 ec 0c             	sub    $0xc,%esp
     a0b:	ff 73 04             	pushl  0x4(%ebx)
     a0e:	e8 bd ff ff ff       	call   9d0 <nulterminate>
		nulterminate(lcmd->right);
     a13:	58                   	pop    %eax
     a14:	ff 73 08             	pushl  0x8(%ebx)
     a17:	e8 b4 ff ff ff       	call   9d0 <nulterminate>
}
     a1c:	89 d8                	mov    %ebx,%eax
		break;
     a1e:	83 c4 10             	add    $0x10,%esp
}
     a21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a24:	c9                   	leave  
     a25:	c3                   	ret    
     a26:	8d 76 00             	lea    0x0(%esi),%esi
     a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		for (i = 0; ecmd->argv[i]; i++)
     a30:	8b 4b 04             	mov    0x4(%ebx),%ecx
     a33:	8d 43 08             	lea    0x8(%ebx),%eax
     a36:	85 c9                	test   %ecx,%ecx
     a38:	74 c4                	je     9fe <nulterminate+0x2e>
     a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			*ecmd->eargv[i] = 0;
     a40:	8b 50 24             	mov    0x24(%eax),%edx
     a43:	83 c0 04             	add    $0x4,%eax
     a46:	c6 02 00             	movb   $0x0,(%edx)
		for (i = 0; ecmd->argv[i]; i++)
     a49:	8b 50 fc             	mov    -0x4(%eax),%edx
     a4c:	85 d2                	test   %edx,%edx
     a4e:	75 f0                	jne    a40 <nulterminate+0x70>
}
     a50:	89 d8                	mov    %ebx,%eax
     a52:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a55:	c9                   	leave  
     a56:	c3                   	ret    
     a57:	89 f6                	mov    %esi,%esi
     a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		nulterminate(rcmd->cmd);
     a60:	83 ec 0c             	sub    $0xc,%esp
     a63:	ff 73 04             	pushl  0x4(%ebx)
     a66:	e8 65 ff ff ff       	call   9d0 <nulterminate>
		*rcmd->efile = 0;
     a6b:	8b 43 0c             	mov    0xc(%ebx),%eax
		break;
     a6e:	83 c4 10             	add    $0x10,%esp
		*rcmd->efile = 0;
     a71:	c6 00 00             	movb   $0x0,(%eax)
}
     a74:	89 d8                	mov    %ebx,%eax
     a76:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a79:	c9                   	leave  
     a7a:	c3                   	ret    
     a7b:	90                   	nop
     a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a80 <parsecmd>:
{
     a80:	55                   	push   %ebp
     a81:	89 e5                	mov    %esp,%ebp
     a83:	56                   	push   %esi
     a84:	53                   	push   %ebx
	es = s + strlen(s);
     a85:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a88:	83 ec 0c             	sub    $0xc,%esp
     a8b:	53                   	push   %ebx
     a8c:	e8 df 00 00 00       	call   b70 <strlen>
	cmd = parseline(&s, es);
     a91:	59                   	pop    %ecx
     a92:	5e                   	pop    %esi
	es = s + strlen(s);
     a93:	01 c3                	add    %eax,%ebx
	cmd = parseline(&s, es);
     a95:	8d 45 08             	lea    0x8(%ebp),%eax
     a98:	53                   	push   %ebx
     a99:	50                   	push   %eax
     a9a:	e8 01 fe ff ff       	call   8a0 <parseline>
	peek(&s, es, "");
     a9f:	83 c4 0c             	add    $0xc,%esp
	cmd = parseline(&s, es);
     aa2:	89 c6                	mov    %eax,%esi
	peek(&s, es, "");
     aa4:	8d 45 08             	lea    0x8(%ebp),%eax
     aa7:	68 73 12 00 00       	push   $0x1273
     aac:	53                   	push   %ebx
     aad:	50                   	push   %eax
     aae:	e8 2d fb ff ff       	call   5e0 <peek>
	if (s != es) {
     ab3:	8b 45 08             	mov    0x8(%ebp),%eax
     ab6:	83 c4 10             	add    $0x10,%esp
     ab9:	39 d8                	cmp    %ebx,%eax
     abb:	75 12                	jne    acf <parsecmd+0x4f>
	nulterminate(cmd);
     abd:	83 ec 0c             	sub    $0xc,%esp
     ac0:	56                   	push   %esi
     ac1:	e8 0a ff ff ff       	call   9d0 <nulterminate>
}
     ac6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ac9:	89 f0                	mov    %esi,%eax
     acb:	5b                   	pop    %ebx
     acc:	5e                   	pop    %esi
     acd:	5d                   	pop    %ebp
     ace:	c3                   	ret    
		printf(2, "leftovers: %s\n", s);
     acf:	52                   	push   %edx
     ad0:	50                   	push   %eax
     ad1:	68 b5 12 00 00       	push   $0x12b5
     ad6:	6a 02                	push   $0x2
     ad8:	e8 d3 03 00 00       	call   eb0 <printf>
		panic("syntax");
     add:	c7 04 24 79 12 00 00 	movl   $0x1279,(%esp)
     ae4:	e8 77 f6 ff ff       	call   160 <panic>
     ae9:	66 90                	xchg   %ax,%ax
     aeb:	66 90                	xchg   %ax,%ax
     aed:	66 90                	xchg   %ax,%ax
     aef:	90                   	nop

00000af0 <strcpy>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

char *strcpy(char *s, char *t)
{
     af0:	55                   	push   %ebp
	char *os;

	os = s;
	while ((*s++ = *t++) != 0)
     af1:	31 d2                	xor    %edx,%edx
{
     af3:	89 e5                	mov    %esp,%ebp
     af5:	53                   	push   %ebx
     af6:	8b 45 08             	mov    0x8(%ebp),%eax
     af9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	while ((*s++ = *t++) != 0)
     b00:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
     b04:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     b07:	83 c2 01             	add    $0x1,%edx
     b0a:	84 c9                	test   %cl,%cl
     b0c:	75 f2                	jne    b00 <strcpy+0x10>
		;
	return os;
}
     b0e:	5b                   	pop    %ebx
     b0f:	5d                   	pop    %ebp
     b10:	c3                   	ret    
     b11:	eb 0d                	jmp    b20 <strcmp>
     b13:	90                   	nop
     b14:	90                   	nop
     b15:	90                   	nop
     b16:	90                   	nop
     b17:	90                   	nop
     b18:	90                   	nop
     b19:	90                   	nop
     b1a:	90                   	nop
     b1b:	90                   	nop
     b1c:	90                   	nop
     b1d:	90                   	nop
     b1e:	90                   	nop
     b1f:	90                   	nop

00000b20 <strcmp>:

int strcmp(const char *p, const char *q)
{
     b20:	55                   	push   %ebp
     b21:	89 e5                	mov    %esp,%ebp
     b23:	56                   	push   %esi
     b24:	53                   	push   %ebx
     b25:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b28:	8b 75 0c             	mov    0xc(%ebp),%esi
	while (*p && *p == *q)
     b2b:	0f b6 13             	movzbl (%ebx),%edx
     b2e:	0f b6 0e             	movzbl (%esi),%ecx
     b31:	84 d2                	test   %dl,%dl
     b33:	74 1e                	je     b53 <strcmp+0x33>
     b35:	b8 01 00 00 00       	mov    $0x1,%eax
     b3a:	38 ca                	cmp    %cl,%dl
     b3c:	74 09                	je     b47 <strcmp+0x27>
     b3e:	eb 20                	jmp    b60 <strcmp+0x40>
     b40:	83 c0 01             	add    $0x1,%eax
     b43:	38 ca                	cmp    %cl,%dl
     b45:	75 19                	jne    b60 <strcmp+0x40>
     b47:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     b4b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
     b4f:	84 d2                	test   %dl,%dl
     b51:	75 ed                	jne    b40 <strcmp+0x20>
     b53:	31 c0                	xor    %eax,%eax
		p++, q++;
	return (uchar)*p - (uchar)*q;
}
     b55:	5b                   	pop    %ebx
     b56:	5e                   	pop    %esi
	return (uchar)*p - (uchar)*q;
     b57:	29 c8                	sub    %ecx,%eax
}
     b59:	5d                   	pop    %ebp
     b5a:	c3                   	ret    
     b5b:	90                   	nop
     b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b60:	0f b6 c2             	movzbl %dl,%eax
     b63:	5b                   	pop    %ebx
     b64:	5e                   	pop    %esi
	return (uchar)*p - (uchar)*q;
     b65:	29 c8                	sub    %ecx,%eax
}
     b67:	5d                   	pop    %ebp
     b68:	c3                   	ret    
     b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b70 <strlen>:

uint strlen(char *s)
{
     b70:	55                   	push   %ebp
     b71:	89 e5                	mov    %esp,%ebp
     b73:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	for (n = 0; s[n]; n++)
     b76:	80 39 00             	cmpb   $0x0,(%ecx)
     b79:	74 15                	je     b90 <strlen+0x20>
     b7b:	31 d2                	xor    %edx,%edx
     b7d:	8d 76 00             	lea    0x0(%esi),%esi
     b80:	83 c2 01             	add    $0x1,%edx
     b83:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     b87:	89 d0                	mov    %edx,%eax
     b89:	75 f5                	jne    b80 <strlen+0x10>
		;
	return n;
}
     b8b:	5d                   	pop    %ebp
     b8c:	c3                   	ret    
     b8d:	8d 76 00             	lea    0x0(%esi),%esi
	for (n = 0; s[n]; n++)
     b90:	31 c0                	xor    %eax,%eax
}
     b92:	5d                   	pop    %ebp
     b93:	c3                   	ret    
     b94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ba0 <memset>:

void *memset(void *dst, int c, uint n)
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	57                   	push   %edi
     ba4:	8b 55 08             	mov    0x8(%ebp),%edx
		     : "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
	asm volatile("cld; rep stosb"
     ba7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     baa:	8b 45 0c             	mov    0xc(%ebp),%eax
     bad:	89 d7                	mov    %edx,%edi
     baf:	fc                   	cld    
     bb0:	f3 aa                	rep stos %al,%es:(%edi)
	stosb(dst, c, n);
	return dst;
}
     bb2:	89 d0                	mov    %edx,%eax
     bb4:	5f                   	pop    %edi
     bb5:	5d                   	pop    %ebp
     bb6:	c3                   	ret    
     bb7:	89 f6                	mov    %esi,%esi
     bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bc0 <strchr>:

char *strchr(const char *s, char c)
{
     bc0:	55                   	push   %ebp
     bc1:	89 e5                	mov    %esp,%ebp
     bc3:	53                   	push   %ebx
     bc4:	8b 45 08             	mov    0x8(%ebp),%eax
     bc7:	8b 55 0c             	mov    0xc(%ebp),%edx
	for (; *s; s++)
     bca:	0f b6 18             	movzbl (%eax),%ebx
     bcd:	84 db                	test   %bl,%bl
     bcf:	74 1d                	je     bee <strchr+0x2e>
     bd1:	89 d1                	mov    %edx,%ecx
		if (*s == c)
     bd3:	38 d3                	cmp    %dl,%bl
     bd5:	75 0d                	jne    be4 <strchr+0x24>
     bd7:	eb 17                	jmp    bf0 <strchr+0x30>
     bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     be0:	38 ca                	cmp    %cl,%dl
     be2:	74 0c                	je     bf0 <strchr+0x30>
	for (; *s; s++)
     be4:	83 c0 01             	add    $0x1,%eax
     be7:	0f b6 10             	movzbl (%eax),%edx
     bea:	84 d2                	test   %dl,%dl
     bec:	75 f2                	jne    be0 <strchr+0x20>
			return (char *)s;
	return 0;
     bee:	31 c0                	xor    %eax,%eax
}
     bf0:	5b                   	pop    %ebx
     bf1:	5d                   	pop    %ebp
     bf2:	c3                   	ret    
     bf3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c00 <gets>:

char *gets(char *buf, int max)
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	57                   	push   %edi
     c04:	56                   	push   %esi
	int i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
     c05:	31 f6                	xor    %esi,%esi
{
     c07:	53                   	push   %ebx
     c08:	89 f3                	mov    %esi,%ebx
     c0a:	83 ec 1c             	sub    $0x1c,%esp
     c0d:	8b 7d 08             	mov    0x8(%ebp),%edi
	for (i = 0; i + 1 < max;) {
     c10:	eb 2f                	jmp    c41 <gets+0x41>
     c12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		cc = read(0, &c, 1);
     c18:	83 ec 04             	sub    $0x4,%esp
     c1b:	8d 45 e7             	lea    -0x19(%ebp),%eax
     c1e:	6a 01                	push   $0x1
     c20:	50                   	push   %eax
     c21:	6a 00                	push   $0x0
     c23:	e8 31 01 00 00       	call   d59 <read>
		if (cc < 1)
     c28:	83 c4 10             	add    $0x10,%esp
     c2b:	85 c0                	test   %eax,%eax
     c2d:	7e 1c                	jle    c4b <gets+0x4b>
			break;
		buf[i++] = c;
     c2f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     c33:	83 c7 01             	add    $0x1,%edi
     c36:	88 47 ff             	mov    %al,-0x1(%edi)
		if (c == '\n' || c == '\r')
     c39:	3c 0a                	cmp    $0xa,%al
     c3b:	74 23                	je     c60 <gets+0x60>
     c3d:	3c 0d                	cmp    $0xd,%al
     c3f:	74 1f                	je     c60 <gets+0x60>
	for (i = 0; i + 1 < max;) {
     c41:	83 c3 01             	add    $0x1,%ebx
     c44:	89 fe                	mov    %edi,%esi
     c46:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     c49:	7c cd                	jl     c18 <gets+0x18>
     c4b:	89 f3                	mov    %esi,%ebx
			break;
	}
	buf[i] = '\0';
	return buf;
}
     c4d:	8b 45 08             	mov    0x8(%ebp),%eax
	buf[i] = '\0';
     c50:	c6 03 00             	movb   $0x0,(%ebx)
}
     c53:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c56:	5b                   	pop    %ebx
     c57:	5e                   	pop    %esi
     c58:	5f                   	pop    %edi
     c59:	5d                   	pop    %ebp
     c5a:	c3                   	ret    
     c5b:	90                   	nop
     c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c60:	8b 75 08             	mov    0x8(%ebp),%esi
     c63:	8b 45 08             	mov    0x8(%ebp),%eax
     c66:	01 de                	add    %ebx,%esi
     c68:	89 f3                	mov    %esi,%ebx
	buf[i] = '\0';
     c6a:	c6 03 00             	movb   $0x0,(%ebx)
}
     c6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c70:	5b                   	pop    %ebx
     c71:	5e                   	pop    %esi
     c72:	5f                   	pop    %edi
     c73:	5d                   	pop    %ebp
     c74:	c3                   	ret    
     c75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c80 <stat>:

int stat(char *n, struct stat *st)
{
     c80:	55                   	push   %ebp
     c81:	89 e5                	mov    %esp,%ebp
     c83:	56                   	push   %esi
     c84:	53                   	push   %ebx
	int fd;
	int r;

	fd = open(n, O_RDONLY);
     c85:	83 ec 08             	sub    $0x8,%esp
     c88:	6a 00                	push   $0x0
     c8a:	ff 75 08             	pushl  0x8(%ebp)
     c8d:	e8 ef 00 00 00       	call   d81 <open>
	if (fd < 0)
     c92:	83 c4 10             	add    $0x10,%esp
     c95:	85 c0                	test   %eax,%eax
     c97:	78 27                	js     cc0 <stat+0x40>
		return -1;
	r = fstat(fd, st);
     c99:	83 ec 08             	sub    $0x8,%esp
     c9c:	ff 75 0c             	pushl  0xc(%ebp)
     c9f:	89 c3                	mov    %eax,%ebx
     ca1:	50                   	push   %eax
     ca2:	e8 f2 00 00 00       	call   d99 <fstat>
	close(fd);
     ca7:	89 1c 24             	mov    %ebx,(%esp)
	r = fstat(fd, st);
     caa:	89 c6                	mov    %eax,%esi
	close(fd);
     cac:	e8 b8 00 00 00       	call   d69 <close>
	return r;
     cb1:	83 c4 10             	add    $0x10,%esp
}
     cb4:	8d 65 f8             	lea    -0x8(%ebp),%esp
     cb7:	89 f0                	mov    %esi,%eax
     cb9:	5b                   	pop    %ebx
     cba:	5e                   	pop    %esi
     cbb:	5d                   	pop    %ebp
     cbc:	c3                   	ret    
     cbd:	8d 76 00             	lea    0x0(%esi),%esi
		return -1;
     cc0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     cc5:	eb ed                	jmp    cb4 <stat+0x34>
     cc7:	89 f6                	mov    %esi,%esi
     cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cd0 <atoi>:

int atoi(const char *s)
{
     cd0:	55                   	push   %ebp
     cd1:	89 e5                	mov    %esp,%ebp
     cd3:	53                   	push   %ebx
     cd4:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9')
     cd7:	0f be 11             	movsbl (%ecx),%edx
     cda:	8d 42 d0             	lea    -0x30(%edx),%eax
     cdd:	3c 09                	cmp    $0x9,%al
	n = 0;
     cdf:	b8 00 00 00 00       	mov    $0x0,%eax
	while ('0' <= *s && *s <= '9')
     ce4:	77 1f                	ja     d05 <atoi+0x35>
     ce6:	8d 76 00             	lea    0x0(%esi),%esi
     ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		n = n * 10 + *s++ - '0';
     cf0:	83 c1 01             	add    $0x1,%ecx
     cf3:	8d 04 80             	lea    (%eax,%eax,4),%eax
     cf6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
	while ('0' <= *s && *s <= '9')
     cfa:	0f be 11             	movsbl (%ecx),%edx
     cfd:	8d 5a d0             	lea    -0x30(%edx),%ebx
     d00:	80 fb 09             	cmp    $0x9,%bl
     d03:	76 eb                	jbe    cf0 <atoi+0x20>
	return n;
}
     d05:	5b                   	pop    %ebx
     d06:	5d                   	pop    %ebp
     d07:	c3                   	ret    
     d08:	90                   	nop
     d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d10 <memmove>:

void *memmove(void *vdst, void *vsrc, int n)
{
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	57                   	push   %edi
     d14:	8b 55 10             	mov    0x10(%ebp),%edx
     d17:	8b 45 08             	mov    0x8(%ebp),%eax
     d1a:	56                   	push   %esi
     d1b:	8b 75 0c             	mov    0xc(%ebp),%esi
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0)
     d1e:	85 d2                	test   %edx,%edx
     d20:	7e 13                	jle    d35 <memmove+0x25>
     d22:	01 c2                	add    %eax,%edx
	dst = vdst;
     d24:	89 c7                	mov    %eax,%edi
     d26:	8d 76 00             	lea    0x0(%esi),%esi
     d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		*dst++ = *src++;
     d30:	a4                   	movsb  %ds:(%esi),%es:(%edi)
	while (n-- > 0)
     d31:	39 fa                	cmp    %edi,%edx
     d33:	75 fb                	jne    d30 <memmove+0x20>
	return vdst;
}
     d35:	5e                   	pop    %esi
     d36:	5f                   	pop    %edi
     d37:	5d                   	pop    %ebp
     d38:	c3                   	ret    

00000d39 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     d39:	b8 01 00 00 00       	mov    $0x1,%eax
     d3e:	cd 40                	int    $0x40
     d40:	c3                   	ret    

00000d41 <exit>:
SYSCALL(exit)
     d41:	b8 02 00 00 00       	mov    $0x2,%eax
     d46:	cd 40                	int    $0x40
     d48:	c3                   	ret    

00000d49 <wait>:
SYSCALL(wait)
     d49:	b8 03 00 00 00       	mov    $0x3,%eax
     d4e:	cd 40                	int    $0x40
     d50:	c3                   	ret    

00000d51 <pipe>:
SYSCALL(pipe)
     d51:	b8 04 00 00 00       	mov    $0x4,%eax
     d56:	cd 40                	int    $0x40
     d58:	c3                   	ret    

00000d59 <read>:
SYSCALL(read)
     d59:	b8 05 00 00 00       	mov    $0x5,%eax
     d5e:	cd 40                	int    $0x40
     d60:	c3                   	ret    

00000d61 <write>:
SYSCALL(write)
     d61:	b8 10 00 00 00       	mov    $0x10,%eax
     d66:	cd 40                	int    $0x40
     d68:	c3                   	ret    

00000d69 <close>:
SYSCALL(close)
     d69:	b8 15 00 00 00       	mov    $0x15,%eax
     d6e:	cd 40                	int    $0x40
     d70:	c3                   	ret    

00000d71 <kill>:
SYSCALL(kill)
     d71:	b8 06 00 00 00       	mov    $0x6,%eax
     d76:	cd 40                	int    $0x40
     d78:	c3                   	ret    

00000d79 <exec>:
SYSCALL(exec)
     d79:	b8 07 00 00 00       	mov    $0x7,%eax
     d7e:	cd 40                	int    $0x40
     d80:	c3                   	ret    

00000d81 <open>:
SYSCALL(open)
     d81:	b8 0f 00 00 00       	mov    $0xf,%eax
     d86:	cd 40                	int    $0x40
     d88:	c3                   	ret    

00000d89 <mknod>:
SYSCALL(mknod)
     d89:	b8 11 00 00 00       	mov    $0x11,%eax
     d8e:	cd 40                	int    $0x40
     d90:	c3                   	ret    

00000d91 <unlink>:
SYSCALL(unlink)
     d91:	b8 12 00 00 00       	mov    $0x12,%eax
     d96:	cd 40                	int    $0x40
     d98:	c3                   	ret    

00000d99 <fstat>:
SYSCALL(fstat)
     d99:	b8 08 00 00 00       	mov    $0x8,%eax
     d9e:	cd 40                	int    $0x40
     da0:	c3                   	ret    

00000da1 <link>:
SYSCALL(link)
     da1:	b8 13 00 00 00       	mov    $0x13,%eax
     da6:	cd 40                	int    $0x40
     da8:	c3                   	ret    

00000da9 <mkdir>:
SYSCALL(mkdir)
     da9:	b8 14 00 00 00       	mov    $0x14,%eax
     dae:	cd 40                	int    $0x40
     db0:	c3                   	ret    

00000db1 <chdir>:
SYSCALL(chdir)
     db1:	b8 09 00 00 00       	mov    $0x9,%eax
     db6:	cd 40                	int    $0x40
     db8:	c3                   	ret    

00000db9 <dup>:
SYSCALL(dup)
     db9:	b8 0a 00 00 00       	mov    $0xa,%eax
     dbe:	cd 40                	int    $0x40
     dc0:	c3                   	ret    

00000dc1 <getpid>:
SYSCALL(getpid)
     dc1:	b8 0b 00 00 00       	mov    $0xb,%eax
     dc6:	cd 40                	int    $0x40
     dc8:	c3                   	ret    

00000dc9 <sbrk>:
SYSCALL(sbrk)
     dc9:	b8 0c 00 00 00       	mov    $0xc,%eax
     dce:	cd 40                	int    $0x40
     dd0:	c3                   	ret    

00000dd1 <sleep>:
SYSCALL(sleep)
     dd1:	b8 0d 00 00 00       	mov    $0xd,%eax
     dd6:	cd 40                	int    $0x40
     dd8:	c3                   	ret    

00000dd9 <uptime>:
SYSCALL(uptime)
     dd9:	b8 0e 00 00 00       	mov    $0xe,%eax
     dde:	cd 40                	int    $0x40
     de0:	c3                   	ret    
     de1:	66 90                	xchg   %ax,%ax
     de3:	66 90                	xchg   %ax,%ax
     de5:	66 90                	xchg   %ax,%ax
     de7:	66 90                	xchg   %ax,%ax
     de9:	66 90                	xchg   %ax,%ax
     deb:	66 90                	xchg   %ax,%ax
     ded:	66 90                	xchg   %ax,%ax
     def:	90                   	nop

00000df0 <printint>:
{
	write(fd, &c, 1);
}

static void printint(int fd, int xx, int base, int sgn)
{
     df0:	55                   	push   %ebp
     df1:	89 e5                	mov    %esp,%ebp
     df3:	57                   	push   %edi
     df4:	56                   	push   %esi
     df5:	53                   	push   %ebx
	uint x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
		x = -xx;
     df6:	89 d3                	mov    %edx,%ebx
{
     df8:	83 ec 3c             	sub    $0x3c,%esp
     dfb:	89 45 bc             	mov    %eax,-0x44(%ebp)
	if (sgn && xx < 0) {
     dfe:	85 d2                	test   %edx,%edx
     e00:	0f 89 92 00 00 00    	jns    e98 <printint+0xa8>
     e06:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     e0a:	0f 84 88 00 00 00    	je     e98 <printint+0xa8>
		neg = 1;
     e10:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
		x = -xx;
     e17:	f7 db                	neg    %ebx
	} else {
		x = xx;
	}

	i = 0;
     e19:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     e20:	8d 75 d7             	lea    -0x29(%ebp),%esi
     e23:	eb 08                	jmp    e2d <printint+0x3d>
     e25:	8d 76 00             	lea    0x0(%esi),%esi
	do {
		buf[i++] = digits[x % base];
     e28:	89 7d c4             	mov    %edi,-0x3c(%ebp)
	} while ((x /= base) != 0);
     e2b:	89 c3                	mov    %eax,%ebx
		buf[i++] = digits[x % base];
     e2d:	89 d8                	mov    %ebx,%eax
     e2f:	31 d2                	xor    %edx,%edx
     e31:	8b 7d c4             	mov    -0x3c(%ebp),%edi
     e34:	f7 f1                	div    %ecx
     e36:	83 c7 01             	add    $0x1,%edi
     e39:	0f b6 92 14 13 00 00 	movzbl 0x1314(%edx),%edx
     e40:	88 14 3e             	mov    %dl,(%esi,%edi,1)
	} while ((x /= base) != 0);
     e43:	39 d9                	cmp    %ebx,%ecx
     e45:	76 e1                	jbe    e28 <printint+0x38>
	if (neg)
     e47:	8b 45 c0             	mov    -0x40(%ebp),%eax
     e4a:	85 c0                	test   %eax,%eax
     e4c:	74 0d                	je     e5b <printint+0x6b>
		buf[i++] = '-';
     e4e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
     e53:	ba 2d 00 00 00       	mov    $0x2d,%edx
		buf[i++] = digits[x % base];
     e58:	89 7d c4             	mov    %edi,-0x3c(%ebp)
     e5b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     e5e:	8b 7d bc             	mov    -0x44(%ebp),%edi
     e61:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
     e65:	eb 0f                	jmp    e76 <printint+0x86>
     e67:	89 f6                	mov    %esi,%esi
     e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     e70:	0f b6 13             	movzbl (%ebx),%edx
     e73:	83 eb 01             	sub    $0x1,%ebx
	write(fd, &c, 1);
     e76:	83 ec 04             	sub    $0x4,%esp
     e79:	88 55 d7             	mov    %dl,-0x29(%ebp)
     e7c:	6a 01                	push   $0x1
     e7e:	56                   	push   %esi
     e7f:	57                   	push   %edi
     e80:	e8 dc fe ff ff       	call   d61 <write>

	while (--i >= 0)
     e85:	83 c4 10             	add    $0x10,%esp
     e88:	39 de                	cmp    %ebx,%esi
     e8a:	75 e4                	jne    e70 <printint+0x80>
		putc(fd, buf[i]);
}
     e8c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e8f:	5b                   	pop    %ebx
     e90:	5e                   	pop    %esi
     e91:	5f                   	pop    %edi
     e92:	5d                   	pop    %ebp
     e93:	c3                   	ret    
     e94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	neg = 0;
     e98:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
     e9f:	e9 75 ff ff ff       	jmp    e19 <printint+0x29>
     ea4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     eaa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000eb0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void printf(int fd, char *fmt, ...)
{
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	57                   	push   %edi
     eb4:	56                   	push   %esi
     eb5:	53                   	push   %ebx
     eb6:	83 ec 2c             	sub    $0x2c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
     eb9:	8b 75 0c             	mov    0xc(%ebp),%esi
     ebc:	0f b6 1e             	movzbl (%esi),%ebx
     ebf:	84 db                	test   %bl,%bl
     ec1:	0f 84 b9 00 00 00    	je     f80 <printf+0xd0>
	ap = (uint *)(void *)&fmt + 1;
     ec7:	8d 45 10             	lea    0x10(%ebp),%eax
     eca:	83 c6 01             	add    $0x1,%esi
	write(fd, &c, 1);
     ecd:	8d 7d e7             	lea    -0x19(%ebp),%edi
	state = 0;
     ed0:	31 d2                	xor    %edx,%edx
	ap = (uint *)(void *)&fmt + 1;
     ed2:	89 45 d0             	mov    %eax,-0x30(%ebp)
     ed5:	eb 38                	jmp    f0f <printf+0x5f>
     ed7:	89 f6                	mov    %esi,%esi
     ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     ee0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
     ee3:	ba 25 00 00 00       	mov    $0x25,%edx
			if (c == '%') {
     ee8:	83 f8 25             	cmp    $0x25,%eax
     eeb:	74 17                	je     f04 <printf+0x54>
	write(fd, &c, 1);
     eed:	83 ec 04             	sub    $0x4,%esp
     ef0:	88 5d e7             	mov    %bl,-0x19(%ebp)
     ef3:	6a 01                	push   $0x1
     ef5:	57                   	push   %edi
     ef6:	ff 75 08             	pushl  0x8(%ebp)
     ef9:	e8 63 fe ff ff       	call   d61 <write>
     efe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
			} else {
				putc(fd, c);
     f01:	83 c4 10             	add    $0x10,%esp
     f04:	83 c6 01             	add    $0x1,%esi
	for (i = 0; fmt[i]; i++) {
     f07:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     f0b:	84 db                	test   %bl,%bl
     f0d:	74 71                	je     f80 <printf+0xd0>
		c = fmt[i] & 0xff;
     f0f:	0f be cb             	movsbl %bl,%ecx
     f12:	0f b6 c3             	movzbl %bl,%eax
		if (state == 0) {
     f15:	85 d2                	test   %edx,%edx
     f17:	74 c7                	je     ee0 <printf+0x30>
			}
		} else if (state == '%') {
     f19:	83 fa 25             	cmp    $0x25,%edx
     f1c:	75 e6                	jne    f04 <printf+0x54>
			if (c == 'd') {
     f1e:	83 f8 64             	cmp    $0x64,%eax
     f21:	0f 84 99 00 00 00    	je     fc0 <printf+0x110>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
     f27:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     f2d:	83 f9 70             	cmp    $0x70,%ecx
     f30:	74 5e                	je     f90 <printf+0xe0>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
     f32:	83 f8 73             	cmp    $0x73,%eax
     f35:	0f 84 d5 00 00 00    	je     1010 <printf+0x160>
					s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
     f3b:	83 f8 63             	cmp    $0x63,%eax
     f3e:	0f 84 8c 00 00 00    	je     fd0 <printf+0x120>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
     f44:	83 f8 25             	cmp    $0x25,%eax
     f47:	0f 84 b3 00 00 00    	je     1000 <printf+0x150>
	write(fd, &c, 1);
     f4d:	83 ec 04             	sub    $0x4,%esp
     f50:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     f54:	6a 01                	push   $0x1
     f56:	57                   	push   %edi
     f57:	ff 75 08             	pushl  0x8(%ebp)
     f5a:	e8 02 fe ff ff       	call   d61 <write>
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw
				// attention.
				putc(fd, '%');
				putc(fd, c);
     f5f:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
     f62:	83 c4 0c             	add    $0xc,%esp
     f65:	6a 01                	push   $0x1
     f67:	83 c6 01             	add    $0x1,%esi
     f6a:	57                   	push   %edi
     f6b:	ff 75 08             	pushl  0x8(%ebp)
     f6e:	e8 ee fd ff ff       	call   d61 <write>
	for (i = 0; fmt[i]; i++) {
     f73:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
				putc(fd, c);
     f77:	83 c4 10             	add    $0x10,%esp
			}
			state = 0;
     f7a:	31 d2                	xor    %edx,%edx
	for (i = 0; fmt[i]; i++) {
     f7c:	84 db                	test   %bl,%bl
     f7e:	75 8f                	jne    f0f <printf+0x5f>
		}
	}
}
     f80:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f83:	5b                   	pop    %ebx
     f84:	5e                   	pop    %esi
     f85:	5f                   	pop    %edi
     f86:	5d                   	pop    %ebp
     f87:	c3                   	ret    
     f88:	90                   	nop
     f89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 16, 0);
     f90:	83 ec 0c             	sub    $0xc,%esp
     f93:	b9 10 00 00 00       	mov    $0x10,%ecx
     f98:	6a 00                	push   $0x0
     f9a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     f9d:	8b 45 08             	mov    0x8(%ebp),%eax
     fa0:	8b 13                	mov    (%ebx),%edx
     fa2:	e8 49 fe ff ff       	call   df0 <printint>
				ap++;
     fa7:	89 d8                	mov    %ebx,%eax
     fa9:	83 c4 10             	add    $0x10,%esp
			state = 0;
     fac:	31 d2                	xor    %edx,%edx
				ap++;
     fae:	83 c0 04             	add    $0x4,%eax
     fb1:	89 45 d0             	mov    %eax,-0x30(%ebp)
     fb4:	e9 4b ff ff ff       	jmp    f04 <printf+0x54>
     fb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 10, 1);
     fc0:	83 ec 0c             	sub    $0xc,%esp
     fc3:	b9 0a 00 00 00       	mov    $0xa,%ecx
     fc8:	6a 01                	push   $0x1
     fca:	eb ce                	jmp    f9a <printf+0xea>
     fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, *ap);
     fd0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
	write(fd, &c, 1);
     fd3:	83 ec 04             	sub    $0x4,%esp
				putc(fd, *ap);
     fd6:	8b 03                	mov    (%ebx),%eax
	write(fd, &c, 1);
     fd8:	6a 01                	push   $0x1
				ap++;
     fda:	83 c3 04             	add    $0x4,%ebx
	write(fd, &c, 1);
     fdd:	57                   	push   %edi
     fde:	ff 75 08             	pushl  0x8(%ebp)
				putc(fd, *ap);
     fe1:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
     fe4:	e8 78 fd ff ff       	call   d61 <write>
				ap++;
     fe9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     fec:	83 c4 10             	add    $0x10,%esp
			state = 0;
     fef:	31 d2                	xor    %edx,%edx
     ff1:	e9 0e ff ff ff       	jmp    f04 <printf+0x54>
     ff6:	8d 76 00             	lea    0x0(%esi),%esi
     ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
				putc(fd, c);
    1000:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
    1003:	83 ec 04             	sub    $0x4,%esp
    1006:	e9 5a ff ff ff       	jmp    f65 <printf+0xb5>
    100b:	90                   	nop
    100c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				s = (char *)*ap;
    1010:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1013:	8b 18                	mov    (%eax),%ebx
				ap++;
    1015:	83 c0 04             	add    $0x4,%eax
    1018:	89 45 d0             	mov    %eax,-0x30(%ebp)
				if (s == 0)
    101b:	85 db                	test   %ebx,%ebx
    101d:	74 17                	je     1036 <printf+0x186>
				while (*s != 0) {
    101f:	0f b6 03             	movzbl (%ebx),%eax
			state = 0;
    1022:	31 d2                	xor    %edx,%edx
				while (*s != 0) {
    1024:	84 c0                	test   %al,%al
    1026:	0f 84 d8 fe ff ff    	je     f04 <printf+0x54>
    102c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    102f:	89 de                	mov    %ebx,%esi
    1031:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1034:	eb 1a                	jmp    1050 <printf+0x1a0>
					s = "(null)";
    1036:	bb 0c 13 00 00       	mov    $0x130c,%ebx
				while (*s != 0) {
    103b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    103e:	b8 28 00 00 00       	mov    $0x28,%eax
    1043:	89 de                	mov    %ebx,%esi
    1045:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1048:	90                   	nop
    1049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	write(fd, &c, 1);
    1050:	83 ec 04             	sub    $0x4,%esp
					s++;
    1053:	83 c6 01             	add    $0x1,%esi
    1056:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
    1059:	6a 01                	push   $0x1
    105b:	57                   	push   %edi
    105c:	53                   	push   %ebx
    105d:	e8 ff fc ff ff       	call   d61 <write>
				while (*s != 0) {
    1062:	0f b6 06             	movzbl (%esi),%eax
    1065:	83 c4 10             	add    $0x10,%esp
    1068:	84 c0                	test   %al,%al
    106a:	75 e4                	jne    1050 <printf+0x1a0>
    106c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
			state = 0;
    106f:	31 d2                	xor    %edx,%edx
    1071:	e9 8e fe ff ff       	jmp    f04 <printf+0x54>
    1076:	66 90                	xchg   %ax,%ax
    1078:	66 90                	xchg   %ax,%ax
    107a:	66 90                	xchg   %ax,%ax
    107c:	66 90                	xchg   %ax,%ax
    107e:	66 90                	xchg   %ax,%ax

00001080 <free>:

static Header base;
static Header *freep;

void free(void *ap)
{
    1080:	55                   	push   %ebp
	Header *bp, *p;

	bp = (Header *)ap - 1;
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1081:	a1 64 19 00 00       	mov    0x1964,%eax
{
    1086:	89 e5                	mov    %esp,%ebp
    1088:	57                   	push   %edi
    1089:	56                   	push   %esi
    108a:	53                   	push   %ebx
    108b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    108e:	8b 10                	mov    (%eax),%edx
	bp = (Header *)ap - 1;
    1090:	8d 4b f8             	lea    -0x8(%ebx),%ecx
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1093:	39 c8                	cmp    %ecx,%eax
    1095:	73 19                	jae    10b0 <free+0x30>
    1097:	89 f6                	mov    %esi,%esi
    1099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    10a0:	39 d1                	cmp    %edx,%ecx
    10a2:	72 14                	jb     10b8 <free+0x38>
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10a4:	39 d0                	cmp    %edx,%eax
    10a6:	73 10                	jae    10b8 <free+0x38>
{
    10a8:	89 d0                	mov    %edx,%eax
    10aa:	8b 10                	mov    (%eax),%edx
	for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10ac:	39 c8                	cmp    %ecx,%eax
    10ae:	72 f0                	jb     10a0 <free+0x20>
		if (p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10b0:	39 d0                	cmp    %edx,%eax
    10b2:	72 f4                	jb     10a8 <free+0x28>
    10b4:	39 d1                	cmp    %edx,%ecx
    10b6:	73 f0                	jae    10a8 <free+0x28>
			break;
	if (bp + bp->s.size == p->s.ptr) {
    10b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    10bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    10be:	39 fa                	cmp    %edi,%edx
    10c0:	74 1e                	je     10e0 <free+0x60>
		bp->s.size += p->s.ptr->s.size;
		bp->s.ptr = p->s.ptr->s.ptr;
	} else
		bp->s.ptr = p->s.ptr;
    10c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
	if (p + p->s.size == bp) {
    10c5:	8b 50 04             	mov    0x4(%eax),%edx
    10c8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    10cb:	39 f1                	cmp    %esi,%ecx
    10cd:	74 28                	je     10f7 <free+0x77>
		p->s.size += bp->s.size;
		p->s.ptr = bp->s.ptr;
	} else
		p->s.ptr = bp;
    10cf:	89 08                	mov    %ecx,(%eax)
	freep = p;
}
    10d1:	5b                   	pop    %ebx
	freep = p;
    10d2:	a3 64 19 00 00       	mov    %eax,0x1964
}
    10d7:	5e                   	pop    %esi
    10d8:	5f                   	pop    %edi
    10d9:	5d                   	pop    %ebp
    10da:	c3                   	ret    
    10db:	90                   	nop
    10dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		bp->s.size += p->s.ptr->s.size;
    10e0:	03 72 04             	add    0x4(%edx),%esi
    10e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
		bp->s.ptr = p->s.ptr->s.ptr;
    10e6:	8b 10                	mov    (%eax),%edx
    10e8:	8b 12                	mov    (%edx),%edx
    10ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
	if (p + p->s.size == bp) {
    10ed:	8b 50 04             	mov    0x4(%eax),%edx
    10f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    10f3:	39 f1                	cmp    %esi,%ecx
    10f5:	75 d8                	jne    10cf <free+0x4f>
		p->s.size += bp->s.size;
    10f7:	03 53 fc             	add    -0x4(%ebx),%edx
	freep = p;
    10fa:	a3 64 19 00 00       	mov    %eax,0x1964
		p->s.size += bp->s.size;
    10ff:	89 50 04             	mov    %edx,0x4(%eax)
		p->s.ptr = bp->s.ptr;
    1102:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1105:	89 10                	mov    %edx,(%eax)
}
    1107:	5b                   	pop    %ebx
    1108:	5e                   	pop    %esi
    1109:	5f                   	pop    %edi
    110a:	5d                   	pop    %ebp
    110b:	c3                   	ret    
    110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001110 <malloc>:
	free((void *)(hp + 1));
	return freep;
}

void *malloc(uint nbytes)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	57                   	push   %edi
    1114:	56                   	push   %esi
    1115:	53                   	push   %ebx
    1116:	83 ec 1c             	sub    $0x1c,%esp
	Header *p, *prevp;
	uint nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
    1119:	8b 45 08             	mov    0x8(%ebp),%eax
	if ((prevp = freep) == 0) {
    111c:	8b 3d 64 19 00 00    	mov    0x1964,%edi
	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
    1122:	8d 70 07             	lea    0x7(%eax),%esi
    1125:	c1 ee 03             	shr    $0x3,%esi
    1128:	83 c6 01             	add    $0x1,%esi
	if ((prevp = freep) == 0) {
    112b:	85 ff                	test   %edi,%edi
    112d:	0f 84 ad 00 00 00    	je     11e0 <malloc+0xd0>
		base.s.ptr = freep = prevp = &base;
		base.s.size = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
    1133:	8b 17                	mov    (%edi),%edx
		if (p->s.size >= nunits) {
    1135:	8b 4a 04             	mov    0x4(%edx),%ecx
    1138:	39 ce                	cmp    %ecx,%esi
    113a:	76 72                	jbe    11ae <malloc+0x9e>
    113c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1142:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1147:	0f 43 de             	cmovae %esi,%ebx
	p = sbrk(nu * sizeof(Header));
    114a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    1151:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1154:	eb 1b                	jmp    1171 <malloc+0x61>
    1156:	8d 76 00             	lea    0x0(%esi),%esi
    1159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
    1160:	8b 02                	mov    (%edx),%eax
		if (p->s.size >= nunits) {
    1162:	8b 48 04             	mov    0x4(%eax),%ecx
    1165:	39 f1                	cmp    %esi,%ecx
    1167:	73 4f                	jae    11b8 <malloc+0xa8>
    1169:	8b 3d 64 19 00 00    	mov    0x1964,%edi
    116f:	89 c2                	mov    %eax,%edx
				p->s.size = nunits;
			}
			freep = prevp;
			return (void *)(p + 1);
		}
		if (p == freep)
    1171:	39 d7                	cmp    %edx,%edi
    1173:	75 eb                	jne    1160 <malloc+0x50>
	p = sbrk(nu * sizeof(Header));
    1175:	83 ec 0c             	sub    $0xc,%esp
    1178:	ff 75 e4             	pushl  -0x1c(%ebp)
    117b:	e8 49 fc ff ff       	call   dc9 <sbrk>
	if (p == (char *)-1)
    1180:	83 c4 10             	add    $0x10,%esp
    1183:	83 f8 ff             	cmp    $0xffffffff,%eax
    1186:	74 1c                	je     11a4 <malloc+0x94>
	hp->s.size = nu;
    1188:	89 58 04             	mov    %ebx,0x4(%eax)
	free((void *)(hp + 1));
    118b:	83 ec 0c             	sub    $0xc,%esp
    118e:	83 c0 08             	add    $0x8,%eax
    1191:	50                   	push   %eax
    1192:	e8 e9 fe ff ff       	call   1080 <free>
	return freep;
    1197:	8b 15 64 19 00 00    	mov    0x1964,%edx
			if ((p = morecore(nunits)) == 0)
    119d:	83 c4 10             	add    $0x10,%esp
    11a0:	85 d2                	test   %edx,%edx
    11a2:	75 bc                	jne    1160 <malloc+0x50>
				return 0;
	}
}
    11a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
				return 0;
    11a7:	31 c0                	xor    %eax,%eax
}
    11a9:	5b                   	pop    %ebx
    11aa:	5e                   	pop    %esi
    11ab:	5f                   	pop    %edi
    11ac:	5d                   	pop    %ebp
    11ad:	c3                   	ret    
		if (p->s.size >= nunits) {
    11ae:	89 d0                	mov    %edx,%eax
    11b0:	89 fa                	mov    %edi,%edx
    11b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			if (p->s.size == nunits)
    11b8:	39 ce                	cmp    %ecx,%esi
    11ba:	74 54                	je     1210 <malloc+0x100>
				p->s.size -= nunits;
    11bc:	29 f1                	sub    %esi,%ecx
    11be:	89 48 04             	mov    %ecx,0x4(%eax)
				p += p->s.size;
    11c1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
				p->s.size = nunits;
    11c4:	89 70 04             	mov    %esi,0x4(%eax)
			freep = prevp;
    11c7:	89 15 64 19 00 00    	mov    %edx,0x1964
}
    11cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
			return (void *)(p + 1);
    11d0:	83 c0 08             	add    $0x8,%eax
}
    11d3:	5b                   	pop    %ebx
    11d4:	5e                   	pop    %esi
    11d5:	5f                   	pop    %edi
    11d6:	5d                   	pop    %ebp
    11d7:	c3                   	ret    
    11d8:	90                   	nop
    11d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		base.s.ptr = freep = prevp = &base;
    11e0:	c7 05 64 19 00 00 68 	movl   $0x1968,0x1964
    11e7:	19 00 00 
		base.s.size = 0;
    11ea:	bf 68 19 00 00       	mov    $0x1968,%edi
		base.s.ptr = freep = prevp = &base;
    11ef:	c7 05 68 19 00 00 68 	movl   $0x1968,0x1968
    11f6:	19 00 00 
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
    11f9:	89 fa                	mov    %edi,%edx
		base.s.size = 0;
    11fb:	c7 05 6c 19 00 00 00 	movl   $0x0,0x196c
    1202:	00 00 00 
		if (p->s.size >= nunits) {
    1205:	e9 32 ff ff ff       	jmp    113c <malloc+0x2c>
    120a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
				prevp->s.ptr = p->s.ptr;
    1210:	8b 08                	mov    (%eax),%ecx
    1212:	89 0a                	mov    %ecx,(%edx)
    1214:	eb b1                	jmp    11c7 <malloc+0xb7>
