" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Specify plugins
call plug#begin()
" Nord theme (https://www.nordtheme.com/)
Plug 'arcticicestudio/nord-vim'
" Surround stuff with brackets and stuff
Plug 'tpope/vim-surround'
call plug#end()

" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

colorscheme nord

set expandtab
set shiftwidth=4

set number relativenumber

autocmd FileType * setlocal formatoptions-=r formatoptions-=o
        
