local M = {}

M.setup = function()
	vim.g.nvim_tree_width = 30
	vim.g.nvim_tree_respect_buf_cwd = 1

	vim.api.nvim_set_keymap("n", "<C-n>", "<CMD>NvimTreeToggle<CR>", { noremap = true, silent = true })

	require("nvim-tree").setup({
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
		filters = {
			dotfiles = true,
		},
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
		renderer = {
			indent_markers = { enable = true },
		},
	})
end

return M
