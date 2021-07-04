#!/bin/sh

input="dershlisl_test.txt"
while IFS= read -r line
do
  depointed=$(python3 ../yiddish-tts/depoint.py "$line")
  echo "Synthesising with Herbikher..."
  echo "$line"
  python3 synthesize.py --text "$line" --restore_step 75000 --mode single -p config/Herbikher/preprocess.yaml -m config/Herbikher/model.yaml -t config/Herbikher/train.yaml

  echo "Synthesising with Herbikher-unpointed..."
  echo "$depointed"
  python3 synthesize.py --text "$depointed" --restore_step 75000 --mode single -p config/Herbikher-unpointed/preprocess.yaml -m config/Herbikher-unpointed/model.yaml -t config/Herbikher-unpointed/train.yaml

  echo "Synthesising with Herbikher-phone..."
  echo "$depointed"
  python3 synthesize.py --text "$depointed" --restore_step 75000 --mode single -p config/Herbikher-phone/preprocess.yaml -m config/Herbikher-phone/model.yaml -t config/Herbikher-phone/train.yaml
done < "$input"