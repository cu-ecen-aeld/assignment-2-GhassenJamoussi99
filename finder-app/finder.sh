#!/bin/bash
# Author: Ghassen Jamoussi

set -e
set -u

filesdir=$1
searchstr=$2

if [ $# -lt 2 ]
then
    echo "Usage: ./finder.sh <filesdir> <searchstr>"
    exit 1
fi

if [ ! -d "$filesdir" ]
then
    echo "Directory $filesdir does not exist"
    exit 1
fi

X=$(ls "$filesdir" | wc -l)
if [ $? -ne 0 ]; then
    echo "Failed to list files in directory $filesdir"
    exit 1
fi

Y=$(grep -r -c "$searchstr" "$filesdir" 2>/dev/null | awk -F: '{sum += $2} END {print sum}')
if [ $? -ne 0 ]; then
    echo "Failed to search for string $searchstr in directory $filesdir"
    exit 1
fi

echo "The number of files are $X and the number of matching lines are $Y"