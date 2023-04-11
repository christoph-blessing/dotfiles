local utils = require("utils.autocmd")

utils.define_autocmds({
	{
		"TextYankPost",
		{
			group = "general",
			callback = function()
				require("vim.highlight").on_yank({ higroup = "Search", timeout = 200 })
			end,
		},
	},
	{
		"BufEnter",
		{
			group = "python",
			pattern = "*.py",
			callback = function()
				require("b-which-key.python").setup()
			end,
		},
	},
	{
		"FileType",
		{
			group = "rust",
			pattern = "rust",
			callback = function()
				vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", ":w<CR>:TermExec cmd='cargo run'<CR>", {})
			end,
		},
	},
	{
		"FileType",
		{
			group = "rust",
			pattern = "rust",
			callback = function()
				vim.api.nvim_buf_set_keymap(0, "n", "<leader>t", ":w<CR>:TermExec cmd='cargo test'<CR>", {})
			end,
		},
	},
	{
		"FileType",
		{
			group = "lua",
			pattern = "lua",
			callback = function()
				require("cmp").setup.buffer({
					sources = { { name = "buffer" }, { name = "nvim_lua" }, { name = "path" }, { name = "vsnip" } },
				})
			end,
		},
	},
	{
		"FileType",
		{
			group = "javascriptreact",
			pattern = "javascriptreact",
			callback = function()
				vim.opt["shiftwidth"] = 2
			end,
		},
	},
	{
		"BufWritePost",
		{
			group = "slack_app",
			pattern = "/**/slack-app/**/*.py",
			callback = function()
				require("sync").sync()
			end,
		},
	},
})
