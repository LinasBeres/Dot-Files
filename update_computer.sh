#!/bin/sh

dnf makecache --refresh
dnf upgrade -y
dnf group install -y "Development Tools"

# Assume that we have cloned with all the submodules

cp -f bashrc $HOME/.bashrc
cp -f tmux.conf $HOME/.tmux.conf
cp -f Xresources $HOME/.Xresources
xrdb -load $HOME/.Xresources
cp -f gitconfig $HOME/.gitconfig

mkdir -p $HOME/.config/i3 && cp -f i3/* $HOME/.config/i3/
mkdir -p $HOME/.config/fish && cp -f fish/config.fish $HOME/.config/fish/config.fish
mkdir -p $HOME/.config/kitty && cp -f kitty.conf $HOME/.config/kitty/kitty.conf

cp -f wallpapers/* $HOME/Pictures/

mkdir -p $HOME/bin
cp -rf bin/scripts $HOME/bin/
cp -f bin/pipes.sh $HOME/bin/

# fzf
dnf install -y git
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

# Vim stuff
# Install recent version of nvim
dnf -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext curl
cd external/neovim/
rm -rf build/
mkdir -p $HOME/share/nvim
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/share/nvim"
make install
ln -s $HOME/Dot-Files/external/neovim/build/bin/nvim $HOME/bin/nvim
cd ../..

dnf install -y nodejs
cp -f vim/vimrc $HOME/.vimrc
mkdir -p $HOME/.config/nvim && ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim
mkdir -p $HOME/.vim/autoload && cp vim/autoload/* $HOME/.vim/autoload/
ln -s $HOME/.vim/autoload $HOME/.config/nvim/autoload
$HOME/bin/nvim +PlugInstall +qall
$HOME/bin/nvim +"CocInstall coc-json coc-tsserver" +qall

# Rust stuff
dnf install -y rust cargo
cargo install ripgrep
cargo install exa

# Other nice stuff
dnf install -y the_silver_searcher flashfetch clang-tools-extra firefox google-chrome-stable wget
pip install -U jedi-language-server

dnf install -y meson imlib2-devel libX11-devel libXfixes-devel
cd external/scrot
meson setup build
ninja -C build
ninja -C build install
# ln -s $HOME/Dot-Files/external/scrot/build/scrot $HOME/bin/scrot

cd ..
cd rofi
git pull
git submodule update --init
dnf install -y flex bison check pango-devel cairo-devel glib2-devel gdk-pixbuf2-devel startup-notification-devel libxkbcommon-devel libxkbcommon-x11-devel libxcb-devel libXinerama-devel libXrandr-devel xcb-util-devel xcb-util-wm-devel xcb-util-cursor-devel
autoreconf -i
mkdir build && cd build
../configure
make -j8
make install
# ln -s $HOME/Dot-Files/external/rofi/build/rofi $HOME/bin/rofi

cd ..
dnf install -y harfbuzz harfbuzz-devel
cd linas-st
make clean
make
cp bin/st $HOME/bin/st

cd ..
cd nerd-fonts
./install.sh
fc-cache -fv

cd ..
cd polybar
git submodule update --recursive
mkdir build
cd build
sudo dnf install -y gcc-c++ clang git cmake python3-sphinx python3-packaging
sudo dnf install -y cairo-devel libuv xcb-util-devel libxcb-devel xcb-proto xcb-util-image-devel xcb-util-wm-devel
sudo dnf install -y xcb-util-xrm-devel xcb-util-cursor-devel alsa-lib-devel pulseaudio-libs-devel i3-devel jsoncpp-devel libmpdclient-devel libcurl-devel wireless-tools-devel libnl3-devel
cmake ..
make -j5
sudo make install
cd ..

cd ../..

# slack
wget https://downloads.slack-edge.com/releases/linux/4.21.1/prod/x64/slack-4.21.1-0.1.fc21.x86_64.rpm
dnf install -y ./slack-4.21.1-0.1.fc21.x86_64.rpm
rm ./slack-4.21.1-0.1.fc21.x86_64.rpm

# Spotify
dnf install -y snapd
snap install spotify
