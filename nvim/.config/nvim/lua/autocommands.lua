require "utils"

nvim_create_augroups({
    formatting = {
        {"BufWritePre", "*.py", "lua vim.lsp.buf.formatting_sync(nil, 1000)"},
        {"BufWritePre", "*.lua", "lua vim.lsp.buf.formatting_sync(nil, 1000)"}

    },
    run = {
        {
            "FileType", "python",
            "lua vim.api.nvim_set_keymap('n', '<leader>r', \":w<cr>:exec '!python' shellescape(@%, 1)<cr>\", {})"
        }, {
            "FileType", "python",
            "lua vim.api.nvim_set_keymap('i', '<leader>r', \"<esc>:w<cr>:exec '!python' shellescape(@%, 1)<cr>\", {})"
        }
    }
})

