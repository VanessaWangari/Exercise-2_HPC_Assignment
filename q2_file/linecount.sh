#!/bin/bash

# Directory containing split files
DIR="hiv_parts"

# Check if directory exists
if [[ ! -d "$DIR" ]]; then
  echo "Directory '$DIR' not found!"
  exit 1
fi

# Iterate over each file and count lines
for file in "$DIR"/part_*.fasta; do
  count=$(wc -l < "$file")
  echo "$(basename "$file"): $count lines"
done


