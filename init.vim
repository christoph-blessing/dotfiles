source ~/.config/nvim/plugins.vim
source ~/.config/nvim/plug-config/coc.vim

colorscheme nord
set expandtab
set number relativenumber
setlocal spell spelllang=en_us

let g:python3_host_prog='~/venv/pynvim/bin/python3'

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

autocmd FileType * setlocal formatoptions-=r formatoptions-=o
autocmd FileType yaml,markdown setlocal shiftwidth=2

autocmd FileType python setlocal shiftwidth=4
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
