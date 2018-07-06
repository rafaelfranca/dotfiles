# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

EDITOR="vim"
export EDITOR="$EDITOR"
alias vi="$EDITOR"

alias ls="ls -G"
alias c="clear"
alias ack="ack-grep"

export PS1='[\[\033[0m\]\W$(__git_ps1 " \[\033[0;32m\](%s)\[\033[0m\]")]\$\[\033[0m\] '
