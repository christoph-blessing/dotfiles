set omnifunc=ale#completion#OmniFunc

let python_version = get(json_decode(system('pdm info --env')), 'python_version')
let bin_path = getcwd() . '/__pypackages__/' . python_version . '/bin/'

"Configuration for Asynchronous Lint Engine (ALE)
let g:ale_python_mypy_executable = bin_path . 'mypy'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_pyls_executable = bin_path . 'pyls'
let b:ale_linters = ['pyls', 'mypy', 'pydocstyle', 'flake8']
let b:ale_fixers = ['black', 'isort']

"Key mappings
map <F6> :exec 'ALERename'<CR>
imap <F6> <esc>:exec 'ALERename'<CR>
map <buffer> <F9> :w<CR>:exec 'T python' shellescape(@%, 1)<CR>
imap <buffer> <F9> <esc>:w<CR>:exec 'T python' shellescape(@%, 1)<CR>a
map <buffer> <F10> :w<CR>:exec 'T pytest'<CR>
imap <buffer> <F10> <esc>:w<CR>:exec 'T pytest'<CR>a
map <F11> :exec 'T ipython'<CR>
imap <F11> <esc>:exec 'T ipython'<CR>

