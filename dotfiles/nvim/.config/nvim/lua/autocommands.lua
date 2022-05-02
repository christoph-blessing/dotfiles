local utils = require("utils")

utils.nvim_create_augroups({
	python = {
		{
			event = "BufEnter",
			pattern = "*.py",
			callback = function()
				require("b-which-key.python").setup()
			end,
		},
	},
	rust = {
		{
			event = "FileType",
			pattern = "rust",
			callback = function()
				vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", ":w<CR>:TermExec cmd='cargo run'<CR>", {})
			end,
		},
		{
			event = "FileType",
			pattern = "rust",
			callback = function()
				vim.api.nvim_buf_set_keymap(0, "n", "<leader>t", ":w<CR>:TermExec cmd='cargo test'<CR>", {})
			end,
		},
	},
	lua = {
		{
			event = "FileType",
			pattern = "lua",
			callback = function()
				require("cmp").setup.buffer({
					sources = { { name = "buffer" }, { name = "nvim_lua" }, { name = "path" }, { name = "vsnip" } },
				})
			end,
		},
	},
	javascriptreact = {
		{
			event = "FileType",
			pattern = "javascriptreact",
			callback = function()
				vim.opt["shiftwidth"] = 2
			end,
		},
	},
})
