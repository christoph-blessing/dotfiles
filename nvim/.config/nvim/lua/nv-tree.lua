local M = {}

M.setup = function()
	vim.g.nvim_tree_quit_on_open = 1
	vim.g.nvim_tree_indent_markers = 1
	vim.g.nvim_tree_width = 30
	vim.g.nvim_tree_respect_buf_cwd = 1

	vim.api.nvim_set_keymap("n", "<C-n>", "<CMD>NvimTreeToggle<CR>", { noremap = true, silent = true })

	require("nvim-tree").setup({
		auto_close = true,
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
		filters = {
			dotfiles = true,
		},
	})
end

return M
