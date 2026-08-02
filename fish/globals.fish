###################################################
################### GLOBALS #######################
###################################################

# PATH
if not string match -q -- "$HOME/bin" $PATH
    set -gx PATH $PATH $HOME/bin
end

if not string match -q -- "$HOME/.local/bin" $PATH
    set -gx PATH $PATH $HOME/.local/bin
end

if not string match -q -- "$HOME/.cargo/bin" $PATH
    set -gx PATH $PATH $HOME/.cargo/bin
end

if not string match -q -- "$HOME/.fzf/bin" $PATH
    set -gx PATH $PATH "$HOME/.fzf/bin"
end

if test -d "$HOME/dev/lua-language-server/bin"; and not string match -q -- "$HOME/dev/lua-language-server/bin" $PATH
    set -gx PATH $PATH "$HOME/dev/lua-language-server/bin"
end

# Editor -- resolved fresh every session (not -U) so it always points at
# whichever machine's nvim you're actually on, instead of baking in one
# machine's absolute path.
if type -q nvim
    set -gx EDITOR (command -v nvim)
    set -gx VISUAL $EDITOR
end

# Icon spacing for exa/eza (ls)
set -gx EXA_ICON_SPACING 2

# Force cmake to create compile_commands.json
set -gx CMAKE_EXPORT_COMPILE_COMMANDS 1

# fzf use rg/ag, recomputed per-session since availability differs by machine
if type -q rg
    set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --smart-case --glob '!.git/*'"
else if type -q ag
    set -gx FZF_DEFAULT_COMMAND "ag --files --hidden --smart-case --glob '!.git/*'"
else
    set -gx FZF_DEFAULT_COMMAND "find . -type f"
end
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'

# Git prompt
# Enable the "informative" status (adds checkmarks, arrows, etc.)
set -g __fish_git_prompt_show_informative_status 1

# Enable colors based on the git state (dirty=red, clean=green, etc.)
set -g __fish_git_prompt_showcolorhints 1

# This adds the arrows (↑ ahead, ↓ behind, <> diverged)
set -g __fish_git_prompt_showupstream "auto"

set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_diverged "≠"

# Done notifications: no manual override -- the done plugin already picks
# osascript on macOS and notify-send on Linux on its own. A hardcoded
# osascript command here would silently no-op on Linux.
