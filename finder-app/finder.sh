#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error: Both parameters (directory and search string) must be specified."
    exit 1
fi

filesdir="$1"
searchstr="$2"

if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi

file_count=$(find "$filesdir" -type f | wc -l)
matching_lines=$(grep -r -c "$searchstr" "$filesdir" | awk -F: '{sum += $2} END {print sum}')

if [ $? -ne 0 ]; then
    echo "Error: Failed to search for '$searchstr' in '$filesdir'."
    exit 1
fi

echo "The number of files are $file_count and the number of matching lines are $matching_lines"
