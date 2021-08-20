require "utils"

nvim_create_augroups({
    python = {
        {
            "FileType", "python",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<leader>r', \":w<cr>:exec '!python' shellescape(@%, 1)<cr>\", {})"
        }, {
            "FileType", "python",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<leader>tu', \":w<cr>:exec '!pytest tests/unit'<cr>\", {})"
        }, {
            "FileType", "python",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<F5>', \":lua require'dap'.continue()<CR>\", {silent = true})"
        }, {
            "FileType", "python",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<F10>', \":lua require'dap'.step_over()<CR>\", {silent = true})"
        }, {
            "FileType", "python",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<F11>', \":lua require'dap'.step_into()<CR>\", {silent = true})"
        }, {
            "FileType", "python",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<F12>', \":lua require'dap'.step_out()<CR>\", {silent = true})"
        }, {
            "FileType", "python",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<leader>b', \":lua require'dap'.toggle_breakpoint()<CR>\", {silent = true})"
        }, {
            "FileType", "python",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<leader>B', \":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>\", {silent = true})"
        }, {
            "FileType", "python",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<leader>lp', \":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>\", {silent = true})"
        }, {
            "FileType", "python",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<leader>dr', \":lua require'dap'.repl.open()<CR>\", {silent = true})"
        }, {
            "FileType", "python",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<leader>dl', \":lua require'dap'.run_last()<CR>\", {silent = true})"
        }
    },
    plantuml = {
        {
            "FileType", "plantuml",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<leader>r', \":silent w !plantuml -p | ~/.config/nvim/scripts/sxiv.sh<cr>\", {silent = true})"
        }
    },
    rust = {
        {
            "FileType", "rust",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<leader>r', \":w<CR>:exec '!cargo run'<CR>\", {})"
        }, {
            "FileType", "rust",
            "lua vim.api.nvim_buf_set_keymap('0', 'n', '<leader>t', \":w<CR>:exec '!cargo test'<CR>\", {})"
        }
    }
})
