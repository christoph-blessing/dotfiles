local M = {}

M.setup = function()
	local wk = require("which-key")

	wk.register({
		["]t"] = { "<cmd>lua require('neotest').jump.next({ status = 'failed' })<cr>", "Go To Next Test Failure" },
		["[t"] = { "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<cr>", "Go To Previous Test Failure" },
		["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Go To Next Diagnostic" },
		["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Go To Previous Diagnostic" },
		["]c"] = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "Go To Next Hunk" },
		["[c"] = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", "Go To Previous Hunk" },
	}, {})

	wk.register({
		w = { "<cmd>w!<cr>", "Write" },
		q = { "<cmd>q!<cr>", "Quit" },
		h = { "<cmd>nohlsearch<cr>", "Clear Highlight" },
		c = { "<cmd>buffer#<bar>bdelete#<cr>", "Close Buffer" },

		l = {
			name = "LSP",
			d = {
				"<cmd>lua require('telescope.builtin').lsp_definitions(require('telescope.themes').get_ivy({}))<cr>",
				"Go To Definition",
			},
			e = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show Line Diagnostics" },
			h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show Hover Text" },
			i = {
				"<cmd>lua require('telescope.builtin').lsp_implementations(require('telescope.themes').get_ivy({}))<cr>",
				"Go To Implementation",
			},
			q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			t = {
				"<cmd>lua require('telescope.builtin').lsp_type_definitions(require('telescope.themes').get_ivy({}))<cr>",
				"Go To Type Definition",
			},
		},

		f = {
			name = "Find",
			b = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({}))<cr>",
				"Find Buffer",
			},
			c = {
				"<cmd>lua require('telescope.builtin').git_commits(require('telescope.themes').get_ivy({}))<cr>",
				"Find Git Commits",
			},
			d = {
				"<cmd>lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({}))<cr>",
				"Find Diagnostics",
			},
			f = {
				"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<cr>",
				"Find File",
			},
			g = {
				"<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>",
				"Find Text",
			},
			h = {
				"<cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy({}))<cr>",
				"Find Help",
			},
			i = {
				"<cmd>lua require('telescope.builtin').lsp_incoming_calls(require('telescope.themes').get_ivy({}))<cr>",
				"Find Incoming Calls",
			},
			o = {
				"<cmd>lua require('telescope.builtin').lsp_outgoing_calls(require('telescope.themes').get_ivy({}))<cr>",
				"Find Outgoing Calls",
			},
			r = {
				"<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_ivy({}))<cr>",
				"Find References",
			},
			s = {
				"<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols(require('telescope.themes').get_ivy({}))<cr>",
				"Find Workspace Symbols",
			},
		},

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

		d = {
			name = "Debug",
			c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
			n = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
			i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
			o = { "<cmd>lua require('dap').step_out()<cr>", "Step Out" },
			b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
			B = {
				"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
				"Set Condition Breakpoint",
			},
			p = {
				"<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
				"Set Log Point Breakpoint",
			},
			r = { "<cmd>lua require('dap').repl.open()<cr>", "Open REPL" },
			l = { "<cmd>lua require('dap').repl.run_last()<cr>", "Run Last" },
		},

		e = {
			name = "Execute",
			a = { "<cmd>TermExec cmd='!!'<cr>", "Run Last Command Again" },
			c = { "<cmd>TermExec cmd='clear'<cr>", "Clear Terminal" },
		},

		t = {
			name = "Testing",
			a = { "<cmd>w<cr><cmd>lua require('neotest').run.run(vim.fn.getcwd())<cr>", "Run All Tests" },
			d = { "<cmd>w<cr><cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest Test" },
			f = { "<cmd>w<cr><cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run All Tests In File" },
			l = { "<cmd>w<cr><cmd>lua require('neotest').run.run_last()<cr>", "Run Last Ran Test" },
			n = { "<cmd>w<cr><cmd>lua require('neotest').run.run()<cr>", "Run Nearest Test" },
			o = { "<cmd>lua require('neotest').output.open()<cr>", "Show Output" },
			O = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Show Output" },
			s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Toggle Summary" },
		},
	}, {
		prefix = "<leader>",
	})

	wk.setup()
end

return M
