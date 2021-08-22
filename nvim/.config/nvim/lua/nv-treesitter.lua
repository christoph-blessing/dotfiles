require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python" },
	highlight = { enable = true },
	indent = { enable = true, disable = { "python" } },
})
