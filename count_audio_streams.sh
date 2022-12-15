#!/bin/bash
# Call this command from any folder containing videos and give the video extension as argument. It will output the video name and the number of audio tracks that it has. It is an easy way to spot videos with no audio tracks, e.g., time lapse or other videos with no audio from the camera. Videos can have more than one audio track as well.

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
fi

extension=$1

for file in *."$extension"; do
    echo -n "$file"
    echo -n ":		"
    ffprobe -v error -select_streams a -show_entries stream=index -of csv=p=0 "$file" | wc -w
done
