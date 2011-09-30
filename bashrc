for i in ~/.dotfiles/aliases/*.sh; do source $i ; done
for i in ~/.dotfiles/functions/*.sh; do source $i ; done

export HISTSIZE=100000
export HISTCONTROL="ignoreboth:erasedups"

CDPATH=".:~:~/Projects"
PATH="./b:/usr/local/bin:$PATH:/usr/local/sbin:~/Scripts"

# Load Mac-specific configurations
if [ $(uname) = "Darwin" ]; then . ~/.dotfiles/mac.sh ; fi

# Git.sh config
GIT_PS1_SHOWDIRTYSTATE="true" #show if there's unstaged changes

# Locale Configuration
export LC_ALL="en_US.UTF-8"

# Colors
export LSCOLORS="exfxbxdxcxegedabagacab"

#rbenv
PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
source "/usr/local/Cellar/rbenv/0.2.0/completions/rbenv.bash"

PS1='$(rbenv version-name) [\[\033[1;34m\]\u \[\033[0m\]\W$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")]\$\[\033[0m\] '
