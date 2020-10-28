# bash script for stabilising video using FFMPEG

video=$1
filename=$(basename -- "$video")
	extension="${filename##*.}"
	filename="${filename%.*}"

outfile="${filename}_ffmpeg_stab.m4v"

ffmpeg -i $video -vf vidstabdetect -f null -
ffmpeg -i $video -vf vidstabtransform=input="transforms.trf" $outfile
