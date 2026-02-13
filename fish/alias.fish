###################################################
################### ALIASES #######################
###################################################

# Random Aliases for extra stuff
alias xup="xrdb -load ~/.Xresources"
alias weather="curl wttr.in"

# Force colours
alias ls="ls --color=auto"
alias tree="tree -C"

# ls alias
alias ls="eza --icons"
alias ll="eza --icons -lh"
alias la="eza --icons -alh"

# Git shortcuts
alias gits="git status -s"
alias gitd="git diff"
alias gitall="git add -u; git commit -m"

# Keyboard shortcuts
alias us="setxkbmap us"
alias uk="setxkbmap gb"

# flatpak
alias spotify="flatpak run com.spotify.Client"
alias signal="flatpak run org.signal.Signal"
alias touche="flatpak run com.github.joseexposito.touche"
alias steam="flatpak run com.valvesoftware.Steam"

# Shortcuts
alias p="ipython3"
alias f="fzf"

# Update shortcuts
alias update="sudo dnf upgrade"

# Aliases for rez
alias re="rez-env"
alias rb="rez-build -i"
alias rc="rez context"

# Alias for kitty image view
alias icat="kitty +kitten icat"

# Handles yazi
# So that on exit we enter fish shell in that directory
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
