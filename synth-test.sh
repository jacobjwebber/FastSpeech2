#!/bin/sh

zil=`cat ../yiddish-tts/test/zilberberg-master.tsv | awk -F'\t' '{print $2}'`
while IFS= read -r line
do
  depointed=$(python3 ../yiddish-tts/depoint.py "$line")
  echo "Synthesising with zilberberg baseline..."
  echo "$line"
  python3 synthesize.py --text "$line" --restore_step 90000 --mode single -p config/Herbikher/preprocess.yaml -m config/Herbikher/model.yaml -t config/Herbikher/train.yaml

  echo "Synthesising with zilberberg unpointed..."
  echo "$depointed"
  python3 synthesize.py --text "$depointed" --restore_step 90000 --mode single -p config/Herbikher-unpointed/preprocess.yaml -m config/Herbikher-unpointed/model.yaml -t config/Herbikher-unpointed/train.yaml
done < "$zil"

sara=`cat ../yiddish-tts/test/sara-master.tsv | awk -F'\t' '{print $2}'`
while IFS= read -r line
do
  depointed=$(python3 ../yiddish-tts/depoint.py "$line")
  echo "Synthesising with sara baseline..."
  echo "$line"
  python3 synthesize.py --text "$line" --restore_step 90000 --mode single -p config/Sara/preprocess.yaml -m config/Sara/model.yaml -t config/Sara/train.yaml

  echo "Synthesising with sara unpointed..."
  echo "$depointed"
  python3 synthesize.py --text "$depointed" --restore_step 90000 --mode single -p config/Sara-unpointed/preprocess.yaml -m config/Sara-unpointed/model.yaml -t config/Sara-unpointed/train.yaml
done < "$sara"
