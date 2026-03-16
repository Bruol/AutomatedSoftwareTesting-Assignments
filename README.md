# AST Homework Repository

This repository contains two homework assignments for Automated Software Testing (AST):

- `hw1`: Code coverage with `gcov`
- `hw2`: Symbolic execution with KLEE

## Repository Layout

```
AST/
├── hw1/
│   ├── assignment1.md
│   ├── Dockerfile
│   ├── generate_submission.sh
│   ├── toy0/
│   ├── toy1/
│   ├── toy2/
│   ├── toy3/
│   └── toy4/
└── hw2/
    ├── assignment2.md
    ├── task1/
    ├── task2/
    ├── task3/
    └── task4/
```

## Prerequisites

- Docker
- C/C++ toolchain (`gcc`/`g++`, `clang`)
- `gcov` (for `hw1`)
- KLEE Docker image (for `hw2`)

## HW1: Coverage with gcov

All detailed instructions are in `hw1/assignment1.md`.

Quick start:

```bash
cd hw1
sudo docker build -t hw1 .
sudo docker run -v "$(pwd)":/hw1 -it hw1
```

Inside the container, compile and run with coverage enabled, then generate reports:

```bash
g++ --coverage -dumpbase '' -g -O0 *.cpp
./a.out
gcov -r <source_file>.cpp
```

Notes:

- Clean old coverage artifacts (`.gcda`, `.gcov`) before a fresh graded run.
- Each toy task expects `100%` required coverage metric (line or branch as specified).

## HW2: KLEE Tasks

All detailed instructions are in `hw2/assignment2.md`.

Pull and run KLEE Docker image:

```bash
docker pull klee/klee
docker run -it --rm -v "$(pwd)":/workspace --name klee-container --ulimit='stack=-1:-1' klee/klee
cd /workspace
```

Typical compile and run flow for a task:

```bash
clang -I <path_to_klee_src>/include -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone <task>.c
klee <task>.bc
```

Task 4 uses KLEE runtime options:

```bash
klee -libc=uclibc -posix-runtime password.bc -sym-args <MIN> <MAX> <N>
klee -libc=uclibc -posix-runtime password.bc -sym-stdin <N>
klee -libc=uclibc -posix-runtime password.bc -sym-files <NUM> <N> A
```

## Submission

- Follow the exact folder structure specified in each assignment markdown file.
- Required outputs are mostly modified source files plus generated coverage/KLEE output directories.
- Keep `klee-out-*` and `*.gcov` artifacts that are explicitly requested.

## Reference Files

- `hw1/assignment1.md`
- `hw2/assignment2.md`
