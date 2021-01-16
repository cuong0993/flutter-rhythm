# https://imagemagick.org/script/command-line-processing.php
# http://www.imagemagick.org/Usage/thumbnails/#labels
# https://imagemagick.org/Usage/annotating/
convert $1 \( +clone  -alpha extract -draw 'fill black polygon 0,0 0,10 10,0 fill white circle 10,10 10,0' \( +clone -flip \) -compose Multiply -composite \( +clone -flop \) -compose Multiply -composite \) -alpha off -compose CopyOpacity -composite $1.1tmp.png
convert -border 10x10 -bordercolor none $1.1tmp.png $1.2tmp.png
convert $1.2tmp.png -background "#4760e9" -gravity south -extent 2208x1242 $1.3tmp.png
convert $1.3tmp.png -gravity North -pointsize 80 -font Roboto-Condensed-Regular -fill "#ffffff" -annotate +0+10 "$2" $1.4tmp.png