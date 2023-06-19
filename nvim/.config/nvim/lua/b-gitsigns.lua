local M = {}

M.setup = function()
	require("gitsigns").setup({})

	local wk = require("which-key")
	wk.register({
		["]c"] = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "Go To Next Hunk" },
		["[c"] = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", "Go To Previous Hunk" },
	}, {})
	wk.register({
		g = {
			name = "Git",
			s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
			u = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "Undo Stage Hunk" },
			r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
			R = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", "Reset Buffer" },
			p = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview Hunk" },
			b = { "<cmd>lua require('gitsigns').blame_line()<cr>", "Blame Line" },
			S = { "<cmd>lua require('gitsigns').stage_buffer()<cr>", "Stage Buffer" },
			U = { "<cmd>lua require('gitsigns').reset_buffer_index()<cr>", "Reset Buffer Index" },
		},
	}, {
		prefix = "<leader>",
	})
	wk.register({
		g = {
			name = "Git",
			s = { "<cmd>lua require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<cr>", "Stage Hunk" },
			r = { "<cmd>lua require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v')})<cr>", "Reset Hunk" },
		},
	}, {
		mode = "v",
		prefix = "<leader>",
	})
end

return M
