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

# Set prompt
PS1="%F{131}%B%n@%m%b%f %F{186}%~%f %F{139}%#%f "

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
