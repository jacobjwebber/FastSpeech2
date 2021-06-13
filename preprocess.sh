#!/bin/sh

#SBATCH --gres=gpu:1

nvidia-smi

echo $CUDA_VISIBLE_DEVICES
source /home/s2122322/anaconda3/bin/activate
conda activate fs2
echo Conda environment fs2 activated

python3 preprocess.py config/Herbikher/preprocess.yaml