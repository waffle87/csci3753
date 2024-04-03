## PA1 - Syscalls & LKMs
### Adding a system call (6.6.11)
create file `arch/x86/kernel/helloworld.c` and note the following
* `kernel.h` header contains many constants and functions in kernel programming
* `linkage.h` header defines macros used to keep stack safe & orderly
* `syscalls.h` header contains `SYSCALL_DEFINEn` macros where `n` is the number of parameters being passed to system call
* `printk()` is used to print kernel messages (eg. dmesg)

add `obj-y+=helloworld.o` to `arch/x86/kernel/Makefile` to link object 
file of our system call. next, add system call to table. edit
`arch/x86/entry/syscalls/syscall_64.tbl` with
`454 common helloworld sys_helloworld`. a prototype for our system call
is needed. add `asmlinkage long sys_helloworld(void);` to
`include/linux/syscalls.h`. all system calls are prefixed with `sys_`
by convention. `asmlinkage` keyword tells the compiler that the function
should not expect to find any of its arguments in registers, but only
on the cpu's stack (see `linkage.h` file)

### Writing a test program
an additional userspace program is needed to test the new system call.
the first argument to `syscall()` function is our system call number,
and any additional arguments would be passed system call function.
returns 0 on success, and -1 otherwise. , then compile and test program
and view the output of `dmesg` and look for our `print()` contents
```sh
cc hellotest.c
./a.out
echo $?
0 # no error
```

### Writing a second system call
create file `arch/x86/kernel/csci3753_mult.c` and write system call number
455 named `csci3753_mult()` and define two integer arguments: `num1, num2`
and a pointer to the integer integer result (long). the system call must
do the following:
* use `printk()` to log the numbers being multiplied
* multiply those two numbers
* use `printk()` to log the result
* store the result in userspace via the return pointer
  * account for the fact that kernel cannot directly write to userspace memory
* return appropriate status (0 for success, non-zero for failure)

again, a userspace program will be needed to test the system call's
functionality. see `csci3753_mult_test.c` file and use above steps.

### Loadable Kernel Modules (LKMs)
allow for code to be loaded into kernel at runtime without the need to
recompile and reboot kernel. `CONFIG_MODULES` must be built and
configured. note the following about `modules/hellomodule.c`:
* `linux/{init.h, module.h}` contain library headers for module initialisation
* `module_init()` and `module_exit()` bind two functions, `hello_init()`
and `hello_exit()` to be executed when the module is loaded/unloaded

after compilation (see `modules/Makefile`), the new `*.ko` moddule file
can be loaded with `insmod hellomodule.ko`, and unloaded using
`rmmod hellomodule.ko`. now, view output of dmesg to see what's been
printed.
