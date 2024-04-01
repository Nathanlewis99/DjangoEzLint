#!/bin/bash

# Check if argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: Ezlint <path or file>"
    exit 1
fi

# Check if the provided path exists
if [ ! -e "$1" ]; then
    echo "Error: Path '$1' does not exist."
    exit 1
fi

# If it's a file, run the linter script on it
if [ -f "$1" ]; then
    linter "$1"
    exit $?
fi

# If it's a directory, run the linter script on all files in the directory
if [ -d "$1" ]; then
    find "$1" -type f -exec linter {} \;
    exit $?
fi
