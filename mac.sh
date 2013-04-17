# Bash Completion (install bash-completion with homebrew to enable it
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

EDITOR="mvim -v"
export EDITOR="$EDITOR"
export REDIS_URL="$BOXEN_REDIS_URL"
export REDIS_PORT="$BOXEN_REDIS_PORT"
export MONGODB_PORT="$BOXEN_MONGODB_PORT"

alias vi="$EDITOR"
alias vim="$EDITOR"
alias vimdiff="mvimdiff -v"

alias ls="ls -G"
alias gg="open -a gitx"
alias c="clear"
