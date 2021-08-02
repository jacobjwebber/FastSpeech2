#!/bin/sh

zil_phone=`cat ../yiddish-tts/test/zilberberg-master-phone.tsv | awk -F'\t' '{print $2}'`
while IFS= read -r line
do
  echo "Synthesising with zilberberg phone..."
  echo "$line"
  python3 synthesize.py --text "$line" --restore_step 90000 --mode single -p config/Herbikher/preprocess.yaml -m config/Herbikher/model.yaml -t config/Herbikher/train.yaml
done < "$zil_phone"

sara_phone=`cat ../yiddish-tts/test/sara-master-phone.tsv | awk -F'\t' '{print $2}'`
while IFS= read -r line
do
  echo "Synthesising with sara phone..."
  echo "$line"
  python3 synthesize.py --text "$line" --restore_step 90000 --mode single -p config/Sara/preprocess.yaml -m config/Sara/model.yaml -t config/Sara/train.yaml
done < "$sara_phone"