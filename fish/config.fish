#################################################################################
################################## THE CONFIG ####################################
##################################################################################

####################################################
#################### COLOURS #######################
####################################################
set fish_color_normal normal
set fish_color_command --bold dfdfaf
set fish_color_quote --bold brown
set fish_color_redirection normal
set fish_color_end blue
set fish_color_error red
set fish_color_autosuggestion blue

set fish_color_match blue

set fish_color_search_match --background=blue

set fish_pager_color_prefix yellow
set fish_pager_color_completion -b=normal
set fish_pager_color_secondary --background=normal

function fish_title
    echo $_ ' '
    pwd
end

function fish_greeting
    title
end

set fish_color_param 427b58

# Functions for Brightness on all monitors
function bup
    set --local currentBrightness (xrandr --verbose | awk '/Brightness/ { print $2; exit }')
    set --local newBrightness (math $currentBrightness + 0.1)
    set --local monitors (xrandr | grep " connected " | awk '{ print$1 }')
    for monitor in $monitors;
        xrandr --output $monitor --brightness $newBrightness
    end
end

function bdown
  set --local currentBrightness (xrandr --verbose | awk '/Brightness/ { print $2; exit }')
  set --local newBrightness (math $currentBrightness - 0.1)
  set --local monitors (xrandr | grep " connected " | awk '{ print$1 }')
  for monitor in $monitors;
    xrandr --output $monitor --brightness $newBrightness
  end
end

# Git prompt
# 1. Enable the "informative" status (adds checkmarks, arrows, etc.)
set -g __fish_git_prompt_show_informative_status 1

# 2. Enable colors based on the git state (dirty=red, clean=green, etc.)
set -g __fish_git_prompt_showcolorhints 1

# 3. Show how you compare to the upstream (remote) branch
# This adds the arrows (↑ ahead, ↓ behind, <> diverged)
set -g __fish_git_prompt_showupstream "auto"

# Optional: Adding specific symbols if you want to customize the look
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_diverged "≠"

# Prompt source
source $HOME/.config/fish/prompt.fish

# Global environments source
source $HOME/.config/fish/globals.fish

# Alias source
source $HOME/.config/fish/alias.fish
