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

if not string match -q -- "$HOME/dev/lua-language-server/bin" $PATH
    set -gx PATH $PATH "$HOME/dev/lua-language-server/bin"
end

# Editor
set -Ux VISUAL (which nvim)
set -Ux EDITOR $VISUAL

# Icon spacing for exa (ls)
set -Ux EXA_ICON_SPACING 2

# Force cmake to create compile_commands.json
set -Ux CMAKE_EXPORT_COMPILE_COMMANDS 1

# fzf use rg/ag
if type -q rg
    set -Ux FZF_DEFAULT_COMMAND "rg --files --hidden --smart-case --glob '!.git/*'"
else if type -q ag
    set -Ux FZF_DEFAULT_COMMAND ag --files --hidden --smart-case --glob "!.git/*"
else
    set -Ux FZF_DEFAULT_COMMAND grep --files --hidden --smart-case --glob "!.git/*"A
end

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

# For Done
set -U __done_notification_command 'osascript -e "display notification \"$message\" with title \"$title\""'
