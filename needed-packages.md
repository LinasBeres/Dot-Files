# Start Files to install

## List begins as follows:
``` firmware-iwlwifi firmware-linux-nonfree vim rofi curl net-tools unrar i3 suckless-tools compton git curl chromium fish ethtool sudo lxappearance wine grep feh pulseaudio```

## Sudo
Add user to sudo group: `su` then `adduser user sudo`

## Non-free
Open up `/etc/apt/sources.list` then change line to `deb http://ftp.uk.debian.org/debian/ stretch main contrib non-free` where `stretch` is your version of debian

