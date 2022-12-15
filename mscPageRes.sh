# Resize MuseScore pages in the current folder to fit the screen blank.
# First, go to Format > Style > Header, footer and disable header, to disable page numbers.
# Author: Luiz Guilherme de Medeiros Ventura
# v0.2 – for png files exported with 300DPI


SCREEN_W=1920
SCREEN_H=1080

MARGIN_W=60
MARGIN_H=60

let WIDTH="$SCREEN_W - $MARGIN_W"
let HEIGHT="$SCREEN_H - $MARGIN_H"

COUNT=0

#for i in *.png; do
#    if [ $COUNT -ge 1 ] # if count >= 1 to skip first page, which has no page num
#    then
#        convert "$i" -crop 3507x2266+0+215 "./trim/$i"; # for all pages with an index >= 1
#    else
#        cp "$i" "./trim/$i"; # for page 1
#    fi
#    let COUNT="$COUNT + 1"
#done

FILES=./trim/*.png

for i in *.png; do convert "$i" -trim "./trim/$i"; done

# This could be used (and still had to be extended to account for fitting the width as well) if the resize were so implemented, that it would fill the box. (there is actually a way to force it to do that, using a flag)
#for i in $FILES; do
#    HEIGHT=$(identify -format "%h" "$i");
#    WIDTH=$(identify -format "%w" "$i");
#    let NEW_H=$SCREEN_H;
#    let NEW_W="$SCREEN_H/$HEIGHT * $WIDTH";
#    convert "$i" -resize $NEW_Wx$NEW_H\> "$i";
#done

# But resize is implemented so that the image is fitted into the box. So, it gets simpler:

for i in $FILES; do
    convert "$i" -resize ${WIDTH}x${HEIGHT}\> "$i"; # the \> at the end of the command restricts it to only shrink images to fit into the size given. Never enlarge. 
done
