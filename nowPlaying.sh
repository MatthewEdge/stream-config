#!/bin/bash
# Adds the currently playing iTunes track to a text file for an OBS text label.
# Credit: https://github.com/noopkat/twitch-scripts/blob/master/nowPlaying.sh
SONG=`osascript /Users/medge/code/stream/stream-config/itunes.applescript`
echo -e $SONG > /Users/medge/Stream/custom-labels/now-playing.txt
