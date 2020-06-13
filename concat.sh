#!/bin/bash
# Concatenate all intermediates from arg1 to arg2 using FFMPEG, generating a single video output.
# Use "convert-to-ts.sh" beforehand.
first=$1
last=$2
counter=$first
((counter++))
metaStr="concat:intermediate$first.ts"
while [ $counter -le $last ]
do
    metaStr="$metaStr|intermediate$counter.ts"
    ((counter++))
done
ffmpeg -i $metaStr -c copy -bsf:a aac_adtstoasc output.mp4
echo $metaStr
echo All done
