require "utils"

nvim_create_augroups({
    formatting = {
        {"BufWritePre", "*.py", "lua vim.lsp.buf.formatting_sync(nil, 1000)"},
        {"BufWritePre", "*.lua", "lua vim.lsp.buf.formatting_sync(nil, 1000)"}

    },
    python = {
        {
            "FileType", "python",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<leader>r', \":w<cr>:exec '!python' shellescape(@%, 1)<cr>\", {})"
        }, {
            "FileType", "python",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<leader>tu', \":w<cr>:exec '!pytest tests/unit'<cr>\", {})"
        }

    },
    plantuml = {
        {
            "FileType", "plantuml",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<leader>r', \":w !plantuml -p | ~/.config/nvim/scripts/sxiv.sh<cr>\", {})"
        }
    }
})

