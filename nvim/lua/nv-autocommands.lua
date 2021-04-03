require "nv-utils"

nvim_create_augroups({
    formatting = {
        {"BufWritePre", "*.py", "lua vim.lsp.buf.formatting_sync(nil, 1000)"},
        {"BufWritePre", "*.lua", "lua vim.lsp.buf.formatting_sync(nil, 1000)"}

    }
})

