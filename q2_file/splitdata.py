import random
import os

# Load the original file
with open("HIV_ref_genome.fasta", "r") as f:
    lines = f.readlines()

total_lines = len(lines)
num_parts = 50

# Generate 49 random split points (as indexes), sort them
split_points = sorted(random.sample(range(1, total_lines), num_parts - 1))
split_points = [0] + split_points + [total_lines]

# Create the directory to store the parts
os.makedirs("hiv_parts", exist_ok=True)

# Write each part to a separate file
for i in range(num_parts):
    start = split_points[i]
    end = split_points[i + 1]
    part_lines = lines[start:end]
    
    with open(f"hiv_parts/part_{i+1}.fasta", "w") as out:
        out.writelines(part_lines)

print(f"✅ Split complete. Total lines: {total_lines}, Total parts: {num_parts}")


