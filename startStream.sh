#!/bin/sh
osascript /Users/medge/code/stream/stream-config/setup.applescript

cp -f ./twitch.nowplaying.file-writer.plist ~/Library/LaunchAgents/twitch.nowplaying.file-writer.plist
launchctl load ~/Library/LaunchAgents/twitch.nowplaying.file-writer.plist

