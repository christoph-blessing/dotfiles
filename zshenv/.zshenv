[[ ":$PATH:" != *":${HOME}/.local/bin:"* ]] && PATH="${HOME}/.local/bin:${PATH}"

export EDITOR=nvim
export PYTHONPATH="$HOME/.local/pipx/venvs/pdm/lib/python3.9/site-packages/pdm/pep582:$PYTHONPATH"

export GOPATH="$HOME/go"
[[ ":$PATH:" != *":${GOPATH}/bin:"* ]] && PATH="${GOPATH}/bin:${PATH}"

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND='fd'
export FZF_ALT_C_COMMAND='fd --type d'

export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CACHE_HOME="$HOME"/.cache

export MYCLI_HISTFILE="$XDG_DATA_HOME"/mycli/history
export LESSHISTFILE="$XDG_DATA_HOME"/less/history
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

export CARGO_HOME="$XDG_DATA_HOME"/cargo
[[ ":$PATH:" != *":${CARGO_HOME}/bin:"* ]] && PATH="${CARGO_HOME}/bin:${PATH}"

ZDOTDIR="$XDG_CONFIG_HOME"/zsh
eval $(dircolors)
. "/home/chris/.local/share/cargo/env"

GPG_TTY=$(tty)
export GPG_TTY
