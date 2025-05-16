#!/bin/bash

# Directory containing the split FASTA files
INPUT_DIR="hiv_parts"
OUTPUT_FILE="nucleotide_counts_summary.txt"

# Write header to the summary file
echo -e "Filename\tA\tT\tC\tG" > "$OUTPUT_FILE"

# Loop over all .fasta files in the directory
for file in "$INPUT_DIR"/part_*.fasta; do
    # Extract the filename without path
    filename=$(basename "$file")

    # Read only sequence lines (ignore headers), convert to uppercase, remove newlines
    sequence=$(grep -v "^>" "$file" | tr -d '\n' | tr 'a-z' 'A-Z')

    # Count nucleotides
    count_A=$(echo "$sequence" | grep -o "A" | wc -l)
    count_T=$(echo "$sequence" | grep -o "T" | wc -l)
    count_C=$(echo "$sequence" | grep -o "C" | wc -l)
    count_G=$(echo "$sequence" | grep -o "G" | wc -l)

    # Write result line
    echo -e "${filename}\t${count_A}\t${count_T}\t${count_C}\t${count_G}" >> "$OUTPUT_FILE"
done

echo " Nucleotide counts saved to $OUTPUT_FILE"

