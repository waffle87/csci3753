// Jack Sangdahl
// CSCI3753 SP24
// PA5 DNS infoolver
#include <arpa/inet.h>
#include <errno.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#define MAX_NAME_LENGTH 16 // longest string in data/
#define MAX_NAME_COUNT 24  // longest file by lines in data/
struct addrinfo hints;

char *domain_ip(char *domain) {
  char *res = (char *)malloc(sizeof(char) * INET_ADDRSTRLEN);
  struct addrinfo *info, *i;
  if (getaddrinfo(domain, NULL, &hints, &info))
    return (char *)"NOT_RESOLVED";
  for (i = info; i != NULL; i = i->ai_next) {
    struct sockaddr_in *ipv4 = (struct sockaddr_in *)i->ai_addr;
    char ipstr[INET_ADDRSTRLEN]; // INET_ADDRSTRLEN translates to 16
    inet_ntop(AF_INET, &(ipv4->sin_addr), ipstr, INET_ADDRSTRLEN);
    strcpy(res, ipstr);
    break;
  }
  freeaddrinfo(info);
  return res;
}

int main(int argc, char **argv) {
  if (argc < 3) {
    fprintf(stdout, "usage: %s <log_file> [ <datafile> ...]\n", argv[0]);
    return EXIT_FAILURE;
  }
  struct timeval begin, end;
  gettimeofday(&begin, NULL);
  if (!memset(&hints, 0, sizeof(hints))) {
    fprintf(stderr, "ERROR: memset failed\n");
    return EXIT_FAILURE;
  }
  hints.ai_family = AF_INET;       // limit to only ipv4
  hints.ai_socktype = SOCK_STREAM; // limit to tcp ports
  FILE *log_file = fopen(argv[1], "w");
  for (uint8_t i = 1; i < argc; i++) {
    FILE *data_file = fopen(argv[i], "r");
    if (!data_file) {
      fprintf(stdout, "ERROR: %s\n", strerror(errno));
      return EXIT_FAILURE;
    }
    char buffer[MAX_NAME_LENGTH];
    char **hostnames = (char **)malloc(sizeof(char *) * MAX_NAME_COUNT);
    uint8_t name_cnt = 0;
    while (fgets(buffer, sizeof(buffer), data_file)) {
      hostnames[name_cnt] = (char *)malloc(sizeof(char) * (strlen(buffer) + 1));
      buffer[strcspn(buffer, "\n")] = 0;
      strcpy(hostnames[name_cnt], buffer);
      name_cnt++;
    }
    for (uint8_t i = 0; i < name_cnt; i++)
      fprintf(log_file, "%s, %s\n", hostnames[i], domain_ip(hostnames[i]));
    free(hostnames);
    fclose(data_file);
  }
  fclose(log_file);
  gettimeofday(&end, NULL);
  double runtime = (double)(end.tv_usec - begin.tv_usec) / 1000000 +
                   (double)(end.tv_sec - begin.tv_sec);
  fprintf(stdout, "%s: total time is %f seconds\n", argv[0], runtime);
  return EXIT_SUCCESS;
}
