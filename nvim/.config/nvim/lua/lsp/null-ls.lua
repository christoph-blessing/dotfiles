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

local create_condition = function(name)
	return function(utils)
		if not utils.root_has_file("pyproject.toml") then
			return false
		end
		local pipe = io.open("pyproject.toml")
		for line in pipe:lines() do
			if line == "[tool." .. name .. "]" then
				return true
			end
		end
	end
end

local create_conditional_source = function(source, name)
	return function()
		local condition = create_condition(name)
		if condition(require("null-ls.utils").make_conditional_utils()) then
			return source
		end
	end
end

local sources = {
	null_ls.builtins.formatting.black.with({
		condition = create_condition("black"),
	}),
	null_ls.builtins.formatting.isort.with({
		condition = create_condition("isort"),
	}),
	null_ls.builtins.formatting.rustfmt,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.diagnostics.shellcheck,
	null_ls.builtins.diagnostics.flake8.with({
		condition = function(utils)
			return utils.root_has_file(".flake8")
		end,
	}),
	null_ls.builtins.diagnostics.mypy.with({
		condition = create_condition("mypy"),
	}),
}

local pylint = {
	method = null_ls.methods.DIAGNOSTICS,
	name = "pylint",
	filetypes = { "python" },
	generator = helpers.generator_factory({
		command = "/home/chris/.config/nvim/scripts/pylint.sh",
		to_stdin = true,
		from_stderr = true,
		args = { "$FILENAME" },
		format = "line",
		on_output = function(line, params)
			local severities = { I = 3, R = 4, C = 4, W = 2, E = 1, F = 1 }
			return find_entries(line, [[(%d+):(%d+):(%w):(.*)]], { "row", "col", "severity", "message" }, severities)
		end,
	}),
}
table.insert(sources, create_conditional_source(pylint, "pylint.master"))

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	elseif client.resolved_capabilities.document_range_formatting then
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end
end

null_ls.setup({ sources = sources, on_attach = on_attach })
