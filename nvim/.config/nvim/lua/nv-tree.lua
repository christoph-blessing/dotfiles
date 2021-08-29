M = {}

M.setup = function()
	vim.g.nvim_tree_auto_close = 1
	vim.g.nvim_tree_hide_dotfiles = 1
	vim.g.nvim_tree_quit_on_open = 1
	vim.g.nvim_tree_indent_markers = 1

	vim.api.nvim_set_keymap("n", "<C-n>", "<CMD>NvimTreeToggle<CR>", { noremap = true, silent = true })
end

return M
