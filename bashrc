for i in "~/.dotfiles/aliases/*.sh"; do source $i ; done
for i in "~/.dotfiles/functions/*.sh"; do source $i ; done

export HISTSIZE=100000
export HISTCONTROL="ignoreboth:erasedups"

cdpath=(~ ~/Projetos)
