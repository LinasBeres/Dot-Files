# Start Files to install

## Needed and "needed" packages
``` firmware-iwlwifi firmware-linux-nonfree vim rofi curl net-tools unrar i3 suckless-tools compton git curl chromium fish ethtool sudo lxappearance wine grep feh pulseaudio rxvt-unicode youtube-dl transmission debian-goodies vlc tmux tree htop build-essential libncurses5-dev unp mpv ranger pwgen ddate time sl oneko screenfetch xfce4-goodies i3blocks mpd ncmpcpp rxvt-unicode-256color```

## Sudo
Add user to sudo group: `su` then `adduser user sudo`

## Non-free
Open up `/etc/apt/sources.list` then change line to `deb http://ftp.uk.debian.org/debian/ stretch main contrib non-free` where `stretch` is your version of debian

## Fish
Fish as defualt cause it's awesome: `chsh -s (which fish)`

## Rofi
Create a .Xrescources file then reload with `xrdb -load ~/.Xresources`
