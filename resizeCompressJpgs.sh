#!/bin/bash

#In Ubuntu, the default shell /bin/sh is a symbolic link to /bin/dash - bash and dash have enough functionality in common that most people never realize the difference, but they are not identical (dash is meant to be lighter). Using dash, it doesn't work (gets somehow the file names wrong, can't interpret shopt), so I'm forcing to use bash with the first interpreted comment above.

shopt -s nocaseglob

resizePercent="$2" # scale factor
quality="$3" # from 0 to 100 in jpg, 100 is the best
#resizeConvexHull="3840x3840"

cd "$1" # change to directory called

if [ ! -d "converted" ]; then
mkdir converted
fi

for file in ./*.{jpg,jpeg}
do
	filename=$(basename -- "$file")
	extension="${filename##*.}"
	filename="${filename%.*}"
	outfile="${filename}.jpg"
	convert -strip -interlace Plane -gaussian-blur 0.02 -resize "${resizePercent}%" -filter Lanczos -quality "${quality}%" "$(readlink -f $file)" "$(readlink -f converted/$outfile)"
done

shopt -u nocaseglob
