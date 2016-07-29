#!/bin/bash
#
# fetches the first found image from $REDDIT_RSS subthread $SUB,
#+ converts it to your desktop size
#+ and sets it as wallpaper
 
# subreddit
# earthporn villageporn itookapicture specart ImaginaryLandscapes SpacePorn
SUB="earthporn"
 
# reddit rss-uri
REDDIT_RSS="http://www.reddit.com/r/"$SUB"/.rss"
 
WORKFOLDER="/home/cgada/Pictures/Wallpapers"
 
# convert the image to this size
IMAGE_SIZE="1600x1900"
 
# checks dependencies
#+
#+ @return 1: missing dependencies
#+ @return 0: all ok
check () {
 
    if [ -z `which wget` ]; then
        return 1
    fi
 
    if [ -z `which awsetbg` ]; then
        return 1
    fi
 
    return 0
}
 
# prepares $WORKFOLDER
#+
#+ @param workfolder
prepare () {
 
    if ! [ -f "$1" ]; then
        mkdir -p "$1";
    fi
}
 
# gets something from the internet
#+
#+ @param source
#+ @param target
iget () {
 
    wget -q "$1" -O "$2"
}
 
# exracts the image uri from the feed
#+
getimageuri () {
 
    IMAGEURI=`iget "$REDDIT_RSS" - | sed 's/i.img/\n&/g' | head -2 | tail -1 | cut -d "&" -f1 | sed 's/./http:\/\/&/'`
}
 
# fetches the image
#+
getimage () {
 
    getimageuri
 
    iget "$IMAGEURI" "$WORKFOLDER/jb.jpg"
}
 
# converts the image in other sizes
#+
#+ @param local image uri
convert () {
 
    TEMP="$WORKFOLDER/jb_tmp.jpg"
    cp "$1" "$TEMP"
    mogrify -resize 2560x -quality 100 "$TEMP"
    #mogrify -blur 128 -quality 100 "$TEMP"
    #composite -gravity center "$1" "$TEMP" "$TEMP"
 
    cp "$TEMP" "$1"
}
 
# sets the image as wallpaper
#
#+ @param local image uri
setwallpaper () {
 
    # awsetbg -f "$1"
#    gconftool-2 -t string -s /desktop/gnome/background/picture_filename "$1"
#gsettings set org.gnome.desktop.background picture-uri file://$WORKFOLDER/jb_tmp.jpg
feh --bg-scale file://$WORKFOLDER/jb_tmp.jpg 
}
 
check
if [ "$?" -eq "2" ]; then
    exit 1
fi
 
prepare "$WORKFOLDER"
getimage
convert "$WORKFOLDER/jb.jpg"
setwallpaper "$WORKFOLDER/jb.jpg"
