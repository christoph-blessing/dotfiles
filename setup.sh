#!/bin/sh

set -e 

dotfiles_dir="$HOME"/.local/share/dotfiles

git clone https://github.com/cblessing24/dotfiles.git "$dotfiles_dir"
stow --dir "$dotfiles_dir" --target "$HOME" flake8 git nvim pylint tmux zsh zshenv
