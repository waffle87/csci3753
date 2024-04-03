## PA4 - Shared Array
### introduction
you will build a thread-safe shared array that will then be used in pa6 to create a multi-threaded
dns resolver program. to help organise your code, it is required that a separate module be created
to solely deal with the shared array. the modularisation will allow you to build and test a shared
array abstraction without having to worry about details of pa6 solution. this approach is an
application of principal of separation of concerns. in order to illustrate how to build a program
as separate modules, we'll need to review the relationship between an interface and implementation

### interface & implementation
when developing an abstraction, we usually start with the proposed interface. an interface is
similar to a contract, in this case between the users of an abstraction and the developer of the
code that implements that abstraction. as an example, consider the following method prototypes
that comprise the interface for a stack that stores integers
```c
int  stack_init(stack *s);                  // initialize the stack
int  stack_push(stack *s, int element);     // place element on the top of the stack
int  stack_pop (stack *s, int *element);    // remove element from the top of the stack
void stack_free(stack *s);                  // free the stack's resources
```

in c, interfaces are defined in a standalone header file, so here's a more complete version of
`stack.h`, including the definition of a struct to hold our data:
```c
#ifndef STACK_H
#define STACK_H

#define STACK_SIZE 10                       // max elements in stack

typedef struct {
    int array[STACK_SIZE];                  // storage array for integers
    int top;                                // array index indicating where the top is
} stack;

int  stack_init(stack *s);                  // init the stack
int  stack_push(stack *s, int element);     // place element on the top of the stack
int  stack_pop (stack *s, int *element);    // remove element from the top of the stack
void stack_free(stack *s);                  // free the stack's resources

#endif
```

notice that each method of our interface, other than `stack_free()` returns an integer to indicate
the status of the operation. generally, a zero return value means success, and anything else means
a failure. also note that `stack_pop()` passes the popped value back to the caller via a reference
the implementation (executable code) is contained in a c source file of the same name, `stack.c`
```c
#include "stack.h"

int stack_init(stack *s) {                  // init the stack
    s->top = 0;
    return 0;
}

int stack_push(stack *s, int element) {     // place element on the top of the stack
    if (s->top >= STACK_SIZE) return -1;    // return failed if the stack is full
    s->array[s->top++] = element;
    return 0;
}

int stack_pop(stack *s, int *element) {     // remove element from the top of the stack
    if (s->top < 1) return -1;              // return failed if the stack is empty
    *element = s->array[--s->top];
    return 0;
}

void stack_free(stack *s) {                 // free the stack's resources
}
```

we can then test our code by writing a small program, `test.c`, that calls each of the methods of
our stack implementation:
```c
#include "stack.h"
#include <stdlib.h>
#include <stdio.h>

int main() {
    stack my_stack;
    int i;

    if (stack_init(&my_stack) < 0) exit(-1);                // init stack, exit if failed
    while (stack_push(&my_stack, rand() % 10) == 0);        // push random numbers until full
    while (stack_pop(&my_stack, &i) == 0) printf("%d ", i); // pop and print until empty
    stack_free(&my_stack);                                  // destroy stack
    exit(0);
}
```

compile and test:
```shell
$ cc test.c stack.c
./a.out
1 9 2 6 5 3 5 7 6 3
```

### shared array
your thread-safe shared array will require you to implement a solution to the bounded buffer
problem as discussed in lecture and textbook. the shared array must be built on top of one or
more contiguous linear arrays of memory. you can organise this array as fifo, circular queue,
or lifo. we will not accept solutions that rely on linked lists, trees, dictionaries, etc. your
array should implement at minimum, the following interface
```c
int  array_init(array *s);                   // initialize the array
int  array_put (array *s, char *hostname);   // place element into the array, block when full
int  array_get (array *s, char **hostname);  // remove element from the array, block when empty
void array_free(array *s);                   // free the array's resources
```
this interface defines a shared array that stores hostnames as c strings. the size of your array
and the maximum size string that your array can handle should be defined by a macro in `array.h`:
```c
#define ARRAY_SIZE 8
#define MAX_NAME_LENGTH xxx
```
you'll need to determine an appropriate maximum hostname length based on the input data provided
in [pa4.zip](pa4.zip) and how you decide to implement the shared buffer. unlike above example, your shared
array must **incorporate some sort synchronisation and/or signaling mechanisms** (mutexes, semaphores,
condition variables, etc.) to ensure there are no race conditions or busy waiting. while c does
not implement them directly, you can consider designing something that works like a monitor. you
can use the same concepts used for monitors to ensure that race conditions don't creep into your
solution. you should also consider writing some unit tests that verify the functionality of your
array. your tests will need to exercise the array in such a way that you're ensuring thread safety.
generally, the way to do this is use `pthread_create()` to start a number of simultaneous threads,
each of which either put or get data to your shared array, multiple times.

### submission
due date: **03.03.2024 23:59**
* `array.h` header containing prototypes for your shared array interface definition
* `array.c` source containing the implementation of your shared array
