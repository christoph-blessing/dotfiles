-- Python --
local flake8 = {
    lintCommand = "flake8 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = {"%f:%l:%c: %m"}
}

local pylint = {
    lintCommand = "~/.config/nvim/scripts/pylint.sh ${INPUT}",
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = {"%A%f:%l:%c:%t: %m", "%A%f:%l: %m", "%A%f:(%l): %m", "%-Z%p^%.%#", "%-G%.%#"}
}

local mypy = {
    lintCommand = "~/.config/nvim/scripts/mypy.sh ${INPUT}",
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = {"%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m"}
}

return {
    cmd = {vim.fn.stdpath("data") .. "/lspinstall/efm/efm-langserver"},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"python", "lua", "markdown"},
    settings = {rootMarkers = {".git/"}, languages = {python = {flake8, pylint, mypy}}}
}
