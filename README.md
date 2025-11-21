# Lab-5 Assignment: Process Management and Compilation

This repository contains C code examples demonstrating process creation, the role of linkers and loaders, along with a Makefile for compilation.

## Table of Contents

- [About](#about)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Code Examples](#code-examples)
  - [Exercise 1: Process Creation with fork()](#exercise-1-process-creation-with-fork)
  - [Exercise 5: Linker Demonstration](#exercise-5-linker-demonstration)
  - [Exercise 6: Loader Demonstration](#exercise-6-loader-demonstration)
- [Understanding Linkers and Loaders](#understanding-linkers-and-loaders)
  - [What is a Linker?](#what-is-a-linker)
  - [What is a Loader?](#what-is-a-loader)
- [Building and Running](#building-and-running)
- [License](#license)

## About

This project is part of Lab-5 coursework focusing on:
- Process creation in C using the `fork()` system call
- Understanding the compilation process
- The role of linkers in combining object files
- The role of loaders in executing programs
- Creating Makefiles for automated compilation

## Getting Started

### Prerequisites

To compile and run these programs, you need:
- **GCC (GNU Compiler Collection)**: Required to compile C programs
- **Linux/Unix environment**: The programs use POSIX system calls

Install GCC on Ubuntu/Debian:
```bash
sudo apt install gcc
```

### Installation

1. Clone this repository:
```bash
git clone https://github.com/Homd11/assignment2.git
cd assignment2
```

2. Compile all programs:
```bash
make all
```

## Usage

### Compile all programs
```bash
make all
```

### Run all programs
```bash
make run
```

### Clean compiled files
```bash
make clean
```

### Compile individual programs
```bash
# Process creation example
make process_creation

# Linker example
make output_program

# Loader example
make simple_program
```

## Code Examples

### Exercise 1: Process Creation with fork()

**File:** `process_creation.c`

This program demonstrates how to create a new process using the `fork()` system call.

**What it does:**
- Creates a child process using `fork()`
- The parent and child processes both print their Process IDs (PIDs)
- Demonstrates concurrent execution of parent and child processes

**Run:**
```bash
./process_creation
```

**Expected Output:**
```
This is the parent process. PID: [parent_pid]
This is the child process. PID: [child_pid]
```

### Exercise 5: Linker Demonstration

**Files:** `file1.c`, `file2.c`

This example shows how the linker combines multiple source files into a single executable.

**What it does:**
- `file1.c` defines a `hello()` function
- `file2.c` contains the `main()` function that calls `hello()`
- The linker resolves the function call and creates the final executable

**Run:**
```bash
./output_program
```

**Expected Output:**
```
Hello from file1!
```

### Exercise 6: Loader Demonstration

**File:** `simple_program.c`

A simple program used to demonstrate the loader's role in loading dynamic libraries.

**What it does:**
- Prints a simple message
- Can be inspected with `ldd` to see which libraries the loader loads

**Run:**
```bash
./simple_program
ldd simple_program
```

**Expected Output:**
```
This is a simple program.
```

The `ldd` command will show the dynamic libraries loaded by the loader.

## Understanding Linkers and Loaders

### What is a Linker?

The **linker** is a program that combines one or more object files into a single executable.

**Key responsibilities:**
1. **Symbol Resolution**: Connects function calls to their definitions across different files
2. **Relocation**: Assigns final memory addresses to code and data
3. **Library Linking**: Links external libraries to the program
4. **Error Detection**: Reports undefined or duplicate symbols

**Example:** In the linker demonstration, `file1.c` and `file2.c` are compiled separately into object files, then the linker combines them and resolves the `hello()` function reference.

### What is a Loader?

The **loader** is part of the operating system that loads programs into memory and prepares them for execution.

**Key responsibilities:**
1. **Program Loading**: Reads the executable and loads it into memory
2. **Dynamic Linking**: Loads shared libraries required by the program
3. **Relocation**: Adjusts addresses for the program's actual load location
4. **Initialization**: Sets up the runtime environment and starts execution

**Example:** When running `./simple_program`, the loader loads the executable and dynamic libraries (libc, etc.) into memory before execution begins.

## Building and Running

### Compile all programs:
```bash
make all
```

### Run programs individually:
```bash
./process_creation
./output_program
./simple_program
```

### View dynamic libraries:
```bash
ldd simple_program
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Author:** Lab-5 Assignment  
**Course:** Operating Systems / Systems Programming  
**Purpose:** Educational demonstration of process management and compilation