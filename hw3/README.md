
Assignment 3 - Tasks on AFL
Overview

This assignment aims to give you some practical understanding of the popular fuzzing tool AFL. By doing this assignment, you will learn:

    How to set up AFL for fuzzing C programs.
    How to write harness forw fuzzing.
    How to find interesting bugs via fuzzing.

Before we start, you could have a look around the websites of AFL and AFL++: https://lcamtuf.coredump.cx/afl/ and https://aflplus.plus/. In this assignment, we will focus on AFL++, which is a community-maintained fork of AFL.
Description

This assignment follows the AFL-training project on GitHub https://github.com/mykter/afl-training. The assignment consists of 3 individual tasks. In the first task, you will learn how to install AFL and fuzz a simple program. In the second task, you will learn what is harness and how to write harness. In the final tasks, you will experience the fun of finding the infamous heartbleed bug.
Task 1: Quick Start

Original instructions can be found here.

Create a working directory, clone the GitHub repository and pull the official AFL++ Docker image:

mkdir -p afl-assignment
cd afl-assignment
git clone https://github.com/mykter/afl-training.git
cd afl-training
docker pull aflplusplus/aflplusplus:latest

Start the container:

docker run --rm -it --privileged -v "$PWD":/src -w /src aflplusplus/aflplusplus:latest

Afterwards proceed with instructions from the quickstart guide from the section called "The vulnerable program".

Expected outputs:

    fuzzer_stats file in out/ (or in out/default/).

    crashes/ folder in out/ (or in out/default/). (Please wait until at least 5 unique crashes are found)

There are no partial points given for this exercise.
Task 2: Harness

Please follow the instructions in https://github.com/mykter/afl-training/tree/main/harness. Your task is in the "Writing a file-input test harness" section. Please try to understand what is harness and how to write harness in this task.

Tips:

    You must use [at][at] placeholder while running the AFL++. In AFL++, that is a placeholder in the target command line. AFL++ replaces it with the path to the current testcase file for each run.

    You need to create the in folder and the input file yourself.

    You only need to test function 'lib_echo'.

    You may find functions fread and fopen useful.

    The example command for AFL++ could look like this:

afl-fuzz -i in -o out ./harness @@

Expected outputs:

    Your harness.c file.

    fuzzer_stats file in out/ (or in out/default/).

    crashes/ folder in out/ (or in out/default/). (1 crash is okay)

    in/ input folder.

There are no partial points given for this exercise.
Task 3: Finding heartbleed:

Please follow the instructions in https://github.com/mykter/afl-training/tree/main/challenges/heartbleed. Read the files through the order README.md -> HINTS.md -> ANSWERS.md. If you would like the task to be more challenging, you could play around with the task before reading HINTS.md and ANSWERS.md. You will find the infamous heartbleed bug in OpenSSL.

Tips:

    To get the right OpenSSL version you need to run the following command on the host (not inside the container)

cd /path/to/afl-training
git submodule update --init --recursive challenges/heartbleed/openssl

    Design/find the seeds by yourself.

    Compilation may take some time.

Expected outputs:

    fuzzer_stats file in out/ (or in out/default/).

    crashes/ folder in out/. (or in out/default/). (1 crash is okay).

    in/ input folder.

There are no partial points given for this exercise.
Grading

The structure of your submission should be a .zip archive with the following structure.

    <whatever>.zip 
        /task1 (20 points)
            /fuzzer_stats
            /crashes/
        /task2 (40 points)
            /harness.c
            /fuzzer_stats
            /crashes/
            /in/
        /task3 (40 points)
            /fuzzer_stats
            /crashes/
            /in/
        /identifier.txt

/identifier.txt contains your name and student ID in the following format:

12123123, John Doe