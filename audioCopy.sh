# bash script to copy audio from MOV files into m4v files with the same name prefix.
# Used because sometimes Handbrake converts a video file, but cannot convert the audio strip, so the resulting file has no audio.
# example use: vid.MOV (with audio) vid.m4v (without audio) --> vid.mp4 (with video from m4v and audio from MOV)
#
# Attention: file name and extension are case-sensitive. So, MOV is different than mov or Mov or MoV or anything else

for movfile in ./*.MOV
do
	filename=$(basename -- "$movfile")
	extension="${filename##*.}"
	filename="${filename%.*}"
	m4vfile="${filename}.m4v"
	outfile="${filename}.mp4"
	ffmpeg -i $m4vfile -i $movfile -c:v copy -map 0:v:0 -map 1:a:0 $outfile
done
