#!/bin/sh

pactl -- set-sink-volume 0 -5%

# Get current volume https://unix.stackexchange.com/questions/132230/read-out-pulseaudio-volume-from-commandline-i-want-pactl-get-sink-volume
currentVolume=$(pactl list sinks | grep '^[[:space:]]Volume:' | \
	head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

notify-send -u low "Volume Down - Current Volume: ${currentVolume}%"

