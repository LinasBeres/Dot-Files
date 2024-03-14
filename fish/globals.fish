###################################################
################### GLOBALS #######################
###################################################

# PATH
if not string match -q -- "$HOME/bin" $PATH
    set -Ux PATH $PATH $HOME/bin
end

if not string match -q -- "$HOME/.local/bin" $PATH
    set -Ux PATH $PATH $HOME/.local/bin
end

if not string match -q -- "$HOME/.cargo/bin" $PATH
    set -Ux PATH $PATH $HOME/.cargo/bin
end

if not string match -q -- "$HOME/.fzf/bin" $PATH
    set -Ux PATH $PATH "$HOME/.fzf/bin"
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

# fish git
set -Ux __fish_git_prompt_show_informative_status
set -Ux __fish_git_prompt_showcolorhints
