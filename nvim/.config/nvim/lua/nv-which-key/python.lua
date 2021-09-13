local M = {}

M.setup = function()
	local wk = require("which-key")
	local mappings = {
		t = {
			name = "Testing",
			c = { "<cmd>w<cr><cmd>TermExec cmd='pytest -k <cword> %'<cr>", "Run Test Under Cursor" },
			d = { "<cmd>w<cr><cmd>TermExec cmd='pytest %'<cr>", "Run Document Tests" },
			u = { "<cmd>w<cr><cmd>TermExec cmd='pytest tests/unit'<cr>", "Run Unit Tests" },
			a = { "<cmd>w<cr><cmd>TermExec cmd='pytest tests'<cr>", "Run All Tests" },
		},
		r = { "<cmd>w<cr><cmd>TermExec cmd='python3 %'<cr>", "Run Current File" },
	}
	local opts = { prefix = "<leader>" }
	wk.register(mappings, opts)
end

return M
