local M = {}

M.setup = function()
	require("delaytrain").setup({
		ignore_filetypes = { "NvimTree", "toggleterm", "help", "neotest-output", "neotest-summary" },
	})
end

return M
