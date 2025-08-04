#!/bin/bash

# Activate the membrain conda environment
source ~/miniconda3/etc/profile.d/conda.sh
conda activate membrain

# Define input and output directories
INPUT_DIR="/waxham/Cryo-EMData/Waxham_2025/Mihir_Summer_2025/YoungvsOldDRG_Experiment/Old_Dataset/Tomograms_after_IsoNet"
OUTPUT_BASE="/waxham/Cryo-EMData/Waxham_2025/Mihir_Summer_2025/YoungvsOldDRG_Experiment/Old_Dataset/Membrain_Seg_Outputs"
CKPT_PATH="/home/neal/membrain-seg/models/MemBrain_seg_v10_alpha.ckpt"

# Loop through all matching tomograms
for file in "$INPUT_DIR"/Position*_0423_deconv.mrc; do
    # Get base filename (e.g., Position2A_0423_deconv)
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

