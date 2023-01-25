local M = {}

M.setup = function()
	vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true })
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			custom_filter = function(buf_number, buf_numbers)
				if vim.bo[buf_number].filetype ~= "qf" and vim.bo[buf_number].filetype ~= "dap-repl" then
					return true
				end
			end,
			show_buffer_close_icons = false,
			show_close_icon = false,
		},
	})
end

return M
