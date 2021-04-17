[[ ":$PATH:" != *":${HOME}/.local/bin:"* ]] && PATH="${HOME}/.local/bin:${PATH}"
EDITOR=nvim
XDG_CONFIG_HOME="$HOME"/.config
XDG_DATA_HOME="$HOME"/.local/share
ZDOTDIR="$XDG_CONFIG_HOME"/zsh
PYTHONPATH='/home/chris/.local/pipx/venvs/pdm/lib/python3.9/site-packages/pdm/pep582':"$PYTHONPATH"

export MYCLI_HISTFILE="$XDG_DATA_HOME"/mycli/history
export LESSHISTFILE="$XDG_DATA_HOME"/less/history
