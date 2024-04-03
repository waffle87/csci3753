// Jack Sangdahl
// CSCI3753 SP24
// PA4 Shared Array
#include "array.h"
#include <dirent.h>
#include <pthread.h>
#include <stdio.h>
#define MAX_FILE_SIZE 255
#define MAX_FILE_COUNT 30
#define NUM_THREADS 10

array stack;
char *data, **hostnames;

void gen_hostnames(char **hostnames) {
  DIR *dptr = opendir("data");
  struct dirent *entry;
  char filenames[MAX_FILE_COUNT][MAX_FILE_SIZE];
  uint8_t file_count = 0;
  while ((entry = readdir(dptr)))
    if (strstr(entry->d_name, ".txt")) {
      strncpy(filenames[file_count], entry->d_name, MAX_FILE_SIZE);
      file_count++;
      if (file_count >= MAX_FILE_COUNT)
        break;
    }
  closedir(dptr);
  for (uint8_t i = 0; i < MAX_FILE_COUNT; i++) {
    char *curr_file = (char *)malloc(strlen(filenames[i] + 6));
    strcpy(curr_file, "data/");
    strcat(curr_file, filenames[i]);
    FILE *fptr = fopen(curr_file, "r");
    char *buffer = (char *)malloc(sizeof(char) * MAX_NAME_LENGTH);
    uint8_t hostname_count = 0;
    while (fgets(buffer, sizeof(buffer), fptr)) {
      hostnames[hostname_count] =
          (char *)malloc((strlen(buffer)) * sizeof(char));
      strcpy(hostnames[hostname_count], buffer);
      hostname_count++;
    }
    free(buffer), free(curr_file);
    fclose(fptr);
  }
}

void *thread_produce(void *a) {
  for (uint8_t i = 0; i < ARRAY_SIZE; i++)
    array_put(&stack, hostnames[i]);
  return NULL;
}

void *thread_consume(void *a) {
  for (uint8_t i = 0; i < ARRAY_SIZE; i++)
    array_get(&stack, &data);
  return NULL;
}

int main(int argc, char **argv) {
  pthread_t *produce = malloc(NUM_THREADS * sizeof(pthread_t));
  pthread_t *consume = malloc(NUM_THREADS * sizeof(pthread_t));
  hostnames = (char **)malloc(sizeof(char *) * MAX_FILE_SIZE);
  gen_hostnames(hostnames);
  for (int i = 0; i < ARRAY_SIZE; i++)
    printf("%s\n", hostnames[i]);
  array_init(&stack);
  for (uint8_t i = 0; i < NUM_THREADS; i++) {
    pthread_create(&produce[i], NULL, thread_produce, &stack);
    pthread_create(&consume[i], NULL, thread_consume, &stack);
  }
  for (uint8_t i = 0; i < NUM_THREADS; i++) {
    pthread_join(produce[i], NULL);
    pthread_join(consume[i], NULL);
  }
  free(produce), free(consume), free(hostnames);
  array_free(&stack);
  return 0;
}
