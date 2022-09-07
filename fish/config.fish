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

# set -xU LESS_TERMCAP_md (printf "\e[01;31m")
# set -xU LESS_TERMCAP_me (printf "\e[0m")
# set -xU LESS_TERMCAP_se (printf "\e[0m")
# set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
# set -xU LESS_TERMCAP_ue (printf "\e[0m")
# set -xU LESS_TERMCAP_us (printf "\e[01;32m")

set fish_color_param 427b58

set -gx PATH $PATH $HOME/bin

set FZF_DEFAULT_COMMAND rg --files --hidden --smart-case --glob "!.git/*"

set -g __fish_git_prompt_show_informative_status
set -g __fish_git_prompt_showcolorhints

###################################################
################### ALIASES #######################
###################################################

# Random Aliases for extra stuff
alias xup="xrdb -load ~/.Xresources"
alias ls="ls --color=auto"
alias tree="tree -C"

# New commands if using an offline computer - uncomment if can install the latest versions
alias ranger="$HOME/bin/ranger/ranger.py"
alias ls="exa"
alias ll="exa -lh"
alias la="exa -alh"
alias p="ipython3"

# alias fn="nvim (fzf)"
alias f="fzf"
# alias nv="$HOME/bin/nvim"
# alias nvim="$HOME/bin/nvim"

# Git shortcuts
alias gits="git status -s"
alias gitd="git diff"
alias gitall="git add -u; git commit -m"

# Keyboard shortcuts
alias us="setxkbmap us"
alias uk="setxkbmap uk"

# Update shortcuts
alias update="sudo apt update && sudo apt upgrade"

# Aliases for rez
alias re="rez-env"
alias rb="rez-build -i"

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
