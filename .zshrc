# Set up the prompt
fpath=(~/.zsh/pure $fpath)

autoload -Uz promptinit
promptinit
prompt pure

setopt histignorealldups sharehistory

bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Set environment variable to be able to use Docker Desktop in WSL
if uname -r | grep -q 'Microsoft' ; then
	export DOCKER_HOST=tcp://localhost:2375
fi

# Set environment variable specifying directory for screen
export SCREENDIR=$HOME/.screen

# Colorize ls output
alias ls='ls --color=auto'
# Use long listing format
alias ll='ls -la'

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

# Add Go to path
export PATH=/usr/local/go/bin:$PATH

# For bspwm
export XDG_CONFIG_HOME=$HOME/.config
