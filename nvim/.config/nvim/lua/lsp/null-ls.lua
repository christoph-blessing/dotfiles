local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

local find_entries = function(line, pattern, groups, severities)
	local entries = {}
	local results = { line:match(pattern) }
	if next(results) == nil then
		return
	end
	for i, match in ipairs(results) do
		entries[groups[i]] = match
	end
	entries["severity"] = severities[entries["severity"]]
	return entries
end

local sources = {
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.isort,
	null_ls.builtins.formatting.rustfmt,
	null_ls.builtins.formatting.stylua,
}

local mypy = {
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = { "python" },
	generator = helpers.generator_factory({
		command = "/home/chris/.config/nvim/scripts/mypy.sh",
		to_stdin = true,
		args = { "$FILENAME" },
		format = "line",
		on_output = function(line, params)
			local severities = { error = 1, warning = 2, note = 3 }
			local patterns = {
				[":(%d+):(%d+): (%w+): (.*)"] = {
					"row",
					"col",
					"severity",
					"message",
				},
				[":(%d+): (%w+): (.*)"] = { "row", "severity", "message" },
			}
			for pattern, groups in pairs(patterns) do
				return find_entries(line, pattern, groups, severities)
			end
		end,
	}),
}
table.insert(sources, mypy)

local flake8 = {
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = { "python" },
	generator = helpers.generator_factory({
		command = "flake8",
		to_stdin = true,
		to_stderr = true,
		args = { "--stdin-display-name", "$FILENAME", "-" },
		format = "line",
		check_exit_code = function(code)
			return code == 0 or code == 255
		end,
		on_output = function(line, params)
			local severities = { E = 1, D = 1, W = 2, F = 3 }
			return find_entries(line, [[:(%d+):(%d+): (([EDFW])%w+) (.*)]], {
				"row",
				"col",
				"code",
				"severity",
				"message",
			}, severities)
		end,
	}),
}
table.insert(sources, flake8)

local pylint = {
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = { "python" },
	generator = helpers.generator_factory({
		command = "/home/chris/.config/nvim/scripts/pylint.sh",
		to_stdin = true,
		to_stderr = true,
		args = { "$FILENAME" },
		format = "line",
		on_output = function(line, params)
			local severities = { I = 3, R = 4, C = 4, W = 2, E = 1, F = 1 }
			return find_entries(line, [[(%d+):(%d+):(%w):(.*)]], { "row", "col", "severity", "message" }, severities)
		end,
	}),
}
table.insert(sources, pylint)

null_ls.config({ sources = sources })

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	elseif client.resolved_capabilities.document_range_formatting then
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end
end

require("lspconfig")["null-ls"].setup({ on_attach = on_attach })
