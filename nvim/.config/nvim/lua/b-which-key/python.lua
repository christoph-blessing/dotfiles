local M = {}

M.setup = function()
	local wk = require("which-key")
	local mappings = {
		r = { "<cmd>w<cr><cmd>TermExec cmd='python3 %'<cr>", "Run Current File" },
	}
	local opts = { prefix = "<leader>" }
	wk.register(mappings, opts)
end

return M
