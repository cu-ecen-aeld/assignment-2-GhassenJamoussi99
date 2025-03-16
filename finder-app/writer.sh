#!/bin/bash
# Author: Ghassen Jamoussi

set -e
set -u


writefile=$1
writestr=$2

if [ $# -lt 2 ]
then
    echo "Usage: ./writer.sh <writefile> <writestr>"
    exit 1
fi

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Failed to write to file $writefile"
    exit 1
fi