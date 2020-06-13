
#!/bin/bash
# Convert all m4v MVI files to use the concat from FFMPEG, then.
counter=1
for value in $MVI_*.m4v
do
    ffmpeg -i $value -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate$counter.ts
    echo $counter
    ((counter++))
done
echo All done

