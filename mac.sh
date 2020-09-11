# Bash Completion (install bash-completion with homebrew to enable it
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

eval "$(rbenv init -)"

EDITOR="vim"
export EDITOR="$EDITOR"

alias vi="$EDITOR"

alias git=hub

alias ls="ls -G"
alias gg="open -a gitx"
alias c="clear"
export SKIP_BOOTSTRAP=1
export IM_ALREADY_PRO_THANKS=1
export DEV_ALLOW_RBENV=1
export JT_CACHE_TOOLCHAIN=true
export SDKROOT=`xcrun --show-sdk-path`

export PS1='[\[\033[0;34m\]${RUBY_VERSION:-$(rbenv version-name)} \[\033[0m\]\W$(__git_ps1 " \[\033[0;32m\](%s)\[\033[0m\]")]\$\[\033[0m\] '
