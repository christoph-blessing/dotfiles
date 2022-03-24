M = {}

M.setup = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "python", "lua", "rust" },
		sync_install = true,
		highlight = { enable = true },
		indent = { enable = true, disable = { "python" } },
	})
end

return M
