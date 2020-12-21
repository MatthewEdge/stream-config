#!/bin/sh
cp ./twitch.nowplaying.file-writer.plist ~/Library/LaunchAgents/twitch.nowplaying.file-writer.plist
sudo chown root:wheel ~/Library/LaunchAgents/twitch.nowplaying.file-writer.plist
sudo launchctl load ~/Library/LaunchAgents/twitch.nowplaying.file-writer.plist

# to stop
#sudo launchctl unload ~/Library/LaunchAgents/twitch.nowplaying.file-writer.plist

