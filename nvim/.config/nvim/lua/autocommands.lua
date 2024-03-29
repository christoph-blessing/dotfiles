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
	{
		"FileType",
		{
			group = "plantuml",
			pattern = "plantuml",
			callback = function()
				require("plantuml").setup()
			end,
		},
	},
	{
		"BufEnter",
		{
			group = "fsharp",
			pattern = "*.fsx",
			callback = function()
				local wk = require("which-key")
				wk.register({ r = { "<cmd>!dotnet fsi %<cr>", "Run File" } }, { prefix = "<leader>" })
			end,
		},
	},
})
