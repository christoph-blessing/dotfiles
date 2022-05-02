local M = {}

M.setup = function()
	local wk = require("which-key")
	local mappings = {
		t = {
			name = "Testing",
			f = { "<cmd>w<cr><cmd>Ultest<cr>" ,"Run All Tests In File" },
			n = { "<cmd>w<cr><cmd>UltestNearest<cr>", "Run Nearest Test" },
			l = { "<cmd>w<cr><cmd>UltestLast<cr>", "Run Last Ran Test" },
			c = { "<cmd>w<cr><cmd>UltestClear<cr>", "Clear Test Output" },
		},
		r = { "<cmd>w<cr><cmd>TermExec cmd='python3 %'<cr>", "Run Current File" },
	}
	local opts = { prefix = "<leader>" }
	wk.register(mappings, opts)
end

return M
