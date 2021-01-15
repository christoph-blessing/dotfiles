let g:ale_python_auto_pipenv = 1
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_pylint_options = '--max-line-length 120'
let g:ale_python_flake8_options = '--max-line-length 120'

let b:ale_linters = ['mypy', 'pylint', 'flake8', 'pydocstyle']
let b:ale_fixers = ['black', 'isort']

map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
