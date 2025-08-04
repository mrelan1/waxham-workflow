#!/bin/bash

# Activate the membrain conda environment
source ~/miniconda3/etc/profile.d/conda.sh
conda activate membrain

# Define input and output directories
INPUT_DIR="/path/to/your/input/directory"
OUTPUT_BASE="/path/to/your/output/directory"
CKPT_PATH="/path/to/your/ckpt/directory"

# Loop through all matching tomograms
for file in "$INPUT_DIR"/insert_naming_pattern; do
    # Get base filename
    base=$(basename "$file" .mrc)
    
    # Create unique output folder
    OUT_DIR="$OUTPUT_BASE/$base"
    mkdir -p "$OUT_DIR"

    echo "Running MemBrain on $base..."

    # Run MemBrain
    membrain segment \
        --tomogram-path "$file" \
        --ckpt-path "$CKPT_PATH" \
        --out-folder "$OUT_DIR" \
        --store-probabilities

    echo "Finished $base"
done

echo "All tomograms processed."

