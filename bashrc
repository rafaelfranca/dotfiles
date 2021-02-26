export HISTSIZE=100000
export HISTCONTROL="ignoreboth:erasedups"

CDPATH=".:~:~/src"

# Locale Configuration
export LC_ALL="en_US.UTF-8"

# Colors
export LSCOLORS="exfxbxdxcxegedabagacab"

# Aliases and functions
for i in ~/.dotfiles/aliases/*.sh ; do . $i ; done

if [ $(uname) = "Darwin" ]; then
  . ~/.dotfiles/mac.sh
elif [ $(uname) = "Linux" ]; then
  . ~/.dotfiles/linux.sh
fi

# Git.sh config
GIT_PS1_SHOWDIRTYSTATE="true" #show if there's unstaged changes

# Bash4 niceties
shopt -s globstar autocd

complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \ || complete -o default -o nospace -F _git g
