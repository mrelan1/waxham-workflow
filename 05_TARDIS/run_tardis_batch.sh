#!/bin/bash

# Activate the tardis conda environment
source ~/miniconda3/etc/profile.d/conda.sh
conda activate tardis

# Set input and output base paths
INPUT_DIR="/path/to/your/input/directory"
BASE_OUT="/path/to/your/base/output/directory"

# Loop through all matching .mrc files
for file in "$INPUT_DIR"/naming_pattern; do
    base=$(basename "$file" .mrc)
    OUT_DIR="$BASE_OUT/$base"
    
    mkdir -p "$OUT_DIR/Predictions"

    echo "Copying $file to $OUT_DIR..."
    cp "$file" "$OUT_DIR"

    echo "Running TARDIS on $base..."
    tardis_mt -dir "$OUT_DIR" \
        -ct 0.15 \
        -cnn fnet_attn \
        -out mrc_None

    echo "Converting semantic output to 16-bit int..."
    SEMANTIC="$OUT_DIR/Predictions/${base}_semantic.mrc"
    SEMANTIC_INT16="$OUT_DIR/Predictions/${base}_tardisinput.mrc"
    
    if [ -f "$SEMANTIC" ]; then
        newstack -mode 1 "$SEMANTIC" "$SEMANTIC_INT16"
        echo "Converted $SEMANTIC to int16 as $SEMANTIC_INT16"
    else
        echo "Warning: Semantic output not found for $base"
    fi

    echo "Finished $base"
done

echo "All tomograms processed."

