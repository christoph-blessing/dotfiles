local null_ls = require("null-ls")
local api = vim.api

local sources = {null_ls.builtins.diagnostics.flake8}

null_ls.setup {sources = sources}

return {}
