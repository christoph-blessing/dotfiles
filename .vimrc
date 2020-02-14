set nocompatible
filetype indent plugin on
syntax on

set hidden
set wildmenu
set showcmd
set hlsearch

" Automatic package manager installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/tpope/vim-surround.git'
call plug#end()
