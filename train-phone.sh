#!/bin/sh

#SBATCH --time=08:00:00
#SBATCH --gres=gpu:2

nvidia-smi

echo $CUDA_VISIBLE_DEVICES
source /home/s2122322/anaconda3/bin/activate
conda activate fs2

python3 train.py -p config/Herbikher-phone/preprocess.yaml -m config/Herbikher-phone/model.yaml -t config/Herbikher-phone/train.yaml
