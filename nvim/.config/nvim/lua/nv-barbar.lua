vim.g.bufferline = {closable = false}

vim.api.nvim_set_keymap("n", "<Tab>", ":BufferNext<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferPrevious<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-x>", ":BufferClose<cr>", {noremap = true, silent = true})

