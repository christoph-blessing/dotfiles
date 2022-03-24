local M = {}

M.setup = function()
	local wk = require("which-key")
	local mappings = {
		t = {
			name = "Testing",
			a = { "<cmd>w<cr><cmd>lua require('pytest').run_tests()<cr>", "Run All Tests" },
			d = { "<cmd>w<cr><cmd>lua require('pytest').run_tests_in_file()<cr>", "Run All Tests In File" },
			c = { "<cmd>w<cr><cmd>lua require('pytest').run_test_under_cursor()<cr>", "Run Test Under Cursor" },
		},
		r = { "<cmd>w<cr><cmd>TermExec cmd='python3 %'<cr>", "Run Current File" },
	}
	local opts = { prefix = "<leader>" }
	wk.register(mappings, opts)
end

return M
