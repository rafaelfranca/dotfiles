eval "$(rbenv init -)"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
