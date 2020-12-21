-- Get bounds with Script Editor:
-- tell application "XYZ" to get the bounds of front window

set streamName to "medgelabs"
set alertBoxUrl to system attribute "ALERT_BOX_URL"

set streamRegionWidth to 1600
set streamRegionHeight to 1380
set secretRegionStartX to 1610
set offScreenX to 2270
set offScreenY to 1400

-- start Streamlabs and minimise it
tell application "OBS" to activate
delay 2
tell application "System Events" to tell process "OBS"
	set position of window 1 to {secretRegionStartX, 0}
end tell

-- Chat Window
tell application "Firefox" to activate
tell application "System Events" to keystroke "n" using {command down}
delay 1
tell application "Firefox"
	open location alertBoxUrl
	open location "https://www.twitch.tv/popout/" & streamName & "/chat?popout="
	set bounds of front window to {1709, 790, 2159, 1400}
end tell

-- iTerm setup
tell application "iTerm"
	set bounds of front window to {0, 0, streamRegionWidth, streamRegionHeight}
end tell

tell application "System Events"
	tell process "iTerm2"
		click menu item "Stream" of menu "Profiles" of menu bar 1
	end tell
end tell

-- Music
-- switch sound output to custom multi-output device
tell application "System Preferences"
	reveal anchor "output" of pane id "com.apple.preference.sound"
	activate
end tell

tell application "System Events"
	tell application process "System Preferences"
		tell tab group 1 of window "Sound"
			select (row 1 of table 1 of scroll area 1 where value of text field 1 is "TwitchStream")
		end tell
	end tell
end tell
quit application "System Preferences"

-- Loopback audio fix
tell application "Loopback" to activate
tell application "System Events" to tell process "Loopback"
	set position of window 1 to {offScreenX, offScreenY}
end tell

tell application "Music"
	activate
	play user playlist "Stream"
end tell

-- position itunes in the bottom right corner
tell application "System Events" to tell process "Music"
	set position of window 1 to {offScreenX - 200, offScreenY}
end tell

-- Stream Manager for title
tell application "Firefox" to activate
tell application "System Events" to keystroke "n" using {command down}
delay 1
tell application "Firefox"
	open location "https://dashboard.twitch.tv/u/" & streamName & "/stream-manager"
	set bounds of front window to {0, 0, 1400, 1400}
end tell

-- Main code sites
tell application "Firefox"
	activate
	open location "https://trello.com/b/5lpV7uj9/stream-bot"
	open location "https://github.com/medgelabs/stream-bot"
end tell
