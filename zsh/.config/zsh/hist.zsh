if [ ! -d "$XDG_DATA_HOME"/zsh ]; then
    mkdir -p "$XDG_DATA_HOME"/zsh
fi

HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=10000000
SAVEHIST=10000000
setopt hist_ignore_all_dups
