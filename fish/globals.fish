###################################################
################### GLOBALS #######################
###################################################

# PATH
if not string match -q -- "$HOME/bin" $PATH
    set -gx PATH $PATH $HOME/bin
end

if not string match -q -- "$HOME/.local/bin" $PATH
    set -qx PATH $PATH $HOME/.local/bin
end

if not string match -q -- "$HOME/.cargo/bin" $PATH
    set -qx PATH $PATH $HOME/.cargo/bin
end

if not string match -q -- "$HOME/.fzf/bin" $PATH
    set -qx PATH $PATH "$HOME/.fzf/bin"
end

# Editor
set -qx VISUAL (which nvim)
set -qx EDITOR $VISUAL

# Icon spacing for exa (ls)
set -qx EXA_ICON_SPACING 2

# Force cmake to create compile_commands.json
set -qx CMAKE_EXPORT_COMPILE_COMMANDS 1

# fzf use rg/ag
if type -q rg
    set -qx FZF_DEFAULT_COMMAND rg --files --hidden --smart-case --glob "!.git/*"
elif type -q ag
    set -qx FZF_DEFAULT_COMMAND ag --files --hidden --smart-case --glob "!.git/*"
else
    set -qx FZF_DEFAULT_COMMAND grep --files --hidden --smart-case --glob "!.git/*"A
end

# fish git
set -gx __fish_git_prompt_show_informative_status
set -gx __fish_git_prompt_showcolorhints
