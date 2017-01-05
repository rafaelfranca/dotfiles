# Bash Completion (install bash-completion with homebrew to enable it
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

eval "$(rbenv init -)"

EDITOR="mvim -v"
export EDITOR="$EDITOR"

alias vi="$EDITOR"
alias vim="$EDITOR"
alias vimdiff="mvimdiff -v"

alias git=hub

alias ls="ls -G"
alias gg="open -a gitx"
alias c="clear"
export SKIP_BOOTSTRAP=1
export IM_ALREADY_PRO_THANKS=1
