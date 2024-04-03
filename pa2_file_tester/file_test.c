// Authour: jasa7131
// CSCI3753 SP2024
// PA2 File Tester
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#define MAX 1024

int file_read(int fd, int bytes);
int file_write(int fd, char *data);
int file_seek(int fd, int offset, int whence);

int main(int argc, char **argv) {
  if (argc < 2) {
    printf("%s error: missing filename\n", argv[0]);
    return -1;
  }

  int fd = open(argv[1], O_RDWR);
  char input[8]; // fgets requires 8 bytes minimum
  char *data = (char *)malloc(MAX * sizeof(char));
  int bytes, offset, whence;

  printf("Option (r for read, w for write, s for seek): ");
  while (fgets(input, sizeof(input), stdin)) {
    switch (*input) {
    case 'r':
      printf("Enter the number of bytes you want to read: ");
      scanf("%d", &bytes);
      if (file_read(fd, bytes) < 0) {
        printf("%s error: read failed\n", argv[0]);
        return -1;
      }
      break;
    case 'w':
      printf("Enter the data you want to write: ");
      scanf("%[^\n]", data);
      data[strcspn(data, "\n")] = 0; // remove new line from string
      data[strlen(data) + 1] = '\0'; // append null character to string
      if (file_write(fd, data) < 0) {
        printf("%s error: write failed\n", argv[0]);
        free(data);
        return -1;
      }
      free(data);
      break;
    case 's':
      printf("Enter an offset value: ");
      scanf("%d", &offset);
      printf("Enter a value for whence: ");
      scanf("%d", &whence);
      if (file_seek(fd, offset, whence) < 0) {
        printf("%s error: seek failed\n", argv[0]);
        return -1;
      }
      break;
    default:
      printf("Option (r for read, w for write, s for seek): ");
    }
  }
  close(fd);
  return 0;
}

int file_read(int fd, int bytes) {
  char *buffer = (char *)malloc(bytes * sizeof(char));
  if (read(fd, buffer, bytes) < 0) {
    free(buffer);
    return -1;
  }
  printf("%s\n", buffer);
  free(buffer);
  return 0;
}

int file_write(int fd, char *data) {
  if (write(fd, data, strlen(data)) < 0)
    return -1;
  return 0;
}

int file_seek(int fd, int offset, int whence) {
#define SEEK_HOLE 4 // should be in unistd header?
  if (whence < SEEK_SET || whence > SEEK_HOLE)
    return -1;
  if (lseek(fd, offset, whence) < 0)
    return -1;
  return 0;
}
