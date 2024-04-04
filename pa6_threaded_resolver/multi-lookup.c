// Jack Sangdahl
// CSCI3753 SP24
// PA6 Threaded Resolver
#include "multi-lookup.h"
#include <sys/time.h>

int main(int argc, char **argv) {
  if (argc < 6) {
    fprintf(stderr,
            "usage: %s <# requester> <# resolver> <requester log> <resolver "
            "log> [ <data file> ... ]\n",
            argv[0]);
    return EXIT_FAILURE;
  } else if (argc > MAX_INPUT_FILES + 6) {
    fprintf(stderr, "%s error: too many input files\n", argv[0]);
    return EXIT_FAILURE;
  }
  struct timeval proc_begin, proc_end;
  gettimeofday(&proc_begin, NULL);
  uint8_t req_thread = atoi(argv[1]);
  if (req_thread < 1) {
    fprintf(stderr, "%s error: minimum 1 requester thread\n", argv[0]);
    return EXIT_FAILURE;
  } else if (req_thread > MAX_REQUESTER_THREADS) {
    fprintf(stderr, "%s error: requester threads cannot exceed %d\n", argv[0],
            MAX_REQUESTER_THREADS);
    return EXIT_FAILURE;
  }
  uint8_t res_threads = atoi(argv[2]);
  if (res_threads < 1) {
    fprintf(stderr, "%s error: minimum 1 resolver thread\n", argv[0]);
    return EXIT_FAILURE;
  } else if (res_threads > MAX_RESOLVER_THREADS) {
    fprintf(stderr, "%s error: resolver threads cannot exceed %d\n", argv[0],
            MAX_RESOLVER_THREADS);
    return EXIT_FAILURE;
  }
  queue input_files;
  queue_init(&input_files, MAX_INPUT_FILES);
  for (int i = 5; i < argc; i++) {
    if (access(argv[i], F_OK) == -1)
      fprintf(stderr, "%s error: invalid data file '%s'\n", argv[0], argv[i]);
    else
      queue_push(&input_files, strndup(argv[i], strlen(argv[i])));
  }
  if (!queue_size(&input_files)) {
    fprintf(stderr, "%s error: no valid data file given\n", argv[0]);
    return EXIT_FAILURE;
  }
  pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
  pthread_cond_t c_req = PTHREAD_COND_INITIALIZER;
  pthread_cond_t c_res = PTHREAD_COND_INITIALIZER;
  pthread_mutex_t input_lock = PTHREAD_MUTEX_INITIALIZER;
  pthread_mutex_t req_log_lock = PTHREAD_MUTEX_INITIALIZER;
  pthread_mutex_t res_log_lock = PTHREAD_MUTEX_INITIALIZER;
  bool req_done = 0;
  queue buffer;
  queue_init(&buffer, ARRAY_SIZE);
  request_data req_data;
  req_data.req_log = fopen(argv[3], "w");
  req_data.file_names = &input_files;
  req_data.buffer = &buffer;
  req_data.m = &m;
  req_data.c_req = &c_req;
  req_data.c_res = &c_res;
  req_data.input_lock = &input_lock;
  req_data.req_log_lock = &req_log_lock;
  resolve_data res_data;
  res_data.res_log = fopen(argv[4], "w");
  res_data.buffer = &buffer;
  res_data.m = &m;
  res_data.c_req = &c_req;
  res_data.c_res = &c_res;
  res_data.res_log_lock = &res_log_lock;
  res_data.req_done = &req_done;
  pthread_t request_tid[req_thread];
  pthread_t resolve_tid[res_threads];
  for (int i = 0; i < req_thread; i++)
    pthread_create(&request_tid[i], NULL, request, &req_data);
  for (int i = 0; i < res_threads; i++)
    pthread_create(&resolve_tid[i], NULL, resolve, &res_data);
  for (int i = 0; i < req_thread; i++)
    pthread_join(request_tid[i], NULL);
  pthread_mutex_lock(&m);
  req_done = 1;
  pthread_mutex_unlock(&m);
  for (int i = 0; i < res_threads; i++)
    pthread_join(resolve_tid[i], NULL);
  fclose(req_data.req_log);
  fclose(res_data.res_log);
  queue_free(&input_files);
  queue_free(&buffer);
  printf("Number of Requestor Threads: %d\n", req_thread);
  printf("Number of Resolver Threads: %d\n", res_threads);
  gettimeofday(&proc_end, NULL);
  fprintf(stdout, "%s: total time is %f seconds\n", argv[0],
          ELAPSED_SECONDS(proc_begin, proc_end));
  return EXIT_SUCCESS;
}

void *request(void *data) {
  request_data *req_data = (request_data *)data;
  uint8_t file_count = 0;
  while (1) {
    pthread_mutex_lock(req_data->input_lock);
    if (queue_size(req_data->file_names) > 0) {
      char *data_file = queue_pop(req_data->file_names);
      file_count++;
      pthread_mutex_unlock(req_data->input_lock);
      FILE *file = fopen(data_file, "r");
      char line[MAX_NAME_LENGTH];
      while (fgets(line, sizeof(line), file)) {
        pthread_mutex_lock(req_data->m);
        while (queue_full(req_data->buffer))
          pthread_cond_wait(req_data->c_req, req_data->m);
        pthread_mutex_lock(req_data->req_log_lock);
        fprintf(req_data->req_log, "%s", line);
        pthread_mutex_unlock(req_data->req_log_lock);
        queue_push(req_data->buffer, strndup(strtok(line, "\n"), strlen(line)));
        pthread_mutex_unlock(req_data->m);
        pthread_cond_signal(req_data->c_res);
      }
      fclose(file);
      free(data_file);
    } else {
      pthread_mutex_unlock(req_data->input_lock);
      break;
    }
  }
  fprintf(stdout, "thread %ld serviced %d files\n", syscall(SYS_gettid),
          file_count);
  return 0;
}

void *resolve(void *data) {
  resolve_data *res_data = (resolve_data *)data;
  char *ip = (char *)malloc(MAX_IP_LENGTH);
  uint16_t domain_cnt = 0;
  struct timeval thread_begin, thread_end;
  gettimeofday(&thread_begin, NULL);
  while (1) {
    pthread_mutex_lock(res_data->m);
    if (!(*(res_data->req_done)) || queue_size(res_data->buffer)) {
      while (!queue_size(res_data->buffer))
        pthread_cond_wait(res_data->c_res, res_data->m);
      char *domain = queue_pop(res_data->buffer);
      pthread_mutex_unlock(res_data->m);
      pthread_cond_signal(res_data->c_req);
      if (dnslookup(domain, ip, MAX_IP_LENGTH)) {
        pthread_mutex_lock(res_data->res_log_lock);
        fprintf(res_data->res_log, "%s, NOT_RESOLVED\n", domain);
        pthread_mutex_unlock(res_data->res_log_lock);
        domain_cnt++;
      } else {
        pthread_mutex_lock(res_data->res_log_lock);
        fprintf(res_data->res_log, "%s, %s\n", domain, ip);
        pthread_mutex_unlock(res_data->res_log_lock);
        domain_cnt++;
      }
      free(domain);
    } else {
      pthread_mutex_unlock(res_data->m);
      break;
    }
  }
  free(ip);
  gettimeofday(&thread_end, NULL);
  fprintf(stdout, "thread %ld resolved %d hostnames in %f seconds\n",
          syscall(SYS_gettid), domain_cnt,
          ELAPSED_SECONDS(thread_begin, thread_end));
  return 0;
}
