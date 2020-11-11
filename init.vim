call plug#begin()
" Nord theme (https://www.nordtheme.com/)
Plug 'arcticicestudio/nord-vim'
" Surround stuff with brackets and stuff
Plug 'tpope/vim-surround'
call plug#end()

colorscheme nord

set expandtab
set shiftwidth=4

set number relativenumber

autocmd FileType * setlocal formatoptions-=r formatoptions-=o
        
