#!/bin/bash

# Check if argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: linter <file>"
    exit 1
fi

# Check if the provided file exists
if [ ! -e "$1" ]; then
    echo "Error: File '$1' does not exist."
    exit 1
fi

# Function to lint Python files
lint_python() {
    black "$1"
    black --line-length 79 "$1"
    autopep8 --in-place "$1"
    isort "$1"
    autoflake --in-place --remove-all-unused-imports "$1"
    flake8 "$1"
}

# Function to lint HTML, JS, and CSS files
lint_web() {
    djlint "$1" --profile=django --reformat
}

# Determine file extension
file_ext="${1##*.}"

# Check file extension and call appropriate linting function
case "$file_ext" in
    py)
        lint_python "$1"
        ;;
    html|js|css)
        lint_web "$1"
        ;;
    *)
        echo "No linter available for .$file_ext files."
        ;;
esac
