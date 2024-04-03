// Jack Sangdahl
// CSCI3753 SP24
// PA4 Shared Array
#include <semaphore.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ARRAY_SIZE 8       // number of hostnames in data/ is 618
#define MAX_NAME_LENGTH 16 // longest string length in data/

typedef struct {
  char **array;
  uint8_t top;
  sem_t mutex;
  sem_t space;
  sem_t items;
} array;

/**
 * @brief initialise the array
 * @param s
 * @return int
 */
int array_init(array *s);

/**
 * @brief place element into array. block when full
 * @param s
 * @param hostname
 * @return int
 */
int array_put(array *s, char *hostname);

/**
 * @brief remove element from the array. block when empty
 * @param s
 * @param hostname
 * @return int
 */
int array_get(array *s, char **hostname);

/**
 * @brief free array's resources
 * @param s
 */
void array_free(array *s);
