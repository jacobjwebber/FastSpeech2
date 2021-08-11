#!/bin/sh

nvidia-smi

# baseline
path="../yiddish-tts/test/gold-labs/zilberberg/a/normalised"
zil_ba=`ls -1 "$path"`
while IFS= read -r file
do
  echo "Synthesising with zilberberg baseline..."
  echo "$file"
  utt=$(cat "$path/$file")
  echo "$utt"
  python3 synthesize.py --text "$utt" --restore_step 90000 --mode single -p config/Herbikher/preprocess.yaml -m config/Herbikher/model.yaml -t config/Herbikher/train.yaml
done <<< "$zil_ba"

path="../yiddish-tts/test/gold-labs/zilberberg/b/normalised"
zil_bb=`ls -1 "$path"`
while IFS= read -r file
do
  echo "Synthesising with zilberberg baseline..."
  echo "$file"
  utt=$(cat "$path/$file")
  echo "$utt"
  python3 synthesize.py --text "$utt" --restore_step 90000 --mode single -p config/Herbikher/preprocess.yaml -m config/Herbikher/model.yaml -t config/Herbikher/train.yaml
done <<< "$zil_bb"


# unpointed
path="../yiddish-tts/test/gold-labs/zilberberg/a/unpointed"
zil_ua=`ls -1 "$path"`
while IFS= read -r file
do
  echo "Synthesising with zilberberg unpointed..."
  echo "$file"
  utt=$(cat "$path/$file")
  echo "$utt"
  python3 synthesize.py --text "$utt" --restore_step 90000 --mode single -p config/Herbikher-unpointed/preprocess.yaml -m config/Herbikher-unpointed/model.yaml -t config/Herbikher-unpointed/train.yaml
done <<< "$zil_ua"

path="../yiddish-tts/test/gold-labs/zilberberg/b/unpointed"
zil_ub=`ls -1 "$path"`
while IFS= read -r file
do
  echo "Synthesising with zilberberg unpointed..."
  echo "$file"
  utt=$(cat "$path/$file")
  echo "$utt"
  python3 synthesize.py --text "$utt" --restore_step 90000 --mode single -p config/Herbikher-unpointed/preprocess.yaml -m config/Herbikher-unpointed/model.yaml -t config/Herbikher-unpointed/train.yaml
done <<< "$zil_ub"