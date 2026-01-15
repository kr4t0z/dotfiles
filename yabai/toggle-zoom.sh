#!/bin/bash
# Get window from frontmost app on current space
FRONT_APP=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true')
FRONT_APP_LOWER=$(echo "$FRONT_APP" | tr '[:upper:]' '[:lower:]')
WINDOW_ID=$(yabai -m query --windows --space | jq -r ".[] | select(.app | ascii_downcase == \"$FRONT_APP_LOWER\") | .id" | head -1)

if [ -n "$WINDOW_ID" ]; then
    yabai -m window "$WINDOW_ID" --toggle zoom-fullscreen
fi
