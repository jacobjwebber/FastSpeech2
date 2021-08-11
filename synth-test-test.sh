#!/bin/sh

input=`cat ../yiddish-tts/test/sara-master.tsv | awk -F'\t' '{print $2}'`
while IFS= read -r line
do
  echo "$line"
done < "$input"