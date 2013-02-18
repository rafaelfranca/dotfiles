# Bash Completion (install bash-completion with homebrew to enable it
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/share/git-core/contrib/completion/git-prompt.sh ]; then
  . $(brew --prefix)/share/git-core/contrib/completion/git-prompt.sh
fi

EDITOR="mvim -v"
export EDITOR="$EDITOR"

alias vi="$EDITOR"
alias vim="$EDITOR"
alias vimdiff="mvimdiff -v"

alias ls="ls -G"
alias gg="open -a gitx"
alias c="clear"
