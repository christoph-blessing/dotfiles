require("utils")

nvim_create_augroups({
	python = {
		{
			"BufEnter",
			"*.py",
			"lua require('b-which-key.python').setup()",
		},
	},
	plantuml = {
		{
			"FileType",
			"plantuml",
			"lua vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', \":silent w !plantuml -p | ~/.config/nvim/scripts/sxiv.sh<cr>\", {silent = true})",
		},
	},
	rust = {
		{
			"FileType",
			"rust",
			"lua vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', \":w<CR>:TermExec cmd='cargo run'<CR>\", {})",
		},
		{
			"FileType",
			"rust",
			"lua vim.api.nvim_buf_set_keymap(0, 'n', '<leader>t', \":w<CR>:TermExec cmd='cargo test'<CR>\", {})",
		},
	},
	markdown = {
		{
			"FileType",
			"markdown",
			"lua vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', \":w<CR>:Glow<CR>\", {})",
		},
	},
	lua = {
		{
			"FileType",
			"lua",
			"lua require('cmp').setup.buffer {sources = {{name = 'buffer'}, {name = 'nvim_lua'}, {name = 'path'}, {name = 'vsnip'}}}",
		},
	},
	javascriptreact = {
		{
			"FileType",
			"javascriptreact",
			"lua vim.opt['shiftwidth'] = 2",
		},
	},
})
