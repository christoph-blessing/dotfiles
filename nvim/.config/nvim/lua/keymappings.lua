vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("i", "jj", "<Esc>", opts)

vim.api.nvim_set_keymap("n", "<C-q>", "<cmd>:call QuickFixToggle()<cr>", opts)
