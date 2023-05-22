local M = {}

M.setup = function()
	vim.cmd("let g:mkdp_browser = 'firefox'")
	require("which-key").register(
		{ r = { "<cmd>MarkdownPreviewToggle<cr>", "Toggle Markdown Preview" } },
		{ prefix = "<leader>" }
	)
end

return M
