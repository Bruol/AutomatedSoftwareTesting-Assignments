#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>

int check_password_file(int fd) {
  char buf[12];
  if (fd == 0 && read(fd, buf, 12) != -1) {
    if (strcmp(buf, "universe") == 0)
      return 1;
  }
  if (fd != 0 && read(fd, buf, 12) != -1) {
    if (strcmp(buf, "everything") == 0)
      return 1;
  }
  return 0;
}

int check_password(char *buf1, char *buf2) {
  if (strcmp(buf1, "42") == 0 &&
      strcmp(buf2, "life") == 0)
    return 1;
  return 0;
}

int main(int argc, char **argv) {
  int fd;

  if (argc >= 3) {
    if (check_password(argv[1], argv[2])) {
      printf("Password found in command-line arguments\n");
      assert(0);
      return 0;
    }
    return 1;
  }
  
  if (argc >= 2) {
    if ((fd = open(argv[1], O_RDONLY)) != -1) {
      if (check_password_file(fd)) {
        printf("Password found in %s\n", argv[1]);
        close(fd);
        assert(0);
        return 0;
      }
      close(fd);
      return 1;
    }
  }

  if (check_password_file(0)) {
    printf("Password found in standard input\n");
    assert(0);
    return 0;
  }

  return 1;
}