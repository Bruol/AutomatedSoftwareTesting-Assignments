# Assignment 1 - Code Coverage

## Overview

This assigment is designed to put coverage metrics into practice 
by introducing you to `gcov`. The assignment will guide you through
1. compiling C/C++ code to support code coverage
2. using gcov to extract code coverage metrics
3. building a test suite to achieve full coverage on a few sample programs

## Description

We will start by working on a few simple toy programs to familiarize yourself with
`gcov`. The instructions are designed for gcc running on a common Linux distribution. However, there might be differences between versions, so **be sure to use the provided Dockerfile to complete this assignment**.

If you don't have Docker installed, please consult official Docker documentation on how to get Docker for your OS before you continue. 

After extracting the files from the zip, you can build the Docker image and run it as follows:
```
$ cd hw1
$ sudo docker build -t hw1 .
$ sudo docker run -v $(pwd):/hw1 -it hw1
```

All the handout files will be mounted to `/hw1` in the container. You can compile and run the programs from there. The command option `-v $(pwd):/hw1` mounts the current directory `($(pwd))` into the container at path `/hw1`. This means that changes to files inside `/hw1` are instantly shared between the container and the host.

### Introduction to gcov

Gcov is a source code coverage analysis and profiling tool included in the GNU Compiler
Collection. In order to use it, you will need to compile your code with some special flags.
We will start exploring this with a hello world program that trivially achieves 100% 
coverage in its only execution path. Go into the `toy0` directory, where you will see a
single `hello.cpp` file. Compile it as follows.
```
$ g++ --coverage -dumpbase '' -g -O0 hello.cpp
```
The `--coverage` flag is equivalent to `-fprofile-arcs -ftest-coverage`, which will add 
additional instructions to keep track of statement execution for gcov to analyze. Adding
debug information and disabling optimizations using `-g -O0` helps map instructions back to 
lines of code. 

Once compiled, you should see a `hello.gcno` notes file, which stores a mapping of
basic blocks to source code. Once this is done, we need to run the executable, at which point 
profiling and coverage data will be generated and written to a `hello.gcda` data file. 
Note that you may need to remove existing data files if you compile and run the binary again.
```
$ ./a.out
Hello, gcov!
```
At this point, we can invoke `gcov` to read the notes and data file to give us a coverage report. 
You can do this by invoking it on the source file you're interested in.
The `-r` flag makes sure only relative imports are considered in the coverage, which excludes
standard library files such as `<iostream>`. The output should look like this.
```
$ gcov -r hello.cpp
File 'hello.cpp'
Lines executed:100.00% of 3
Creating 'hello.cpp.gcov'
```

This will create a `hello.cpp.gcov` output file. Make sure to include it in your submission.
Congratulations, you've just analyzed your first program using `gcov`!

## Toy Programs

The following subtasks all follow the same format: in the respective `toy<nr>` directories, you 
will find a `test<nr>.cpp` file with an incomplete test suite for a function or class that is 
contained in the `<program>.cpp` and `<program>.h` files. Your task is to extend the set of 
tests in `test<nr>.cpp` to achieve 100% coverage in `<program>.cpp`. Make sure to include 
`test<nr>.cpp` and the resulting `.gcov` file in your submission.

### FizzBuzz

Have a look at `test1.cpp` in the `toy1` directory. You'll notice a simple test function,
an array of test cases and a main function to run them. You should use exactly two test cases to
achieve 100% line coverage in `fizzbuzz.cpp`. You are free to modify the existing one if you like, 
it is only there to demonstrate how to use the framework. Invoking `gcov` works in a very similar way to before. 
Initially, it should look like this.
```
$ g++ --coverage -dumpbase '' -g -O0 *.cpp
$ ./a.out
Passed 1/1 test cases!
$ gcov -r fizzbuzz.cpp
File 'fizzbuzz.cpp'
Lines executed:70.00% of 10
Creating 'fizzbuzz.cpp.gcov'
```

### Linked List and Binary Tree

The next two tasks are structured identically. In each case, you are given a rough implementation
of a common data structure. There is more code 
to cover including some branching, which will make it a bit more difficult.
You are free to either make `testcase0` more complex or add more test cases
to achieve 100% line coverage. Note that the semantics of passing the test
case don't matter here. A simple `return true` at the end is fine.

Since it will be harder to reason about which parts of the code aren't covered yet, you may find
the information in the `.gcov` output file useful. Alternatively, `-t` will print this information
directly to stdout. Optionally, you can also use [gcovr](https://gcovr.com/en/stable/) to 
generate an interactive report of your current coverage including branches
using `gcovr --html-details <filename>.html`. There might be compatibility problems with some
browsers like Safari.

### Primality Test

Finally, you are given an optimized version of a trial division test to check for prime numbers.
There aren't many lines of code, but quite a few conditions. Consequently, we change our
metric here. We want the test suite to achieve 100% <b>branch</b> coverage. 
More specifically, we want each branch to be taken at least once. We can get `gcov` to 
report this with its `-b` flag. Initially, the output should look like this.
```
$ gcov -r -b prime.cpp
File 'prime.cpp'
Lines executed:33.33% of 9
Branches executed:12.50% of 16
Taken at least once:6.25% of 16
No calls
Creating 'prime.cpp.gcov'
```
Note that branches with complex conditions (including ||, &&) are compiled down to 
multiple branches with short-circuit evaluation. This means that one test case each to 
have the entire condition evaluate to true and false respectively is not sufficient for each
branch to be taken once. Also note that this is not condition coverage
since short-circuit evaluation causes dependent evaluation of sub-conditions.



## Submission and Grading

Before submission, you might have noticed that `.gcda` is updated each time the program is executed. Data from all runs will be aggregated together, and they will also appear in the `.gcov` file. So if you want to get fresh data, then these auxiliary files need to be cleaned up before a new run. **We require you to submit the `.gcov` file that was generated after the first run after cleaning up.**

You can achieve a total of 100 points for this assignment. Please submit your
files as follows, with one directory per subtask in a zip file. If this
structure is ignored, we may deduct up to 20 points from your total score. 
Note the achievable points in parentheses next to each subtask.

- \<matriculation_number\>-\<firstname\>-\<lastname\>.zip
  - toy0 (10 pts)
    - hello.cpp.gcov
  - toy1 (15 pts)
    - test1.cpp
    - fizzbuzz.cpp.gcov
  - toy2 (25 pts)
    - test2.cpp
    - LinkedList.cpp.gcov
  - toy3 (25 pts)
    - test3.cpp
    - BinaryTree.cpp.gcov
  - toy4 (25 pts)
    - test4.cpp
    - prime.cpp.gcov


## FAQ
Q: What is "cleaning up", what is a "clean" run?
A: Cleaning up means deleting previously generated coverage data files (like .gcda and .gcov). A clean run is the first program execution after this cleanup, producing fresh, unaggregated coverage data.

Q: Should the submission zip archive have a parent folder inside containing all other folders (i.e toy folders) or should the toy folders be zipped together directly?
A: You don't have to create a parent folder, just select the toy folders and zip them together. If your OS doesn't support that and creates a parent folder automatically, it is fine too.

Q: How to do good?
A: To obtain the points you need to ensure that the coverage is 100%, no partial points are given.

