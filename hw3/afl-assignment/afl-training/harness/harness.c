#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include "library.h"

// fixed size buffer based on assumptions about the maximum size that is likely necessary to
// exercise all aspects of the target function
#define SIZE 50

int main(int argc, char *argv[])
{
  if ((argc == 2))
  {
    const char *filename = argv[1];
    // make sure buffer is initialized to eliminate variable behaviour that isn't dependent on the
    // input.

    FILE *fp = fopen(filename, "r");

    if (fp == NULL)
    {
      printf("Failed to open file\n");
      return 1;
    }

    char input[SIZE] = {0};

    ssize_t length;
    length = fread(input, sizeof(char), SIZE, fp);

    lib_echo(input, length);
    return 0;
  }
  else
  {
    fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
    return 1;
  }
}