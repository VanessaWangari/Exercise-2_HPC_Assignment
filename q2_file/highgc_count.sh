#!/bin/bash

INPUT_DIR="hiv_parts"
highest_gc=0
highest_file=""

echo "Calculating GC content for each file..."

for file in "$INPUT_DIR"/part_*.fasta; do
    # Get sequence (remove headers, uppercase, no newlines)
    seq=$(grep -v "^>" "$file" | tr -d '\n' | tr 'a-z' 'A-Z')

    # Count nucleotides
    count_A=$(echo "$seq" | grep -o "A" | wc -l)
    count_T=$(echo "$seq" | grep -o "T" | wc -l)
    count_C=$(echo "$seq" | grep -o "C" | wc -l)
    count_G=$(echo "$seq" | grep -o "G" | wc -l)

    total=$((count_A + count_T + count_C + count_G))
    gc=$((count_G + count_C))

    # Avoid division by zero
    if [ "$total" -gt 0 ]; then
        gc_content=$(echo "scale=2; ($gc / $total) * 100" | bc)
    else
        gc_content=0
    fi

    # Check for highest GC content
    comp=$(echo "$gc_content > $highest_gc" | bc)
    if [ "$comp" -eq 1 ]; then
        highest_gc=$gc_content
        highest_file=$(basename "$file")
    fi
done

echo "File with highest GC content: $highest_file ($highest_gc%)"

