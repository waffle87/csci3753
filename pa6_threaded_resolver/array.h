// Jack Sangdahl
// CSCI3753 SP24
// PA6 Threaded Resolver
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct {
  void *value;
} node;

typedef struct {
  node *data;
  int size;
  int maxsize;
  int front;
  int back;
} queue;

/**
 * @brief initialise the queue
 * @param q
 * @param size
 * @return int
 */
int queue_init(queue *q, int size);

/**
 * @brief return size of queue
 * @param q
 * @return int
 */
int queue_size(queue *q);

/**
 * @brief return true if que size is
 * greater than ARRAY_SIZE. false otherwise
 * @param q
 * @return bool
 */
bool queue_full(queue *q);

/**
 * @brief add element to fifo queue. block when full
 * @param q
 * @param val
 * @return int
 */
int queue_push(queue *q, void *val);

/**
 * @brief return top element of queue in fifo order
 * return null pointer if queue empty
 * @param q
 */
void *queue_pop(queue *q);

/**
 * @brief free queue's resources
 * @param q
 */
void queue_free(queue *q);
