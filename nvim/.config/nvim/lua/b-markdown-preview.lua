local M = {}

M.setup = function()
	vim.cmd("let g:mkdp_browser = 'firefox'")
	local autocmd = require("utils.autocmd")
	local wk = require("which-key")
	autocmd.define_autocmds({
		{
			"BufEnter",
			{
				group = "markdown",
				pattern = "*.md",
				callback = function()
					wk.register(
						{ r = { "<cmd>MarkdownPreviewToggle<cr>", "Toggle Markdown Preview" } },
						{ prefix = "<leader>" }
					)
				end,
			},
		},
	})
end

return M
