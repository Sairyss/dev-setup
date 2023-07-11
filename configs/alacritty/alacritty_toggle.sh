#!/bin/bash

# bind this script to a hotkey to toggle alacritty terminal on press

PID=$(pgrep -o alacritty)
if [ -z "$PID" ]; then
	alacritty &
	exit 0
fi

WINDOWID=$(xdotool search --pid $PID)
IS_VISIBLE=true
[ -z $(xdotool search --onlyvisible --pid $PID) ] && IS_VISIBLE=false

[ $(xdotool getwindowfocus) != "$WINDOWID" ] && {
	if [ $IS_VISIBLE == true ]; then
		xdotool windowactivate $WINDOWID
	else
		xdotool windowmap $WINDOWID
	fi

	exit 0
}

xdotool windowunmap $WINDOWID
