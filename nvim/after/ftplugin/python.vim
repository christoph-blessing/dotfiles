set omnifunc=ale#completion#OmniFunc

"Configuration for Asynchronous Lint Engine (ALE)
let g:ale_python_auto_pipenv = 1
let g:ale_python_mypy_options = '--ignore-missing-imports'
let b:ale_linters = ['pyls', 'mypy', 'pydocstyle']
let b:ale_fixers = ['black', 'isort']

"Key mappings
map <F6> :exec 'ALERename'<CR>
imap <F6> <esc>:exec 'ALERename'<CR>
map <buffer> <F9> :w<CR>:sp<CR>:exec 'term python' shellescape(@%, 1)<CR>i
imap <buffer> <F9> <esc>:w<CR>:sp<CR>:exec 'term python' shellescape(@%, 1)<CR>i
map <buffer> <F10> :w<CR>:sp<CR>:exec 'term pytest'<CR>
imap <buffer> <F10> <esc>:w<CR>:sp<CR>:exec 'term pytest'<CR>
map <F11> :sp<CR>:exec 'term ipython'<CR>i
imap <F11> <esc>:sp<CR>:exec 'term ipython'<CR>i

