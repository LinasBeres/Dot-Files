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

direnv hook fish | source

# Prompt source
source $HOME/.config/fish/prompt.fish

# Global environments source
source $HOME/.config/fish/globals.fish

# Alias source
source $HOME/.config/fish/alias.fish

zoxide init fish | source

