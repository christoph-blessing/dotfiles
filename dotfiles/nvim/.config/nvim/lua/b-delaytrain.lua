local M = {}

M.setup = function()
	require("delaytrain").setup({
		ignore_filetypes = { "NvimTree", "toggleterm", "help" },
	})
end

return M
