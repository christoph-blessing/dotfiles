M = {}

M.setup = function()
	require("nvim-treesitter.configs").setup({ rainbow = { enable = true } })
end

return M
