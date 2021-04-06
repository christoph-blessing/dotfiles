HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
setopt hist_ignore_all_dups

bindkey -v

zstyle :compinstall filename '/home/chris/.zshrc'

zstyle ":completion:*:(ssh|rsync|scp):*" hosts $hosts

fpath=( ~/.zfunc "${fpath[@]}" )

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
        echo ' %{\x1b[38;2;235;219;178m%}on%{\x1b[0m%} %{\x1b[38;2;211;134;155m%}'$branch'%{\x1b[0m%}'
    fi
}

# Set prompt
setopt PROMPT_SUBST
PROMPT=$'%{\x1b[38;2;251;73;52m%}%n@%m%{\x1b[0m%} %{\x1b[38;2;235;219;178m%}in%{\x1b[0m%} %{\x1b[38;2;250;198;47m%}%1~%{\x1b[0m%}$(git_branch_name) %{\x1b[38;2;216;222;233m%}%#%{\x1b[0m%} '

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
if ! [ -z "${XDG_RUNTIME_DIR}" ]; then
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
    fi
    if (( ! ${+SSH_AUTH_SOCK} )); then
        source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
    fi
fi

alias ls="ls --color"
alias ll='ls -la'
alias s='ssh'
alias mbsync="mbsync --config ~/.config/mbsync/mbsyncrc"
alias v="nvim"
alias n="neomutt"
alias nb="newsboat"

alias gs="git status"
alias gl="git log"
alias ga="git add"
alias gc="git commit -m"
alias gd="git diff"
alias gr="git reset"
alias gps="git push"
alias gpl="git pull"
alias gm="git merge"
alias gb="git branch"
alias gch="git checkout"
alias grb="git rebase"

autoload bashcompinit && bashcompinit
complete -C '/usr/bin/aws_completer' aws

export PYTHONBREAKPOINT=ipdb.set_trace
export PYTHONPATH='/home/chris/.local/pipx/venvs/pdm/lib/python3.9/site-packages/pdm/pep582':$PYTHONPATH

# Enter normal mode by pressing jj
bindkey 'jj' vi-cmd-mode

# Prepend __pypackages__/**/bin to PATH if present in current working directory or one of its ancestors
RAW_PATH=$PATH
LAST_WD=`pwd`
augment_path() {
    setopt nullglob
    target="__pypackages__/**/bin"
    if [ "$PWD" = "$LAST_WD" ]; then return 0; fi;
    path_addition=""
    scandir=$PWD
    until [ "$scandir" = "" ]; do
        resolved_target=($scandir/$~target)
        if [ ${#resolved_target[@]} != 0 ]; then
                path_addition=${resolved_target:0:1}:$path_addition
        fi
        scandir=${scandir%/*}
    done
    PATH=$path_addition:$RAW_PATH
    LAST_WD=`pwd`
    unsetopt nullglob
}

precmd() augment_path