# bash script to resize and compress all jpg files in the folder

resize="50" # scale factor
quality="80" # from 0 to 100 in jpg, 100 is the best

for file in ./*.JPG
do
	filename=$(basename -- "$file")
	extension="${filename##*.}"
	filename="${filename%.*}"
	outfile="${filename}_converted.jpg"
	convert -strip -interlace Plane -gaussian-blur 0.05 -resize "${resize}%" -quality "${quality}%" $file $outfile
done
