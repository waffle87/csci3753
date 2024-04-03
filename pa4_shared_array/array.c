// Jack Sangdahl
// CSCI3753 SP24
// PA4 Shared Array
#include "array.h"

int array_init(array *s) {
  s->top = 0;
  s->array = (char **)malloc(ARRAY_SIZE * sizeof(char *));
  for (int i = 0; i < ARRAY_SIZE; i++)
    s->array[i] = (char *)malloc(MAX_NAME_LENGTH * sizeof(char));
  sem_init(&s->mutex, 0, 1);
  sem_init(&s->space, 0, ARRAY_SIZE);
  sem_init(&s->items, 0, 0);
  return 0;
}

int array_put(array *s, char *hostname) {
  if (s->top == ARRAY_SIZE - 1) {
    printf("ERROR: stack full\n");
    return -1;
  }
  if (strlen(hostname) > MAX_NAME_LENGTH) {
    printf("ERROR: %s size > %d\n", hostname, MAX_NAME_LENGTH);
    return -1;
  }
  sem_wait(&s->space);
  sem_wait(&s->mutex);
  strcpy(s->array[s->top++], hostname);
  sem_post(&s->mutex);
  sem_post(&s->items);
  return 0;
}

int array_get(array *s, char **hostname) {
  if (!s->top) {
    printf("ERROR: stack empty\n");
    return -1;
  }
  sem_wait(&s->items);
  sem_wait(&s->mutex);
  *hostname = (char *)malloc(MAX_NAME_LENGTH * sizeof(char));
  strcpy(*hostname, s->array[--s->top]);
  sem_post(&s->mutex);
  sem_post(&s->space);
  return 0;
}

void array_free(array *s) {
  for (int i = 0; i < ARRAY_SIZE; i++)
    free(s->array[i]);
  free(s->array);
  sem_destroy(&s->mutex);
  sem_destroy(&s->space);
  sem_destroy(&s->items);
}
