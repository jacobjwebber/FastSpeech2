#!/bin/sh

# phone
path="../yiddish-tts/test/gold-labs/zilberberg/a/respelt"
zil_ra=`ls -1 "$path"`
while IFS= read -r file
do
  echo "Synthesising with zilberberg phone..."
  echo "$file"
  utt=$(cat "$path/$file")

  python3 synthesize.py --text "$utt" --restore_step 90000 --mode single -p config/Herbikher/preprocess.yaml -m config/Herbikher/model.yaml -t config/Herbikher/train.yaml
done <<< "$zil_ra"

path="../yiddish-tts/test/gold-labs/zilberberg/b/respelt"
zil_rb=`ls -1 "$path"`
while IFS= read -r file
do
  echo "Synthesising with zilberberg phone..."
  echo "$file"
  utt=$(cat "$path/$file")

  python3 synthesize.py --text "$utt" --restore_step 90000 --mode single -p config/Herbikher/preprocess.yaml -m config/Herbikher/model.yaml -t config/Herbikher/train.yaml
done <<< "$zil_rb"