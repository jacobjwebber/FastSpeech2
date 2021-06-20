#!/bin/sh

#SBATCH --time=01:00:00
#SBATCH --gres=gpu:1

nvidia-smi

echo $CUDA_VISIBLE_DEVICES
source /home/s2122322/anaconda3/bin/activate
conda activate fs2

python3 preprocess.py config/Herbikher-phone/preprocess.yaml