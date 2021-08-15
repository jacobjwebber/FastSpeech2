#!/bin/sh

nvidia-smi

# zilberberg baseline
zil_b=`cat ../yiddish-tts/test/eliezer/eliezer-test-baseline.txt`
while IFS= read -r utt
do
  echo "Synthesising with zilberberg baseline..."
  echo "$utt"
  python3 synthesize.py --text "$utt" --restore_step 90000 --mode single -p config/Herbikher/preprocess.yaml -m config/Herbikher/model.yaml -t config/Herbikher/train.yaml
done <<< "$zil_b"

# zilberberg unpointed
zil_u=`cat ../yiddish-tts/test/eliezer/eliezer-test-unpointed.txt`
while IFS= read -r utt
do
  echo "Synthesising with zilberberg unpointed..."
  echo "$utt"
  python3 synthesize.py --text "$utt" --restore_step 90000 --mode single -p config/Herbikher-unpointed/preprocess.yaml -m config/Herbikher-unpointed/model.yaml -t config/Herbikher-unpointed/train.yaml
done <<< "$zil_u"

# sara baseline
sara_b=`cat ../yiddish-tts/test/eliezer/eliezer-test-baseline.txt`
while IFS= read -r utt
do
  echo "Synthesising with sara baseline..."
  echo "$utt"
  python3 synthesize.py --text "$utt" --restore_step 90000 --mode single -p config/Sara/preprocess.yaml -m config/Sara/model.yaml -t config/Sara/train.yaml
done <<< "$sara_b"

# sara unpointed
sara_u=`cat ../yiddish-tts/test/eliezer/eliezer-test-unpointed.txt`
while IFS= read -r utt
do
  echo "Synthesising with sara unpointed..."
  echo "$utt"
  python3 synthesize.py --text "$utt" --restore_step 90000 --mode single -p config/Sara-unpointed/preprocess.yaml -m config/Sara-unpointed/model.yaml -t config/Sara-unpointed/train.yaml
done <<< "$sara_u"

mv output/result/Herbikher output/result/Herbikher-baseline
mv output/result/Herbikher-phone output/result/Herbikher

mv output/result/Sara output/result/Sara-baseline
mv output/result/Sara-phone output/result/Sara

# zilberberg phone
zil_p=`cat ../yiddish-tts/test/eliezer/eliezer-test-respelt.txt`
while IFS= read -r utt
do
  echo "Synthesising with zilberberg phone..."
  echo "$utt"
  python3 synthesize.py --text "$utt" --restore_step 90000 --mode single -p config/Herbikher/preprocess.yaml -m config/Herbikher/model.yaml -t config/Herbikher/train.yaml
done <<< "$zil_p"

# sara phone
sara_p=`cat ../yiddish-tts/test/eliezer/eliezer-test-respelt.txt`
while IFS= read -r utt
do
  echo "Synthesising with sara phone..."
  echo "$utt"
  python3 synthesize.py --text "$utt" --restore_step 90000 --mode single -p config/Sara/preprocess.yaml -m config/Sara/model.yaml -t config/Sara/train.yaml
done <<< "$sara_p"


mv output/result/Herbikher output/result/Herbikher-phone
mv output/result/Sara output/result/Sara-phone

