M = {}

M.setup = function()
	vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#7c6f64" })
	vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#7c6f64" })
	vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#7c6f64", bold = true })
	require("illuminate").configure({
		filetypes_denylist = {
			"TelescopePrompt",
			"dapui_watches",
			"dapui_scopes",
			"dapui_breakpoints",
			"dapui_stacks",
			"dap-repl",
			"dapui_console",
			"NvimTree",
		},
	})
end

return M
