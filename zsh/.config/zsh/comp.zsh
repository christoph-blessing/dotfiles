zstyle ":completion:*:(ssh|rsync|scp):*" hosts $hosts

zstyle ':completion:*' menu select
autoload -Uz compinit
compinit

# Use shift+tab for going backward in completion menu
zmodload -i zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

autoload bashcompinit && bashcompinit
complete -C '/usr/bin/aws_completer' aws
