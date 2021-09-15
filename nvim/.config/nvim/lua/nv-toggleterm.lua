local M = {}

M.setup = function()
	require("toggleterm").setup({
		open_mapping = [[<C-\>]],
		hide_numbers = true,
		size = function(term)
			if term.direction == "horizontal" then
				return 20
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.5
			end
		end,
		direction = "vertical",
	})

	vim.cmd("autocmd! TermOpen term://* lua require('nv-toggleterm').set_terminal_keymaps()")
end

M.set_terminal_keymaps = function()
	local opts = { noremap = true }

	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)

	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

return M
