#!/bin/bash

set -eo pipefail

conda init zsh
conda init bash 
eval "$(conda shell.bash hook)"
conda activate base

pip install --upgrade pip

pip install bitsandbytes datasets accelerate loralib sentencepiece gradio
pip install -q git+https://github.com/huggingface/transformers.git git+https://github.com/huggingface/peft.git

curl https://huggingface.co/datasets/anon8231489123/ShareGPT_Vicuna_unfiltered/resolve/main/ShareGPT_V3_unfiltered_cleaned_split_no_imsorry.json -L --create-dirs -o data/ShareGPT_V3_unfiltered_cleaned_split_no_imsorry.json
pip install -e .