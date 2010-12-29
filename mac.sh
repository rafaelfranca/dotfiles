# Bash Completion (install bash-completion with homebrew to enable it
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

EDITOR="mvim -p"
export EDITOR="$EDITOR"

alias vi="$EDITOR"
alias vim="$EDITOR"

alias ls="ls -G"
alias gg="launch gitx"
alias c="clear"
