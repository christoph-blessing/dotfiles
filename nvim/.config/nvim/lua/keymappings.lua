vim.g.mapleader = " "

vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap = true})

vim.api.nvim_set_keymap("n", "<leader>h", "<CMD>set hlsearch!<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {silent = true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {silent = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {silent = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {silent = true})

vim.api.nvim_set_keymap("n", "<F5>", ":UndotreeToggle<CR>", {noremap = true, silent = true})
