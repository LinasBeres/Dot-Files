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


####################################################
#################### PROMPT ########################
####################################################
function fish_prompt
  set last_status $status

  # rez env amount
  echo -n (set_color -o red)$REZ_ENV_PROMPT' '

  # username@hostname
  if [ (hostname -s) != "cs-gruvi-53s" ]
	  echo -n (set_color -o grey)'|'(set_color -o yellow)(whoami)(set_color -o red)@(set_color -o yellow)(hostname -s)(set_color -o grey)'|'
  end

  # pwd
	echo -n ' '(set_color cyan)(prompt_pwd) ''
  set_color -o normal

  # my classic fish ">>>" prompt
	echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color blue)'❯ '

  set_color normal
end

function fish_right_prompt
  set -l last_status $status

  echo -n (set_color blue)'❮'(set_color yellow)'❮'(set_color red)'❮'
  set_color -o normal
  echo (fish_git_prompt)
end

function fish_title
  echo $_ ' '
  pwd
end

function fish_greeting
  title
end

set fish_color_param 427b58


###################################################
########## PATHS & ENVIRON VARIABLES ##############
###################################################

# Path where my custom binaries are at
set -gx PATH $PATH $HOME/bin

# Defualt command for fzf to use
set FZF_DEFAULT_COMMAND rg --files --hidden --smart-case --glob "!.git/*"
# set FZF_DEFAULT_COMMAND ag

# Tell fish to show useful info on git prompt
set -g __fish_git_prompt_show_informative_status
set -g __fish_git_prompt_showcolorhints

###################################################
################### ALIASES #######################
###################################################

# Random Aliases for extra stuff
alias xup="xrdb -load ~/.Xresources"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -la --color=auto"
alias tree="tree -C"

# New commands if using an offline computer - uncomment if can install the latest versions
alias cat="$HOME/bin/ccat"
alias ranger="$HOME/bin/ranger/ranger.py"
alias ag="$HOME/bin/ag"

# Alias for ls/ll/la cus normal ls is ancient and sucks
# alias ls="exa"
# alias ll="exa -lh"
# alias la="exa -alh"

# God amognst men
alias f="fzf"

# Git shortcuts
alias gits="git status -s"
alias gitd="git diff"
alias gitall="git add -u; git commit -m"

# Keyboard shortcuts
alias us="setxkbmap us"
alias uk="setxkbmap uk"

# Update shortcuts
alias update="sudo apt update && sudo apt upgrade"

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
