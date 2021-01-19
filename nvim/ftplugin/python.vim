"Update the file on disk after 2 seconds without input
set updatetime=2000
autocmd CursorHold,CursorHoldI * update

"Configuration for Asynchronous Lint Engine (ALE)
let g:ale_python_auto_pipenv = 1
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_pylint_options = '--max-line-length 120'
let g:ale_python_flake8_options = '--max-line-length 120'
let b:ale_linters = ['mypy', 'pylint', 'flake8', 'pydocstyle']
let b:ale_fixers = ['black', 'isort']

"Key mappings
map <buffer> <F9> :w<CR>:sp<CR>:exec 'term python' shellescape(@%, 1)<CR>i
imap <buffer> <F9> <esc>:w<CR>:sp<CR>:exec 'term python' shellescape(@%, 1)<CR>i
map <buffer> <F10> :w<CR>:sp<CR>:exec 'term pytest'<CR>
imap <buffer> <F10> <esc>:w<CR>:sp<CR>:exec 'term pytest'<CR>
map <F11> :sp<CR>:exec 'term ipython'<CR>i
imap <F11> <esc>:sp<CR>:exec 'term ipython'<CR>i

