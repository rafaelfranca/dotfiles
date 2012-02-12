# Bash Completion (install bash-completion with homebrew to enable it
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

EDITOR="mvim -v"
export EDITOR="$EDITOR"

alias vi="$EDITOR"
alias vim="$EDITOR"
alias vimdiff="mvimdiff -v"

alias ls="ls -G"
alias gg="open -a gitx"
alias c="clear"
