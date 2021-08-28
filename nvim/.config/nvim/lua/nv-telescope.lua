local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap(
	"n",
	"<leader>ff",
	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fg",
	"<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fb",
	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({}))<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fh",
	"<cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy({}))<cr>",
	opts
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>fr",
	"<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_ivy({}))<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fd",
	"<cmd>lua require('telescope.builtin').lsp_document_diagnostics(require('telescope.themes').get_ivy({}))<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fwd",
	"<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics(require('telescope.themes').get_ivy({}))<cr>",
	opts
)
