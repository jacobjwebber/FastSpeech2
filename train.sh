#!/bin/sh

#SBATCH --time=01:00:00
#SBATCH --gres=gpu:1

nvidia-smi

echo $CUDA_VISIBLE_DEVICES
source /home/s2122322/anaconda3/bin/activate
conda activate fs2
echo Conda environment fs2 activated

python3 train.py -p config/Herbikher/preprocess.yaml -m config/Herbikher/model.yaml -t config/Herbikher/train.yaml