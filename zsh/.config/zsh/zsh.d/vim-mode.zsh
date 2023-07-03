bindkey -v

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
