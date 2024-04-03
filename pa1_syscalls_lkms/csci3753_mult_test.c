#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#define SYS_CALL_NUM 463

int main(int argc, char **argv) {
  if (argc < 3)
    exit(-1);
  int a = atoi(argv[1]), b = atoi(argv[2]);
  long c, res = syscall(SYS_CALL_NUM, a, b, &c);
  printf("%d * %d = %ld\n", a, b, c);
  exit(res);
}
