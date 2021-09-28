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

	echo -n (set_color --bold grey)'|'(set_color --bold yellow)$HOST(set_color --bold grey)'|'

	echo -n ' '(set_color cyan)(prompt_pwd) ''
  set_color -o normal

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

set SASS_LIBSASS_PATH '/usr/local/lib/libsass'

set fish_color_param 427b58

set -gx PATH $PATH $HOME/bin

set FZF_DEFAULT_COMMAND ag

###################################################
################### ALIASES #######################
###################################################

# Random Aliases for extra stuff
alias xup="xrdb -load ~/.Xresources"
alias ls="ls --color=auto"
alias tree="tree -C"

# New commands if using an offline computer - uncomment if can install the latest versions
alias cat="$HOME/bin/ccat"
alias ranger="$HOME/bin/ranger/ranger.py"
alias ag="$HOME/bin/ag"
alias ls="ls_extended"
alias ll="ls_extended -l"
alias la="ls_extended -al"
alias fzy="$HOME/bin/fzy"
alias fish="$HOME/bin/fish-3.0.2/fish"

# alias fn="nvim (fzf)"
alias f="fzf"
# alias nv="$HOME/bin/nvim"
# alias nvim="$HOME/bin/nvim"

# Git shortcuts
alias gits="git status -s"
alias gitd="git diff"
alias gitall="git add -u; git commit -m"

# command /u/libe/bin/fish-3.0.2/fish
