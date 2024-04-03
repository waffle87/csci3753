#include <unistd.h>
#include <stdlib.h>
#define SYS_CALL_NUM 462

int main() {
  long res = syscall(SYS_CALL_NUM);
  exit(res);
}
