vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("i", "jj", "<Esc>", opts)

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

vim.api.nvim_set_keymap("n", "<C-q>", "<cmd>:call QuickFixToggle()<cr>", opts)
