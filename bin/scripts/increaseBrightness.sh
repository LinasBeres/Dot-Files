#!/bin/sh

let "max=$(brightnessctl max)"
let "current=$(brightnessctl get) * 100"

let "percentage=$current / $max"

if [ "$percentage" -lt 10 ]; then
	brightnessctl set +1%
else
	brightnessctl set +5%
fi

