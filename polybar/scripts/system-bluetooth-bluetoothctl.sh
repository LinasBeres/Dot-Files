#!/bin/bash

yellow=$(tput setaf 3)
brYellow=$(tput setaf 11)
normal=$(tput sgr0)

bluetooth_print() {
	bluetoothctl | while read -r; do
	if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
		if bluetoothctl show | grep -q "Powered: yes"; then
			bluetooth="%{F#C9A179}󰂯%{F-}"
		else
			bluetooth="%{F#af875f}󰂲%{F-}"
		fi

		devices_paired=$(bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2)
		counter=0

		devices=""
		for device in $devices_paired; do
			device_info=$(bluetoothctl info "$device")

			if echo "$device_info" | grep -q "Connected: yes"; then
				device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)

				if [ $counter -gt 0 ]; then
					devices="$devices, $device_alias"
				else
					devices="$devices $device_alias"
				fi

				counter=$((counter + 1))
			fi
		done

		echo $bluetooth"%{F#87afaf}"$devices"%{F-}"
	else
		echo "%{F#af875f}󰂲%{F-}"
	fi
done
}

bluetooth_toggle() {
	if bluetoothctl show | grep -q "Powered: no"; then
		bluetoothctl power on >> /dev/null
		notify-send -u low "Bluetooth switched on"
		sleep 1

		devices_paired=$(bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2)
		echo "$devices_paired" | while read -r line; do
			bluetoothctl connect "$line" >> /dev/null
		done
	else
		devices_paired=$(bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2)
		echo "$devices_paired" | while read -r line; do
			bluetoothctl disconnect "$line" >> /dev/null
		done

		bluetoothctl power off >> /dev/null
		notify-send -u low "Bluetooth switched off"
	fi
}

case "$1" in
	--toggle)
		bluetooth_toggle
		;;
	*)
		bluetooth_print
		;;
esac

