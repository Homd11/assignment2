#!/bin/bash
echo "LAB-5 ASSIGNMENT VERIFICATION SCRIPT"

echo "Checking required files"
files=("process_creation.c" "file1.c" "file2.c" "simple_program.c" "explanations.txt" "Makefile" "README.md" "LICENSE" ".gitignore")
all_exist=true
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✓ $file exists"
    else
        echo "  ✗ $file NOT FOUND"
        all_exist=false
    fi
done

echo ""
echo "Makefile"
make clean > /dev/null 2>&1
echo " Clean successful"

echo "  - Running 'make all'..."
if make all > /dev/null 2>&1; then
    echo "  Compilation successful"
else
    echo " Compilation failed"
    exit 1
fi

echo ""
echo "3. Testing executables..."

if [ -x "process_creation" ]; then
    echo "  process_creation executable exists"
    ./process_creation > /dev/null 2>&1
    echo "  process_creation runs"
else
    echo "  process_creation not executable"
fi

if [ -x "output_program" ]; then
    echo "  output_program executable exists"
    output=$(./output_program)
    if [[ "$output" == *"Hello from file1!"* ]]; then
        echo "  output_program produces correct output"
    else
        echo "   output_program output incorrect"
    fi
else
    echo "  output_program not executable"
fi

if [ -x "simple_program" ]; then
    echo "   simple_program executable exists"
    output=$(./simple_program)
    if [[ "$output" == *"This is a simple program."* ]]; then
        echo "   simple_program produces correct output"
    else
        echo "   simple_program output incorrect"
    fi
else
    echo "  simple_program not executable"
fi

echo ""
echo "Checking ldd "
if command -v ldd > /dev/null 2>&1; then
    ldd_output=$(ldd simple_program 2>&1)
    if [[ "$ldd_output" == *"libc.so"* ]]; then
        echo "   ldd works and shows dynamic libraries"
    else
        echo "   ldd output unexpected"
    fi
else
    echo "   ldd not available "
fi


