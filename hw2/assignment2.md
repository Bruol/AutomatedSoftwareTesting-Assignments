# Assignment 2 - Tasks on KLEE

## Overview
This assignment aims to give you some practical understanding of the symbolic execution tool KLEE. Before we start, you could have a look around the website of KLEE: https://klee-se.org/.

## Description
This assignment consists of four small tasks. 
First, create a KLEE docker image and try a simple example. 
Second, use KLEE to solve a maze problem.
Third, use KLEE to discover a bug in the binary search algorithm.
Fourth, use KLEE with symbolic environment and libc functions

### Task 1: Setting up KLEE

Firstly, we need to setup KLEE docker image, we will be using the latest version. Pull the image from Docker Hub by running:
```
docker pull klee/klee
```

After pulling you need to start the container. You might want to use the following command to access the files on your file system from inside the docker. For that you can mount a working directory like this:
```
docker run -it --rm -v "$(pwd)":/workspace --name klee-container --ulimit='stack=-1:-1' klee/klee
```

It gives docker access to the files in your current directory (pwd). Then you can navigate to the directory from inside the container with
```
cd /workspace
```

Note that `--rm` tells Docker to delete the container after it stops. Data inside the container is lost, but data in mounted directories or volumes persists (i.e. your mounted workspace). Because the container is removed, it cannot be restarted or reused later. If you want to continue working or make changes, you need to start a new container.

More detailed instructions on how to setup KLEE docker image you can find on https://klee-se.org/docker/. (There is of course a way to manually build KLEE from source code, but we require you to use the docker image for this assignment.)

After setting up the docker image, please run KLEE on the get_sign.c by following the instructions from https://klee-se.org/tutorials/testing-function/.

You may find the following command useful to locate the path to klee_src
```
find / -type d -path "*/klee_src" 2>/dev/null
```

What you need to submit for this task is the klee-out directory generated after running the following command (same as in the tutorial above):
```
clang -I <path_to_klee_src>/include -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone get_sign.c
klee get_sign.bc
```

This exercise gives no partial points.

### Task 2: Solving a maze

In this task, you are given a simple program `maze.c`. You could first play around with the program a little bit to understand how it works. It may seem that there's only one way to solve the maze, but in fact your task is to use KLEE to find all possible (hidden) paths within a given length.

We will guide you through the process to solve this task:
1. First make the input variable `program` symbolic using `klee_make_symbolic` (**Be sure to use the variable's name as the third argument of this function for the whole assignment**). Now you should be able to generate a lot of test cases using KLEE the same way as in Task 1.
2. But you will find that most of the test cases are not valid paths. To highlight the valid paths, you need to add something like `klee_assert(0)` or `assert(0)` at the place where you win the game. This will let KLEE issue an error message when it finds a valid path. And in the output directory, those testcases will have a file named like `testN.assert.err`.
3. Now you have a way to find useful data in the output directory. But you would probably find out that there's only one testcase with error. In normal usage you usually only need one way to reach an error state, so KLEE only generate one testcase for each error state by default. But you can use the option `--emit-all-errors` to let KLEE generate all testcases for all errors.
4. Now you should be able to find all the valid paths solving this maze. You can check those testcases using the method in the 'Replaying a test case' section in https://klee-se.org/tutorials/testing-function/. Do they match the paths you find manually?

What you need to submit for this task is the modified `maze.c` and the klee-out directory generated after running the following command:
```
clang -I <path_to_klee_src>/include -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone maze.c
klee --emit-all-errors maze.bc
```
It should contain all the testcases with some of them having the `assert.err` file corresponding to the valid paths.

In this exercise you can get partial points for the valid paths.

### Task 3: Debugging a binary search algorithm

In this task, you are give a program `binary_search.c`. The function `binary_search(arr, size, target)` should have the following behavior:
- Precondition: `arr` is a sorted array of integers with `size` elements, and `target` is an integer.
- Postcondition: arr[0, result) < target <= arr[result, size) where result is the return value of the function.

However, there is a very simple bug in the program. Depending your knowledge it may seem very obvious to you, but your task is to use KLEE to find the bug.

You may notice that the program use a macro `DEBUG` to show/hide some printing statement. They might be useful for you to check the testcases. But remember for now they cannot be used with KLEE. We will explain the reason in the next task. **So only uncomment the line `#define DEBUG` when you want to print the testcases.**

The steps are as follows:
1. First make the input variables `a` and `x` symbolic. You can already generate a lot of test cases that triggers 'assert' errors.
2. But when you look at them carefully, you will notice they are not valid test cases. The reason is that the array `a` is not sorted. Here you can use `klee_assume` to solve this issue. Try to fill in the function `is_sorted` and add `klee_assume(is_sorted(a, 10))` to an appropriate place. 
3. When you run KLEE again, you may notice error like `KLEE: ERROR: binary_search.c:xx: invalid klee_assume call (provably false)`. This may due to the use of short-circuit operators in the `is_sorted` function. https://klee-se.org/docs/intrinsics/ has some examples of weird behaviors when you use them. 
4. After fixing the issue, you should be able to generate some bug-triggering test cases. You can try to print them out using the `DEBUG` macro and fix the bug.
5. After fixing the bug, you should be able to generate exactly 11 test cases corresponding to the 11 possibilities of the return value of the function.

What you need to submit for this task is the modified `binary_search.c` and the klee-out directory generated before (thus contains some bug-triggering testcases) and after fixing the bug (**11 testcases**).

In this exercise you can get partial points for each subtask.

Example commands for this task:
```
clang -I <path_to_klee_src>/include -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone binary_search.c
klee binary_search.bc
```

### Task 4: Using KLEE with symbolic environment and libc functions

As mentioned in the previous task, if you try to use those printing statement with KLEE, you will get errors like `KLEE: ERROR: binary_search.c:xx: external call with symbolic argument: printf`. We cite the reason from the KLEE documentation: 
> If we were running a normal native application, it would have been linked with the C library, but in this case KLEE is running the LLVM bitcode file directly. In order for KLEE to work effectively, it needs to have definitions for all the external functions the program may call. Similarly, a native application would be running on top of an operating system that provides lower level facilities like write(), which the C library uses in its implementation. As before, KLEE needs definitions for these functions in order to fully understand the program. We provide a POSIX runtime which is designed to work with KLEE and the uClibc library to provide the majority of operating system facilities used by command line applications.

So for program using those standard libraries, we need to run KLEE using the command `klee -libc=uclibc -posix-runtime`.

In this task, you are given a password checker `password.c`. There are three ways to pass the checker and your goal is to let KLEE find them automatically (they are already annotated by `assert(0)` so will trigger an error in KLEE). This time there's no symbolic input in the program but you need some symbolic environment.

We ask you to use the following three options to find the three independent ways to pass the checker:
1. `-sym-args <MIN> <MAX> <N>`: Replace by at least MIN arguments and at most MAX arguments, each with maximum length N.
2. `-sym-stdin <N>`: Make stdin symbolic with size N.
3. `-sym-files <NUM> <N>`: Make NUM symbolic files (‘A’, ‘B’, ‘C’, etc.), each with size N (excluding stdin)

You need to submit three klee-out directories generated by each of the options above.


Hint: while using the third option i.e. -sym-files, Klee expects a file name provided, example command for your reference could be

```
klee -libc=uclibc -posix-runtime password.bc -sym-files 1 <N> A
```

In this exercise you can get partial points for each password.





## FAQ
Q:  Some of the supplied programs require user input and wait for the input to be given from the console.  Is it considered a valid solution, if we remove or comment out the code requires user input?
A: For the programs that use variables read from user input, we highly recommend to comment the input out while making the variable symbolic. Though, as far as we tested, it seems that leaving input in, doesn't result in significant differences, we suggest, that you comment out/remove the input code for variables that are made symbolic.

Q: In task 2.2 I get "Aborted" message in the console, what should I do?
A: Try commenting out the print statements, it may help resolving the issue, if the problem persists, reach out to the TA Team, so we can further investigate the issue.





## Grading
The structure of your submission should be a .zip archive look like the following. If this
structure is ignored, we may deduct up to 20 points from your total score. Note the achievable points in parentheses next to each subtask.

- \<whatever\>.zip
    - /task1 (20 points)
        - /klee-out-0
    - /task2 (20 points)
        - maze.c
        - /klee-out-0
    - /task3 (40 points)
        - binary_search.c
        - /klee-out-0
        - /klee-out-1
    - /task4 (20 points)
        - /klee-out-0
        - /klee-out-1
        - /klee-out-2
    - /identifier.txt


/task1/klee-out-0 is the klee output running on get_sign.c

/task2/maze.c is the modified maze.c

/task2/klee-out-0 is the klee output running on the modified maze.c (all the valid paths are inside this directory)

/task3/binary_search.c is the modified binary_search.c

/task3/klee-out-0 is the klee output running on the original but symbolic binary_search.c (containing bug-triggering testcases)

/task3/klee-out-1 is the klee output running on the fixed binary_search.c (containing 11 testcases)

/task4/klee-out-0 is the klee output running on the password.c with `-sym-args` (containing one way to pass the checker)

/task4/klee-out-1 is the klee output running on the password.c with `-sym-stdin` (containing another way to pass the checker)

/task4/klee-out-2 is the klee output running on the password.c with `-sym-files` (containing yet another way to pass the checker)

/identifier.txt contains your name and student ID in the following format:
```
12123123, John Doe
```