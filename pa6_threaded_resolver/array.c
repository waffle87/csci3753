// Jack Sangdahl
// CSCI3753 SP24
// PA6 Threaded Resolver
#include "array.h"

int queue_init(queue *q, int queue_size) {
  q->data = malloc(queue_size * sizeof(node));
  q->maxsize = queue_size;
  q->front = 0;
  q->back = -1;
  q->size = 0;
  return EXIT_SUCCESS;
}

int queue_size(queue *q) { return q->size; }

bool queue_full(queue *q) { return (q->size == q->maxsize); }

int queue_push(queue *q, void *element) {
  if (queue_full(q)) {
    fprintf(stderr, "push error: queue full\n");
    return EXIT_FAILURE;
  }
  q->back = (q->back + 1) % q->maxsize;
  q->data[q->back].value = element;
  q->size++;
  return EXIT_SUCCESS;
}

void *queue_pop(queue *q) {
  if (!queue_size(q)) {
    fprintf(stderr, "pop error: queue empty\n");
    return NULL;
  }
  void *value = q->data[q->front].value;
  q->data[q->front].value = NULL;
  q->front = (q->front + 1) % q->maxsize;
  q->size--;
  return value;
}

void queue_free(queue *q) {
  while (q->size > 0) {
    void *val = queue_pop(q);
    free(val);
  }
  free(q->data);
}
