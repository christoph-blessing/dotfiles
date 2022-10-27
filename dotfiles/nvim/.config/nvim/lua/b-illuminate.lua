M = {}

M.setup = function()
	vim.api.nvim_set_hl(0, "IlluminatedWordText", { standout = true })
	vim.api.nvim_set_hl(0, "IlluminatedWordRead", { standout = true })
	vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { standout = true, bold = true })
end

return M
