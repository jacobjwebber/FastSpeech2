#!/bin/sh

#SBATCH --time=08:00:00
#SBATCH --gres=gpu:2

nvidia-smi

echo $CUDA_VISIBLE_DEVICES
source /home/s2122322/anaconda3/bin/activate
conda activate fs2

python3 train.py -p config/Herbikher/preprocess.yaml -m config/Herbikher/model.yaml -t config/Herbikher/train.yaml --restore_step 30000
