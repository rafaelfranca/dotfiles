export HISTSIZE=100000
export HISTCONTROL="ignoreboth:erasedups"

CDPATH=".:~:~/Projects"
PATH="$PATH:~/Scripts"
PATH="$HOME/Projects/github/elixir/bin:$PATH"

# Locale Configuration
export LC_ALL="en_US.UTF-8"

# Colors
export LSCOLORS="exfxbxdxcxegedabagacab"

# Aliases and functions
for i in ~/.dotfiles/{aliases,functions}/*.sh ; do . $i ; done

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

if [ $(uname) = "Darwin" ]; then
  . ~/.dotfiles/mac.sh
elif [ $(uname) = "Linux" ]; then
  . ~/.dotfiles/linux
fi

# Git.sh config
GIT_PS1_SHOWDIRTYSTATE="true" #show if there's unstaged changes

PS1='[\[\033[0;34m\]${RUBY_VERSION:-$(rbenv version-name)} \[\033[0m\]\W$(__git_ps1 " \[\033[0;32m\](%s)\[\033[0m\]")]\$\[\033[0m\] '

# Bash4 niceties
shopt -s globstar autocd

complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \ || complete -o default -o nospace -F _git g
