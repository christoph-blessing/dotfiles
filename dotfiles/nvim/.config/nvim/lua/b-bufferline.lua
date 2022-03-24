M = {}

M.setup = function()
	vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true })
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } },
		},
	})
end

return M
