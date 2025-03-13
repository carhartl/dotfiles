#!/usr/bin/osascript

# @raycast.title Open Chrome URL in Safari
# @raycast.description Open current Chrome URL in new tab in Safari
# @raycast.author Klaus Hartl
# @raycast.authorURL https://github.com/carhartl

# @raycast.mode silent
# @raycast.packageName Google Chrome
# @raycast.schemaVersion 1

tell application "Google Chrome"
	set chromeUrl to URL of active tab of first window
end tell

tell application "Safari"
	tell front window
		set current tab to (make new tab with properties {URL:chromeUrl})
	end tell
	activate
end tell
