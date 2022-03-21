function alias_if_exists {
    if type $2 > /dev/null; then
        alias $1=$2
    fi
    }

alias_if_exists sudo doas

alias_if_exists ls exa
alias ll="ls -la"

alias_if_exists cat bat

alias mbsync="mbsync --config ~/.config/mbsync/mbsyncrc"

alias_if_exists vim nvim

alias mutt="neomutt"

alias nb="newsboat"

alias df="df -h"

alias fzf="fzf-tmux"

alias gpg2="gpg2 --homedir $XDG_DATA_HOME/gnupg"

alias xbindkeys="xbindkeys -f $XDG_CONFIG_HOME/xbindkeys/config"

alias cdd="cd $XDG_DATA_HOME/dotfiles/"
alias cds="cd $XDG_DATA_HOME/scripts/"
alias cdn="cd $XDG_DATA_HOME/blessed-nvim/"

alias dc="docker-compose"

alias_if_exists grep rg

alias slock=~/scripts/lock.sh

alias g=git
