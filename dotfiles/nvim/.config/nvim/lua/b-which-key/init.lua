local M = {}

M.setup = function()
	local wk = require("which-key")

	wk.register({
		["]t"] = { "<Plug>(ultest-next-fail)", "Go To Next Test Failure" },
		["[t"] = { "<Plug>(ultest-prev-fail)", "Go To Previous Test Failure" },
		["]d"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Go To Next Diagnostic" },
		["[d"] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Go To Previous Diagnostic" },
		["]c"] = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "Go To Next Hunk" },
		["[c"] = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", "Go To Previous Hunk" },
	}, {})

	wk.register({
		w = { "<cmd>w!<cr>", "Write" },
		q = { "<cmd>q!<cr>", "Quit" },
		h = { "<cmd>nohlsearch<cr>", "Clear Highlight" },
		c = { "<cmd>bdelete<cr>", "Close Buffer" },

		l = {
			name = "LSP",
			g = {
				name = "Go To",
				D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
				d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
				t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Go To Type Definition" },
			},
			h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show Hover Text" },
			i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Show Implementations" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
			e = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show Line Diagnostics" },
			d = {
				"<cmd>lua require('telescope.builtin').lsp_document_diagnostics(require('telescope.themes').get_ivy({}))<cr>",
				"Show Document Diagnostics",
			},
			w = {
				"<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics(require('telescope.themes').get_ivy({}))<cr>",
				"Show Workspace Diagnostics",
			},
			t = { "<cmd>lua require('diagnostics').toggle_buffer_diagnostics(0)<cr>", "Toggle Buffer Diagnostics" },
		},

		f = {
			name = "Find",
			f = {
				"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<cr>",
				"Find File",
			},
			g = {
				"<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>",
				"Find Text",
			},
			b = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({}))<cr>",
				"Find Buffer",
			},
			h = {
				"<cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy({}))<cr>",
				"Find Help",
			},
			r = {
				"<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_ivy({}))<cr>",
				"Find References",
			},
			p = {
				"<cmd>lua require('telescope').extensions.projects.projects(require('telescope.themes').get_ivy({}))<cr>",
				"Find Projects",
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
			c = { "<cmd>w<cr><cmd>UltestClear<cr>", "Clear Test Output" },
			f = { "<cmd>w<cr><cmd>Ultest<cr>", "Run All Tests In File" },
			l = { "<cmd>w<cr><cmd>UltestLast<cr>", "Run Last Ran Test" },
			n = { "<cmd>w<cr><cmd>UltestNearest<cr>", "Run Nearest Test" },
			o = { "<cmd>w<cr><cmd>UltestOutput<cr>", "Show Output" },
			s = { "<cmd>w<cr><cmd>UltestSummary<cr>", "Toggle Summary" },
		},
	}, {
		prefix = "<leader>",
	})

	wk.setup()
end

return M
