###################################################
################### ALIASES #######################
###################################################
# abbr instead of alias: expands to the real command text on the line before
# you hit enter, so history shows the actual command, not the shortcut name.
# Trade-off: abbreviations only expand in the interactive line editor -- they
# do nothing inside scripts or `fish -c`, unlike alias (a real function).

abbr -a weather "curl wttr.in"
abbr -a tree "tree -C"

# ls alias
abbr -a ls "eza --icons"
abbr -a ll "eza --icons -lh"
abbr -a la "eza --icons -alh"

# Git shortcuts
abbr -a gits "git status -s"
abbr -a gitd "git diff"
abbr -a gitall "git add -u; git commit -m"

# Shortcuts
abbr -a p "ipython3"
abbr -a f "fzf"

# Aliases for rez
abbr -a re "rez-env"
abbr -a rb "rez-build -i"
abbr -a rc "rez context"

# Package manager update -- OS-specific
switch (uname)
    case Darwin
        abbr -a update "brew update; and brew upgrade"
    case Linux
        abbr -a update "sudo dnf upgrade"
end

# X11 desktop extras (Linux only -- only defined if the tool is actually there)
if type -q xrdb
    abbr -a xup "xrdb -load ~/.Xresources"
end
if type -q setxkbmap
    abbr -a us "setxkbmap us"
    abbr -a uk "setxkbmap gb"
end

# Flatpak apps (Linux only)
if type -q flatpak
    abbr -a spotify "flatpak run com.spotify.Client"
    abbr -a signal "flatpak run org.signal.Signal"
    abbr -a touche "flatpak run com.github.joseexposito.touche"
    abbr -a steam "flatpak run com.valvesoftware.Steam"
end

# kitty image viewer -- only defined if kitty is installed
if type -q kitty
    abbr -a icat "kitty +kitten icat"
end

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
