-- Python
local isort = {formatCommand = "isort --quiet -", formatStdin = true}

local black = {formatCommand = "black --quiet -", formatStdin = true}

local flake8 = {
    lintCommand = "flake8 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}

local pylint = {
    lintCommand = "pylint --from-stdin --output-format text \z
        --msg-template '{path}:{line}:{column}:{C}: [{symbol}] {msg}' ${INPUT}",
    lintStdin = true,
    lintFormats = {"%A%f:%l:%c:%t: %m", "%A%f:%l: %m", "%A%f:(%l): %m", "%-Z%p^%.%#", "%-G%.%#"}
}

local mypy = {
    lintCommand = "~/scripts/mypy-from-stdin.sh ${INPUT}",
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = {"%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m"}
}

-- Lua
local lua_format = {formatCommand = "lua-format -i --column-limit 120", formatStdin = true}

return {
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"python", "lua"},
    settings = {
        rootMarkers = {".git/"},
        languages = {python = {isort, black, flake8, pylint, mypy}, lua = {lua_format}}
    }
}
