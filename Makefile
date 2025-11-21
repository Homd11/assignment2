# Makefile for Lab-5 Assignment
# Compiles all C code examples from the lab

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Wextra

# Targets
TARGETS = process_creation output_program simple_program

# Default target: build all programs
all: $(TARGETS)
	@echo "All programs compiled successfully!"

# Exercise 1: Process Creation using fork()
process_creation: process_creation.c
	$(CC) $(CFLAGS) process_creation.c -o process_creation
	@echo "Compiled process_creation"

# Exercise 5: Linker example - compile and link two files
output_program: file1.c file2.c
	$(CC) $(CFLAGS) file1.c file2.c -o output_program
	@echo "Compiled and linked file1.c and file2.c into output_program"

# Exercise 6: Loader example - simple program
simple_program: simple_program.c
	$(CC) $(CFLAGS) simple_program.c -o simple_program
	@echo "Compiled simple_program"

# Run all programs
run: all
	@echo "\n=== Running process_creation ==="
	./process_creation
	@echo "\n=== Running output_program ==="
	./output_program
	@echo "\n=== Running simple_program ==="
	./simple_program
	@echo "\n=== Checking dynamic libraries for simple_program ==="
	ldd simple_program

# Clean up compiled files
clean:
	rm -f $(TARGETS)
	@echo "Cleaned up all compiled programs"

# Phony targets
.PHONY: all run clean
