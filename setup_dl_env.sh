#!/bin/bash

# =============================================================
# Deep Learning GPU Environment Setup Script for Linux
# Author: nayandas69
# =============================================================

ENV_NAME="dl_env"
ENV_FILE="dl_env.yml"

echo
echo "============================================================"
echo "[1/4] Creating Conda environment: $ENV_NAME"
echo "============================================================"

# Create the Conda environment
conda env create -f "$ENV_FILE"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to create conda environment. Check $ENV_FILE for issues."
    exit 1
fi

echo
echo "============================================================"
echo "[2/4] Activating environment and generating GPU test script"
echo "============================================================"

# Activate the conda environment
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate "$ENV_NAME"

# Create Python GPU test script
cat << EOF > test_gpu.py
import torch

print("Total GPUs:", torch.cuda.device_count())
print(
    "GPU Name:",
    torch.cuda.get_device_name(0) if torch.cuda.is_available() else "No GPU detected",
)

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print("Currently using device:", device)
EOF

echo
echo "============================================================"
echo "[3/4] Running GPU test script"
echo "============================================================"

python test_gpu.py

echo
echo "============================================================"
echo "[4/4] Setup Complete"
echo "Environment '$ENV_NAME' is ready to use."
echo "============================================================"
