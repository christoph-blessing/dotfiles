local M = {}

M.setup = function()
	local wk = require("which-key")
	local mappings = {
		t = {
			name = "Testing",
			a = { "<cmd>w<cr><cmd>TermExec cmd='pytest'<cr>", "Run All Tests" },
			c = { "<cmd>w<cr><cmd>lua require('pytest').run_test_under_cursor()<cr>", "Run Test Under Cursor" },
			d = { "<cmd>w<cr><cmd>TermExec cmd='pytest %'<cr>", "Run All Tests In File" },
			f = { "<cmd>w<cr><cmd>TermExec cmd='pytest tests/functional'<cr>", "Run Functional Tests" },
			u = { "<cmd>w<cr><cmd>TermExec cmd='pytest tests/unit'<cr>", "Run Unit Tests" },
		},
		r = { "<cmd>w<cr><cmd>TermExec cmd='python3 %'<cr>", "Run Current File" },
	}
	local opts = { prefix = "<leader>" }
	wk.register(mappings, opts)
end

return M
