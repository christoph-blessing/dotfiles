local M = {}

M.setup = function()
	local wk = require("which-key")

	wk.register({
		["]t"] = { "<cmd>lua require('neotest').jump.next({ status = 'failed' })<cr>", "Go To Next Test Failure" },
		["[t"] = { "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<cr>", "Go To Previous Test Failure" },
		["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Go To Next Diagnostic" },
		["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Go To Previous Diagnostic" },
		["]q"] = { "<cmd>cnext<cr>", "Go To Next Quickfix Entry" },
		["[q"] = { "<cmd>cprev<cr>", "Go To Previous Quickfix Entry" },
		["]r"] = { "<cmd>lua require('illuminate').goto_next_reference({wrap = true})<cr>", "Go to next reference" },
		["[r"] = {
			"<cmd>lua require('illuminate').goto_prev_reference({wrap = true})<cr>",
			"Go to previous reference",
		},
		["]h"] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Go To Next Mark" },
		["[h"] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Go To Previous Mark" },
	}, {})

	wk.register({
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark File" },
		m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Show Marks" },
		w = { "<cmd>w!<cr>", "Write" },
		q = { "<cmd>q!<cr>", "Quit" },
		h = { "<cmd>nohlsearch<cr>", "Clear Highlight" },
		c = { "<cmd>bdelete<cr>", "Close Buffer" },
		l = {
			name = "LSP",
			c = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Execute Code Action" },
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
			q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show Signature Help" },
			t = {
				"<cmd>lua require('telescope.builtin').lsp_type_definitions(require('telescope.themes').get_ivy({}))<cr>",
				"Go To Type Definition",
			},
		},
		f = {
			name = "Find",
			b = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({}))<cr>",
				"Buffer",
			},
			c = {
				"<cmd>lua require('telescope.builtin').git_commits(require('telescope.themes').get_ivy({}))<cr>",
				"Git Commits",
			},
			d = {
				"<cmd>lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({}))<cr>",
				"Diagnostics",
			},
			f = {
				"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<cr>",
				"File",
			},
			g = {
				"<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>",
				"Text",
			},
			h = {
				"<cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy({}))<cr>",
				"Help",
			},
			i = {
				"<cmd>lua require('telescope.builtin').lsp_incoming_calls(require('telescope.themes').get_ivy({}))<cr>",
				"Incoming Calls",
			},
			o = {
				"<cmd>lua require('telescope.builtin').lsp_outgoing_calls(require('telescope.themes').get_ivy({}))<cr>",
				"Outgoing Calls",
			},
			q = {
				"<cmd>lua require('telescope.builtin').quickfix(require('telescope.themes').get_ivy({}))<cr>",
				"Quickfix",
			},
			r = {
				"<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_ivy({}))<cr>",
				"References",
			},
			s = {
				"<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols(require('telescope.themes').get_ivy({}))<cr>",
				"Workspace Symbols",
			},
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
			u = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
		},
		t = {
			name = "Testing",
			a = { "<cmd>w<cr><cmd>NeotestSuite notslow<cr>", "Run All Fast Tests" },
			A = { "<cmd>w<cr><cmd>NeotestSuite<cr>", "Run All Tests" },
			d = { "<cmd>w<cr><cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest Test" },
			f = { "<cmd>w<cr><cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run All Tests In File" },
			l = { "<cmd>w<cr><cmd>lua require('neotest').run.run_last()<cr>", "Run Last Ran Test" },
			n = { "<cmd>w<cr><cmd>lua require('neotest').run.run()<cr>", "Run Nearest Test" },
			o = { "<cmd>lua require('neotest').output.open()<cr>", "Show Output" },
			O = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Show Output" },
			s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Toggle Summary" },
		},
		x = { "<cmd>!chmod +x %<cr>", "Make File Executable" },
	}, {
		prefix = "<leader>",
	})

	wk.register(
		{ r = { "<cmd>lua require('illuminate').textobj_select()<cr>", "Reference Under Cursor" } },
		{ mode = "o" }
	)

	wk.register({
		["<C-h>"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Go To First Mark" },
		["<C-j>"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Go To Second Mark" },
		["<C-k>"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Go To Third Mark" },
		["<C-l>"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Go To Fourth Mark" },
	}, {})

	wk.register({
		y = { '"+y', "Yank To System Clipboard" },
		Y = { '"+Y', "Yank Line To System Clipboard" },
	}, {
		prefix = "<leader>",
	})

	wk.register({
		y = { '"+y', "Yank To System Clipboard" },
	}, {
		mode = "v",
		prefix = "<leader>",
	})

	wk.setup()
end

return M
