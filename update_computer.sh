#!/bin/sh

cp -f tmux.conf $HOME/.tmux.conf
cp -f Xresources $HOME/.Xresources
cp -f gitconfig $HOME/.gitconfig

cp -f vim/vimrc $HOME/.vimrc
mkdir -p $HOME/.config/nvim && ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim
mkdir -p $HOME/.vim/autoload && cp vim/autoload/* $HOME/.vim/autoload/
ln -s $HOME/.vim/autoload $HOME/.config/nvim/autoload

mkdir -p $HOME/.config/i3 && cp -f i3/* $HOME/.config/i3/
mkdir -p $HOME/.config/fish && cp -f fish/config.fish $HOME/.config/fish/config.fish
mkdir -p $HOME/.config/kitty && cp -f kitty.conf $HOME/.config/kitty/kitty.conf

cp -f wallpapers/* $HOME/Pictures/
