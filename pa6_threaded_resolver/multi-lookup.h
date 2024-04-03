// Jack Sangdahl
// CSCI3753 SP24
// PA6 Threaded Resolver
#include "array.h"
#include "util.h"
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/syscall.h>
#include <sys/time.h>
#include <unistd.h>

#define ARRAY_SIZE 8
#define MAX_INPUT_FILES 100
#define MAX_REQUESTER_THREADS 10
#define MAX_RESOLVER_THREADS 10
#define MAX_NAME_LENGTH 16
#define MAX_IP_LENGTH INET6_ADDRSTRLEN
#define ELAPSED_SECONDS(a, b)                                                  \
  ((double)(b.tv_usec - a.tv_usec) / 1000000 + (double)(b.tv_sec - a.tv_sec))

void *request(void *data);
void *resolve(void *data);

typedef struct {
  FILE *req_log;
  queue *file_names;
  queue *buffer;
  pthread_mutex_t *m;
  pthread_cond_t *c_req;
  pthread_cond_t *c_res;
  pthread_mutex_t *input_lock;
  pthread_mutex_t *req_log_lock;
} request_data;

typedef struct {
  FILE *res_log;
  queue *buffer;
  pthread_mutex_t *m;
  pthread_cond_t *c_req;
  pthread_cond_t *c_res;
  pthread_mutex_t *res_log_lock;
  bool *req_done;
} resolve_data;
