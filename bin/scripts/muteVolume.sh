#!/bin/sh

pactl set-sink-mute 0 toggle

volumeMute=$(pactl get-sink-mute 0)

notify-send -u low "${volumeMute}"

