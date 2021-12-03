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

	local tree_view = require("nvim-tree.view")

	local open = tree_view.open
	tree_view.open = function()
		M.on_open()
		open()
	end

	local close = tree_view.close
	tree_view.close = function()
		M.on_close()
		close()
	end
end

M.on_open = function()
	if package.loaded["bufferline.state"] then
		require("bufferline.state").set_offset(vim.g.nvim_tree_width + 1, "FileTree")
	end
end

M.on_close = function()
	if package.loaded["bufferline.state"] then
		require("bufferline.state").set_offset(0)
	end
end

return M
