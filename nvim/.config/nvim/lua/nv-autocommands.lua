require "nv-utils"

nvim_create_augroups({
    formatting = {
        {"BufWritePre", "*.py", "lua vim.lsp.buf.formatting_sync(nil, 1000)"},
        {"BufWritePre", "*.lua", "lua vim.lsp.buf.formatting_sync(nil, 1000)"}

    },
    run = {
        {
            "FileType", "python",
            "lua vim.api.nvim_set_keymap('n', '<f9>', \":w<cr>:exec '!python' shellescape(@%, 1)<cr>\", {})"
        }, {
            "FileType", "python",
            "lua vim.api.nvim_set_keymap('i', '<f9>', \"<esc>:w<cr>:exec '!python' shellescape(@%, 1)<cr>\", {})"
        }
    }
})

