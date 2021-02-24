#!/bin/bash

if ! command -v zsh &> /dev/null
then
    echo "zsh could not be found"
    exit 1
fi

ln -f -s $PWD/.zshrc ~/.zshrc
ln -f -s $PWD/.zshenv ~/.zshenv
ln -f -s $PWD/.zfunc ~/.zfunc

ln -f -s $PWD/.gitconfig ~/.gitconfig
