local M = {}

M.setup = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "python", "lua", "rust", "bash", "yaml", "toml", "dockerfile", "markdown" },
		sync_install = true,
		highlight = { enable = true },
		indent = { enable = false },
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = { query = "@function.outer", desc = "a function" },
					["if"] = { query = "@function.inner", desc = "inner part of a function" },
					["ac"] = { query = "@class.outer", desc = "a class" },
					["ic"] = { query = "@class.inner", desc = "inner part of a class" },
				},
				selection_modes = {
					["@function.outer"] = "V",
					["@function.inner"] = "V",
					["@class.outer"] = "V",
					["@class.inner"] = "V",
				},
			},
			swap = {
				enable = false,
				swap_next = {
					["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
				},
				swap_previous = {
					["<leader>A"] = { query = "@parameter.inner", desc = "Swap with previous parameter" },
				},
			},
			move = {
				enable = true,
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = { query = "@class.outer", desc = "Next class start" },
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = { query = "@class.outer", desc = "Next class end" },
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = { query = "@class.outer", desc = "Previous class start" },
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = { query = "@class.outer", desc = "Previous class end" },
				},
			},
		},
	})

	vim.o.foldmethod = "expr"
	vim.o.foldexpr = "nvim_treesitter#foldexpr()"
	vim.o.foldenable = false
end

return M
