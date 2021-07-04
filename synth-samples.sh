#!/bin/sh

#SBATCH --time=01:00:00
#SBATCH --gres=gpu:1

nvidia-smi

echo $CUDA_VISIBLE_DEVICES
source /home/s2122322/anaconda3/bin/activate
conda activate fs2


input="dershlisl_test.txt"
while IFS= read -r line
do
  echo "$line"
done < "$input"


#python3 synthesize.py --text "יעדער מענטש װערט געבױרן פֿרײַ און גלײַך אין כּבֿוד און רעכט. יעדער װערט באַשאָנקען מיט פֿאַרשטאַנד און געװיסן; יעדער זאָל זיך פֿירן מיט אַ צװײטן אין אַ געמיט פֿון ברודערשאַפֿט." --restore_step 75000 --mode single -p config/Herbikher/preprocess.yaml -m config/Herbikher/model.yaml -t config/Herbikher/train.yaml

#python3 synthesize.py --text "יעדער מענטש װערט געבױרן פרײ און גלײך אין כבוד און רעכט. יעדער װערט באשאנקען מיט פארשטאנד און געװיסן; יעדער זאל זיך פירן מיט א צװײטן אין א געמיט פון ברודערשאפט." --restore_step 75000 --mode single -p config/Herbikher-unpointed/preprocess.yaml -m config/Herbikher-unpointed/model.yaml -t config/Herbikher-unpointed/train.yaml

#python3 synthesize.py --text "יעדער מענטש װערט געבױרן פֿרײַ און גלײַך אין כּבֿוד און רעכט. יעדער װערט באַשאָנקען מיט פֿאַרשטאַנד און געװיסן; יעדער זאָל זיך פֿירן מיט אַ צװײטן אין אַ געמיט פֿון ברודערשאַפֿט." --restore_step 75000 --mode single -p config/Herbikher-phone/preprocess.yaml -m config/Herbikher-phone/model.yaml -t config/Herbikher-phone/train.yaml
