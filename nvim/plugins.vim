" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Specify plugins
call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
call plug#end()

" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
