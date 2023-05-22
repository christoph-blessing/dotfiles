local M = {}

M.setup = function()
	require("which-key").register(
		{ r = { "<cmd>MarkdownPreviewToggle<cr>", "Toggle Markdown Preview" } },
		{ prefix = "<leader>" }
	)
end

return M
