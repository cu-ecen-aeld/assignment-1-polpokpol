#!/bin/bash

if [ $# -ne 2 ]; then
    echo "error: Both parameters (file name and content) must be specified."
    exit 1
fi

writefile="$1"
writestr="$2"

# it will create directory, even if you include filename like sample.txt it will just create the directories not the files
mkdir -p "$(dirname "$writefile")"

# write the content to the file and automatically creates files
echo "$writestr" > "$writefile"

if [ $? -ne 0 ]; then
    echo "error: cant write '$writestr' in '$writefile'."
    exit 1
fi
