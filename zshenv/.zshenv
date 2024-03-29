[[ ":$PATH:" != *":${HOME}/.local/bin:"* ]] && PATH="${HOME}/.local/bin:${PATH}"

export EDITOR=nvim
export PYTHONPATH="$HOME/.local/pipx/venvs/pdm/lib/python3.9/site-packages/pdm/pep582:$PYTHONPATH"

export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CACHE_HOME="$HOME"/.cache

export MYCLI_HISTFILE="$XDG_DATA_HOME"/mycli/history
export LESSHISTFILE="$XDG_DATA_HOME"/less/history
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export MAILDIR="$XDG_DATA_HOME"/mail
export SCRIPTDIR="$HOME"/scripts

export MCFLY_KEY_SCHEME=vim
export MCFLY_FUZZY=2

export GNUPGHOME="$XDG_DATA_HOME"/gnupg
if [[ ! -d "$GNUPGHOME" ]]; then
  mkdir -p "$GNUPGHOME"
  chmod 700 "$GNUPGHOME"
fi

export GOPATH="$XDG_DATA_HOME/go"
[[ ":$PATH:" != *":${GOPATH}/bin:"* ]] && PATH="${GOPATH}/bin:${PATH}"

export CARGO_HOME="$XDG_DATA_HOME"/cargo
[[ ":$PATH:" != *":${CARGO_HOME}/bin:"* ]] && PATH="${CARGO_HOME}/bin:${PATH}"

ZDOTDIR="$XDG_CONFIG_HOME"/zsh
eval $(dircolors)

cargo_env='/home/chris/.local/share/cargo/env'
if [ -f "$cargo_env" ]; then
    . "$cargo_env"
fi

GPG_TTY=$(tty)
export GPG_TTY

infocmp tmux-256color &> /dev/null
if [ $? -eq 1 ]; then
    export TERM=xterm-256color
fi

if type systemctl > /dev/null; then
    systemctl --user import-environment \
        XDG_DATA_HOME \
        XDG_CONFIG_HOME \
        XDG_CACHE_HOME \
        GNUPGHOME
fi
