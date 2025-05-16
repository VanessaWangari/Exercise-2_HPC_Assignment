#!/bin/bash

INPUT_DIR="hiv_parts"
OUTPUT_FILE="consolidated_summary.csv"

# Write CSV header
echo "Filename,Line Count,Total Nucleotides,A,T,C,G,GC Content (%)" > "$OUTPUT_FILE"

# Loop through each FASTA file
for file in "$INPUT_DIR"/part_*.fasta; do
    filename=$(basename "$file")
    
    # Count lines
    line_count=$(wc -l < "$file")
    
    # Extract sequences (skip headers), remove newlines, convert to uppercase
    seq=$(grep -v "^>" "$file" | tr -d '\n' | tr 'a-z' 'A-Z')
    
    # Count nucleotides
    count_A=$(echo "$seq" | grep -o "A" | wc -l)
    count_T=$(echo "$seq" | grep -o "T" | wc -l)
    count_C=$(echo "$seq" | grep -o "C" | wc -l)
    count_G=$(echo "$seq" | grep -o "G" | wc -l)
    
    total_nuc=$((count_A + count_T + count_C + count_G))
    gc=$((count_G + count_C))
    
    # Calculate GC content (%)
    if [ "$total_nuc" -gt 0 ]; then
        gc_content=$(echo "scale=2; ($gc / $total_nuc) * 100" | bc)
    else
        gc_content=0
    fi
    
    # Write row to CSV
    echo "$filename,$line_count,$total_nuc,$count_A,$count_T,$count_C,$count_G,$gc_content" >> "$OUTPUT_FILE"
done

