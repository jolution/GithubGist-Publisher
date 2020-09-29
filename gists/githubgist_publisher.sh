#!/bin/bash

#     _       _       _   _             
#    (_) ___ | |_   _| |_(_) ___  _ __  
#    | |/ _ \| | | | | __| |/ _ \| '_ \ 
#    | | (_) | | |_| | |_| | (_) | | | |
#   _/ |\___/|_|\__,_|\__|_|\___/|_| |_|
#  |__/                                 
#
# Github Gist Publisher
# v0.1

# open folder for gist to publish
cd ./publish/

# pick random a .gist file
FILENAME=$( find *.gist -type f -print0 | shuf -z -n 1 )

# Alternative: take all
#for FILENAME in *.gist; do
#done

# if file exists
if [ -f "$FILENAME" ]; then
    #echo $FILENAME;
    #echo "$(tail -n +2 hello.py)" | gh gist create -f hello.py -d "$(head -1 hello.py)"

    # take first line as comment and strip the rest as content and upload to github gist
    echo "$(tail -n +2 $FILENAME)" | gh gist create --public -f "$FILENAME" -d "$(head -1 $FILENAME)"

    # move file to backup folder
    mv "$FILENAME" "../backup/$FILENAME"
fi
