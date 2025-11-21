CC = gcc

CFLAGS = -Wall -Wextra

TARGETS = process_creation output_program simple_program

all: $(TARGETS)
	@echo "All programs compiled successfully!"

process_creation: process_creation.c
	$(CC) $(CFLAGS) process_creation.c -o process_creation
	@echo "Compiled process_creation"

output_program: file1.c file2.c
	$(CC) $(CFLAGS) file1.c file2.c -o output_program
	@echo "Compiled and linked file1.c and file2.c into output_program"

simple_program: simple_program.c
	$(CC) $(CFLAGS) simple_program.c -o simple_program
	@echo "Compiled simple_program"

run: all
	@echo "\n=== Running process_creation ==="
	./process_creation
	@echo "\n=== Running output_program ==="
	./output_program
	@echo "\n=== Running simple_program ==="
	./simple_program
	@echo "\n=== Checking dynamic libraries for simple_program ==="
	ldd simple_program

clean:
	rm -f $(TARGETS)
	@echo "Cleaned up all compiled programs"

.PHONY: all run clean
