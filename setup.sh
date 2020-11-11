#!/bin/bash

if ! command -v zsh &> /dev/null
then
    echo "zsh could not be found"
    exit
fi

if ! command -v nvim &> /dev/null
then
    echo "nvim could not be found"
    exit
fi

ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/.zshenv ~/.zshenv

mkdir ~/.config/nvim
ln -s $PWD/init.vim ~/.config/nvim/init.vim
