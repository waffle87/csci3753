#include <linux/kernel.h>
#include <linux/linkage.h>
#include <linux/syscalls.h>

SYSCALL_DEFINE3(csci3753_mult, int, number1, int, number2, long *, result) {
  printk("Numbers being multiplied:\n");
  printk("Number 1: %d\n", number1);
  printk("Number 2: %d\n", number2);
  long product = number1 * number2;
  printk("Result: %ld\n", product);
  return copy_to_user(result, &product, sizeof(long)) ? -EFAULT : 0;
}
