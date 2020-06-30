# Start Files to install

## Needed and "needed" packages
``` firmware-iwlwifi firmware-linux-nonfree vim rofi curl net-tools unrar i3 suckless-tools compton git curl chromium fish ethtool sudo lxappearance wine grep feh pulseaudio rxvt-unicode youtube-dl transmission debian-goodies vlc tmux tree htop build-essential libncurses5-dev unp mpv ranger pwgen ddate time sl oneko screenfetch xfce4-goodies i3blocks mpd ncmpcpp rxvt-unicode-256color neovim```

```The Silver Searcher```

## Sudo
Add user to sudo group: `su` then `adduser user sudo`

## Non-free
Open up `/etc/apt/sources.list` then change line to `deb http://ftp.uk.debian.org/debian/ stretch main contrib non-free` where `stretch` is your version of debian

## Fish
Fish as defualt cause it's awesome: `chsh -s (which fish)`

## Rofi
Create a .Xrescources file then reload with `xrdb -load ~/.Xresources`

## How to build fish (the long way)
Get the latest release of fish -> https://github.com/fish-shell/fish-shell/releases.
Get latest version of cmake compatible with fish, this _should_ exist on your system.

Let's assume that ncurses doesn't exist or does and is the wrong version. 
So therefore get the latest version -> https://ftp.gnu.org/pub/gnu/ncurses/ and install to wherever you want and I mean wherever.

Now comes the hard part, this is the cmake line to configure fish:
```
cmake -DCMAKE_PREFIX_PATH=/path/to/ncurses -DCMAKE_CXX_FLAGS="-I/path/to/ncurses/include" ..
```
This should find everything one needs to make fish. Then simply run `make` and voila there you have fish.
