HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

zstyle :compinstall filename '/home/chris/.zshrc'

zstyle ":completion:*:(ssh|rsync|scp):*" hosts $hosts

autoload -Uz compinit
compinit

# Run startx on login
if [[ -z "${DISPLAY}" && "${XDG_VTNR}" -eq 1 ]]; then
    exec startx
fi

# Get name of current git branch
function git_branch_name {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo ' %{\x1b[38;2;216;222;233m%}on%{\x1b[0m%} %{\x1b[38;2;180;142;173m%}'$branch'%{\x1b[0m%}'
    fi
}

# Set prompt
setopt PROMPT_SUBST
PROMPT=$'%{\x1b[38;2;191;97;106m%}%n@%m%{\x1b[0m%} %{\x1b[38;2;216;222;233m%}in%{\x1b[0m%} %{\x1b[38;2;235;203;139m%}%1~%{\x1b[0m%}$(git_branch_name) %{\x1b[38;2;216;222;233m%}%#%{\x1b[0m%} '

# Fix for not being able to use backspace after switching to insert mode
bindkey "^?" backward-delete-char

# Fix pressing / right after ESC showing history and not searching
vi-search-fix() {
zle vi-cmd-mode
zle .vi-history-search-backward
}
autoload vi-search-fix
zle -N vi-search-fix
bindkey -M viins '\e/' vi-search-fix

# Change cursor to indicate current vi mode
function zle-line-init zle-keymap-select {
    case ${KEYMAP} in
        (vicmd) echo -e -n "\x1b[\x32 q" ;;
        (main)  echo -e -n "\x1b[\x36 q" ;;
    esac
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# SSH agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

alias ls="ls --color"
alias ll='ls -la'
alias s='ssh'
alias mbsync="mbsync --config ~/.config/mbsync/mbsyncrc"
alias v="nvim"
alias n="neomutt"
alias gs="git status"

autoload bashcompinit && bashcompinit
complete -C '/usr/bin/aws_completer' aws
