source ~/.config/nvim/plugins.vim
source ~/.config/nvim/plug-config/ale.vim
source ~/.config/nvim/plug-config/airline.vim
source ~/.config/nvim/plug-config/supertab.vim

colorscheme nord
set hidden
set expandtab
set number relativenumber
set updatetime=100
setlocal spell spelllang=en_us

let g:python3_host_prog='~/venv/pynvim/bin/python3'

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

imap jj <Esc>

autocmd FileType * setlocal formatoptions-=r formatoptions-=o
autocmd FileType yaml,markdown,json setlocal shiftwidth=2
autocmd FileType python setlocal completeopt-=preview

